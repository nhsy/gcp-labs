# Module: vpc  

## Providers

| Name | Version |
|------|---------|
| google | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| common\_labels | n/a | `map(string)` | n/a | yes |
| nat\_router\_name | NAT router name | `string` | n/a | yes |
| project\_id | Project id | `string` | n/a | yes |
| region | Region to host the vpc | `string` | n/a | yes |
| router\_name | Router name | `string` | n/a | yes |
| vpc\_name | VPC name | `string` | n/a | yes |
| create\_nat\_gateway | Create nat gatway for internal servers | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| name | VPC name |
| self\_link | VPC name |

