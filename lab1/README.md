# Lab 1 

# Description
The terraform script consists of 2 stages:
1. Bootstrap deployment
1. Component deployment


## Architecture
The diagram below describes the architecture, consisting of the following:
* Bastion GCE instance
* Proxy GCE managed instance group
* Management GCE instance
* Cloud DNS
* Firewall Rules

![diagram](docs/lab1.png)

# Usage
## Booststrap
This stage deploys the following components:
* GCS Bucket for terraform state
* KMS Key Ring
* KMS Key Crypto Key

## Pre-requisites
Create the file named vars/common.tfvars and populate variables accordingly.
```hcl
region                  = "europe-west2"
project_id              = "gcp-project-id"
project_name            = "my-project"
project_sponsor         = "joe-bloggs"
project_technical_lead  = "joe-bloggs"
cost_code               = "123456"
business_name           = "dept-1"
creator                 = "owner"
iam_user_email          = "user@domain"
```

Create the file named vars/ws-dev1.tfvars and populate variables accordingly.
```hcl

```

## Bootstrap
Make sure the following essential APIs are enabled on your project:

```shell script
for api in \
    cloudkms.googleapis.com \
    compute.googleapis.com \
    iam.googleapis.com \
    iap.googleapis.com \
    storage-api.googleapis.com; \
    do; \
        echo enabling $api; \
        gcloud services enable $api; \
    done 

```

The commands below will download the required terraform executable and initialise the terraform state bucket.
```shell script
make bootstrap-init
make bootstrap-plan
make bootstrap-apply
```

## Component Deployment
The commands below will deploy the infrastructure components to GCP.
```shell script
make init 
make plan 
make apply
```

## Component Deletion
The commands below will destroy the infrastructure components in GCP.
```shell script
make destroy
 ```


## (Mostly) complete deletion of all resources
The commands will destroy the Component Deployment as well as the bootstrap deployment
```shell script
make destroy
make clean
make bootstrap-destroy
make bootstrap-clean
```

NOTE: This process is mostly complete as the Cloud KMS keys and key rings are left behind as currently there isn't a process to delete all key versions

## Deploy into another terraform workspace
Create the file named vars/ws-*dev2*.tfvars and populate variables accordingly.

The command below will deploy all the components into the terraform workspace *dev2*.
```shell script
WS=dev2 make init 
WS=dev2 make plan 
WS=dev2 make apply
```

# Exercise
Details of the lab exercise are detailed in [EXERCISE.md]

# Parameters

## Providers

| Name | Version |
|------|---------|
| google | ~> 3.7 |
| http | ~> 1.1 |
| random | ~> 2.2 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| business\_name | n/a | `string` | n/a | yes |
| cost\_code | n/a | `string` | n/a | yes |
| creator | Creator name | `string` | n/a | yes |
| iam\_user\_email | IAM user email account | `string` | n/a | yes |
| kms\_key | KMS key URI | `string` | n/a | yes |
| project\_id | Project ID to create resources | `string` | n/a | yes |
| project\_name | n/a | `string` | n/a | yes |
| project\_sponsor | n/a | `string` | n/a | yes |
| project\_technical\_lead | n/a | `string` | n/a | yes |
| region | Region to create resources | `string` | n/a | yes |
| autohealing\_policies | n/a | <pre>list(object({<br>    initial_delay_sec = number<br>  }))</pre> | `[]` | no |
| automation\_prefix | Automation name prefix | `string` | `"automation"` | no |
| bucket\_prefix | Bucket name prefix | `string` | `"transfer"` | no |
| compute\_service\_account\_prefix | Service account for compute instances | `string` | `"compute"` | no |
| create\_nat\_gateway | Create nat gatway for internal servers | `bool` | `false` | no |
| enable\_flow\_logs | Enable flow logging | `string` | `true` | no |
| environment | Environment name | `string` | `"dev"` | no |
| glb\_source\_cidrs | GLB ingress IP source cidrs | `list(string)` | <pre>[<br>  "130.211.0.0/22",<br>  "35.191.0.0/16"<br>]</pre> | no |
| health\_check\_source\_cidrs | Health check cidrs | `list(string)` | <pre>[<br>  "35.191.0.0/16",<br>  "130.211.0.0/22"<br>]</pre> | no |
| iap\_source\_cidrs | IAP cidrs | `list(string)` | <pre>[<br>  "35.235.240.0/20"<br>]</pre> | no |
| mgmt\_source\_cidr | Management CIDR for remote access | `list(string)` | `[]` | no |
| network\_cidr | Network CIDR | `string` | `"10.128.0.0/16"` | no |
| router\_prefix | Router name prefix | `string` | `"rtr"` | no |
| vpc\_prefix | VPC name prefix | `string` | `"vpc"` | no |

## Outputs

| Name | Description |
|------|-------------|
| labels | n/a |
| private\_subnet\_ip\_cidr\_range | n/a |
| private\_subnet\_name | n/a |
| public\_subnet\_ip\_cidr\_range | n/a |
| public\_subnet\_name | n/a |
| transfer\_bucket\_name | n/a |
| vpc\_name | n/a |

