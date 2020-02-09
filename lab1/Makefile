.PHONY= help setup init plan apply apply2 destroy destroy-target refresh clean validate update all
.ONESHELL:
SHELL := /bin/bash
WS ?= dev1
KMS_KEY ?=$(shell cat bootstrap/kms_key.out)
OS ?=linux
PLAN_FILE=plan-$(WS).out
TERRAFORM_BIN=terraform
TERRAFORM_BUCKET ?=$(shell cat bootstrap/terraform_bucket_name.out)
COMMON_TFVARS=vars/common.tfvars
WS_TFVARS=vars/ws-$(WS).tfvars
ZONE ?= europe-west2-a

help:
	@echo "help ..."

set-env:
	@if [ -z $(WS) ]; then \
		echo "WS was not set"; \
		ERROR=1; \
	else \
		echo "WS: $(WS)"; \
	fi

	@if [ ! -f "$(WS_TFVARS)" ]; then \
		echo "Could not find workspace variables file: $(WS_TFVARS)" ;\
		ERROR=1; \
	fi

	@if [ -z $(TERRAFORM_BUCKET) ]; then \
		echo "TERRAFORM_BUCKET was not set" ;\
		ERROR=1; \
	else \
		echo "TERRAFORM_BUCKET: $(TERRAFORM_BUCKET)" ;\
	fi

	@if [ ! -z $${ERROR} ] && [ $${ERROR} -eq 1 ]; then \
		exit 1; \
	fi

bootstrap-init:
	@echo "Initialising bootstrap terraform backend"
	@cd bootstrap && \
	$(TERRAFORM_BIN) init \
		-input=false

bootstrap-validate:
	@echo "Validating bootstrap terraform backend"
	@cd bootstrap && \
	$(TERRAFORM_BIN) validate

bootstrap-plan: bootstrap-init
	@echo "Planning bootstrap terraform ..."
	@cd bootstrap && \
	$(TERRAFORM_BIN) plan \
		-input=false \
		-refresh=true \
		-var-file="../$(COMMON_TFVARS)" \
		-out=bootstrap.out

bootstrap-apply:
	@echo "Applying bootstrap terraform ..."
	@cd bootstrap && \
	$(TERRAFORM_BIN) apply \
		-input=false \
		bootstrap.out && \
	rm bootstrap.out && \
	$(TERRAFORM_BIN) output terraform_bucket_name > terraform_bucket_name.out && \
	$(TERRAFORM_BIN) output kms_key > kms_key.out

bootstrap-output:
	@echo "$@ ..."
	@cd bootstrap  && \
	$(TERRAFORM_BIN) output

bootstrap-destroy:
	@echo "Destroying bootstrap terraform ..."
	@cd bootstrap  && \
	$(TERRAFORM_BIN) destroy \
		-input=false \
		-var-file="../$(COMMON_TFVARS)" && \
	rm *.out

bootstrap-clean:
	@echo "Cleaning bootstrap terraform ..."
	@cd bootstrap && \
	rm -rf .terraform/ ;\
	rm -rf terraform.tfstate* ;\
	rm *.out ;\
	echo cleaning complete

init: set-env
	@echo "Initialising terraform backend"
	@$(TERRAFORM_BIN) init \
		-backend=true \
		-backend-config="bucket=$(TERRAFORM_BUCKET)" \
		-var-file="$(COMMON_TFVARS)" \
		-var-file="$(WS_TFVARS)"
	@echo "Switching to workspace $(WS)"
	@$(TERRAFORM_BIN) workspace select $(WS) || $(TERRAFORM_BIN) workspace new $(WS)

prep:
	@echo "Switching to workspace $(WS)"
	@$(TERRAFORM_BIN) workspace select $(WS) || $(TERRAFORM_BIN) workspace new $(WS)

refresh: set-env prep
	@echo "$@ ..."
	@$(TERRAFORM_BIN) refresh \
		-input=false \
		-var-file="$(COMMON_TFVARS)" \
		-var-file="$(WS_TFVARS)"

update:
	@echo "$@ ..."
	@$(TERRAFORM_BIN) get \
		--update=true

validate: set-env prep
	@echo "$@ ..."
	@$(TERRAFORM_BIN) validate

plan: set-env prep
	@echo "$@ ..."
	@$(TERRAFORM_BIN) plan \
		-input=false \
		-refresh=true \
		-var-file="$(COMMON_TFVARS)" \
		-var-file="$(WS_TFVARS)" \
		-var kms_key="$(KMS_KEY)" \
		-out=$(PLAN_FILE)

plan-target: set-env prep
	@echo "$@ ..."
	@$(TERRAFORM_BIN) plan \
		-input=false \
		-refresh=true \
		-var-file="$(COMMON_TFVARS)" \
		-var-file="$(WS_TFVARS)" \
		-var kms_key="$(KMS_KEY)" \
		-target $(RESOURCE) \
		-out=$(PLAN_FILE)

apply: set-env prep
	@echo "$@ ..."
	@$(TERRAFORM_BIN) apply \
		-input=false \
		$(PLAN_FILE)
	@rm $(PLAN_FILE)

apply2: set-env prep
	@echo "$@ ..."
	@$(TERRAFORM_BIN) apply \
		-input=false \
		-refresh=true \
		-var-file="$(COMMON_TFVARS)" \
		-var-file="$(WS_TFVARS)"

destroy: set-env prep
	@echo "destroy ..."
	@export TF_WARN_OUTPUT_ERRORS=1
	@$(TERRAFORM_BIN) destroy \
		-input=false \
		-refresh=true \
		-var-file="$(COMMON_TFVARS)" \
		-var-file="$(WS_TFVARS)" \
		-var kms_key="$(KMS_KEY)"

destroy-target: set-env prep
	@echo "$@ ..."
	@export TF_WARN_OUTPUT_ERRORS=1
	@$(TERRAFORM_BIN) destroy \
		-input=false \
		-refresh=true \
		-var-file="$(COMMON_TFVARS)" \
		-var-file="$(WS_TFVARS)" \
		-target $(RESOURCE)

taint: set-env prep
	@echo "$@ ..."
	@$(TERRAFORM_BIN) taint \
		$(RESOURCE)

output: prep
	@echo "$@ ..."
	@$(TERRAFORM_BIN) output

clean:
	@echo "cleaning ..."
	-$(TERRAFORM_BIN) workspace select default
	-$(TERRAFORM_BIN) workspace delete $(WS)
	-rm -rf .terraform/ || true
	-rm -rf terraform.tfstate* || true
	-rm *.out || true
	@echo cleaning complete

all: init plan apply
