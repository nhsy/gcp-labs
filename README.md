# Labs

# Description
Terraform state bucket and workspaces are utilised to allow multiple deployments.

The terraform script consists of 2 stages:
1. Bootstrap deployment
1. Component deployment


# Usage
## Booststrap
This stage deploys the following components:
* GCS Bucket for terraform state
* KMS Key Ring
* KMS Key Crypto Key

## Components
This stage deploys the following components:
* VPC
* Subnetworks
* Firewall Rules


## Pre-requisites
Create the file named bootstrap/bootstrap.auto.tfvars and populate variables accordingly.
```hcl-terraform
region                  = "europe-west2"
project_id              = "gcp-project-id"
project_name            = "my-project"
project_sponsor         = "joe-bloggs"
project_technical_lead  = "joe-bloggs"
cost_code               = "123456"
business_name           = "dept-1"
creator                 = "owner"
```

Create the file named vars/ws-dev1.tfvars and populate variables accordingly.
```hcl-terraform
region                  = "europe-west2"
project_id              = "gcp-project-id"
project_name            = "my-project"
project_sponsor         = "joe-bloggs"
project_technical_lead  = "joe-bloggs"
cost_code               = "123456"
business_name           = "dept-1"
creator                 = "owner"

subnetwork = {
  name         = "subnet"
  cidr         = "10.0.32.0/24"

}
```

## Bootstrap
Make sure the following essential APIs are enabled on your project:

```
gcloud services enable cloudkms.googleapis.com
gcloud services enable compute.googleapis.com
gcloud services enable iam.googleapis.com
gcloud services enable storage-api.googleapis.com
```

The commands below will download the required terraform executable and initialise the terraform state bucket.
```
make bootstrap-init
make bootstrap-plan
make bootstrap-apply
```

## Component Deployment
The commands below will deploy the infrastructure components to GCP.
```
make init 
make plan 
make apply
```

## Component Deletion
The commands below will destroy the infrastructure components in GCP.
```
make destroy
 ```


## (Mostly) complete deletion of all resources
The commands will destroy the Component Deployment as well as the bootstrap deployment
```
make destroy
make clean
make bootstrap-destroy
make bootstrap-clean
```

NOTE: This process is mostly complete as the Cloud KMS keys and key rings are left behind as currently there isn't a process to delete all key versions

## Deploy into another terraform workspace
Create the file named vars/ws-*dev2*.tfvars and populate variables accordingly.

The command below will deploy all the components into the terraform workspace *dev2*.
```
WS=dev2 make init 
WS=dev2 make plan 
WS=dev2 make apply
```
