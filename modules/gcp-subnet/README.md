# Module: subnet
Creates subnetworks:

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| enable\_flow\_logs | Enable flow logging | string | `"false"` | no |
| ip\_cidr\_range | IP CIDR range | string | n/a | yes |
| network | Network name | string | n/a | yes |
| private\_ip\_google\_access | Project id | bool | `"false"` | no |
| region | Region to host the subnet | string | n/a | yes |
| subnet\_name | Subnet name | string | n/a | yes |
| secondary_ip_ranges | Secondary IP CIDR ranges | list(object({range_name=string ip_cidr_range = string}))  | [] | no |
| 
## Outputs

| Name | Description |
|------|-------------|
| ip\_cidr\_range | IP CIDR range 
| name | Name of the subnetwork |
| secondary_ip_ranges | Secondary IP CIDR ranges |
| self\_name | The self link of the subnetwork |

