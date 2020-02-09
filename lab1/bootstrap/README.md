# Bootstrap  
Refer to [README.md](../README.md) in the parent folder.

## Providers

| Name | Version |
|------|---------|
| google | ~> 3.7 |
| random | ~> 2.2 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| business\_name | n/a | `string` | n/a | yes |
| cost\_code | n/a | `string` | n/a | yes |
| creation\_date | n/a | `string` | n/a | yes |
| creator | n/a | `string` | n/a | yes |
| impersonate\_user\_email | Impersonate user email | `string` | n/a | yes |
| project\_id | n/a | `string` | n/a | yes |
| project\_name | n/a | `string` | n/a | yes |
| project\_sponsor | n/a | `string` | n/a | yes |
| project\_technical\_lead | n/a | `string` | n/a | yes |
| region | n/a | `string` | n/a | yes |
| automation\_service\_account\_prefix | Automation service account prefix | `string` | `"automation"` | no |
| automation\_service\_account\_roles | Automation service account roles | `list(string)` | <pre>[<br>  "roles/compute.instanceAdmin.v1",<br>  "roles/compute.networkAdmin",<br>  "roles/compute.securityAdmin",<br>  "roles/compute.storageAdmin",<br>  "roles/iam.serviceAccountAdmin",<br>  "roles/resourcemanager.projectIamAdmin",<br>  "roles/storage.admin"<br>]</pre> | no |
| bucket\_prefix | n/a | `string` | `"terraform"` | no |
| environment | n/a | `string` | `"dev"` | no |
| kms\_crypto\_key\_prefix | n/a | `string` | `"kms-crypto"` | no |
| kms\_key\_ring\_prefix | n/a | `string` | `"kms-keyring"` | no |

## Outputs

| Name | Description |
|------|-------------|
| automation\_service\_account | n/a |
| compute\_default\_service\_account | n/a |
| kms\_key | KMS crypto key name |
| kms\_key\_crypto\_key\_name | KMS crypto key name |
| kms\_key\_ring\_name | KMS key ring name |
| project\_name | Project name |
| terraform\_bucket\_name | Terraform state bucket name |

