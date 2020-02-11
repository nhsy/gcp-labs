## Providers

| Name | Version |
|------|---------|
| google | ~> 3.7 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| enable\_flow\_logs | boolean value to determine whether to enable flow logs | `bool` | n/a | yes |
| ip\_cidr\_range | ip CIDR range | `string` | n/a | yes |
| network | the network which the subnet should belong to | `string` | n/a | yes |
| region | subnet region | `string` | n/a | yes |
| subnet\_name | subnet name | `string` | n/a | yes |
| private\_ip\_google\_access | boolean value to determine whether to allow private ips to access google services | `bool` | `false` | no |
| secondary\_ip\_ranges | secondary ip CIDR ranges | <pre>list(object({<br>    range_name    = string<br>    ip_cidr_range = string<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| ip\_cidr\_range | IP CIDR range |
| name | Name of the subnetwork |
| secondary\_ip\_ranges | Secondary IP CIDR ranges |
| self\_link | The self link of the subnetwork |

