###
# Generate randon id to append to every created resource name
###
resource "random_id" "this" {
  byte_length = 3
}

###
# Create common labels
###
module "labels" {
  source = "../modules/gcp-labels"

  project_id             = var.project_id
  environment            = var.environment
  creator                = var.creator
  project_name           = var.project_name
  business_name          = var.business_name
  cost_code              = var.cost_code
  project_sponsor        = var.project_sponsor
  project_technical_lead = var.project_technical_lead
  review_date            = replace(substr(timeadd(timestamp(), "168h"), 0, 10), "-", "")
}

###
# Create unique names for resources
###
locals {
  vpc_name                = format("%s-%s", var.vpc_prefix, random_id.this.hex)
  router_name             = format("%s-%s", var.router_prefix, random_id.this.hex)
  automation_name         = format("%s-%s", var.automation_prefix, random_id.this.hex)
  compute_service_account = format("%s-%s", var.compute_service_account_prefix, random_id.this.hex)
  bucket_name             = format("%s-%s", var.bucket_prefix, random_id.this.hex)

  common_metadata = {
    environment = var.environment
    project     = var.project_id
    workspace   = terraform.workspace
  }
}
