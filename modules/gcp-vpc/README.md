# Module: vpc

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| create\_nat\_gateway | Create nat gatway for internal servers | string | `"false"` | no |
| enable\_flow\_logs | Enable flow logging | string | `"false"` | no |
| nat\_router\_name | NAT router name | string | n/a | yes |
| network\_cidr | Network CIDR | string | `"10.0.0.0/16"` | no |
| project\_id | Project id | string | n/a | yes |
| region | Region to host the vpc | string | `"europe-west-2"` | no |
| router\_name | Router name | string | n/a | yes |
| subnetwork-suffix | Subnetwork suffix random id | string | n/a | yes |
| vpc\_name | VPC name | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| name | VPC name |