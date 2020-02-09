# Bootstrap  
Refer to README.md in parent folder.

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
| iam\_user\_email | IAM user email account | `string` | n/a | yes |
| project\_id | n/a | `string` | n/a | yes |
| project\_name | n/a | `string` | n/a | yes |
| project\_sponsor | n/a | `string` | n/a | yes |
| project\_technical\_lead | n/a | `string` | n/a | yes |
| region | n/a | `string` | n/a | yes |
| bucket\_prefix | n/a | `string` | `"terraform"` | no |
| environment | n/a | `string` | `"dev"` | no |
| kms\_crypto\_key\_prefix | n/a | `string` | `"kms-crypto"` | no |
| kms\_key\_ring\_prefix | n/a | `string` | `"kms-keyring"` | no |

## Outputs

| Name | Description |
|------|-------------|
| compute\_default\_service\_account | n/a |
| kms\_key | KMS crypto key name |
| kms\_key\_crypto\_key\_name | KMS crypto key name |
| kms\_key\_ring\_name | KMS key ring name |
| project\_name | Project name |
| terraform\_bucket\_name | Terraform state bucket name |

