## Providers

| Name | Version |
|------|---------|
| google | ~> 3.7 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| common\_labels | Labels applied to instance | `map` | n/a | yes |
| image | Image URI | `string` | n/a | yes |
| kms\_key | KMS key URI | `string` | n/a | yes |
| metadata | Instance metadata | `map` | n/a | yes |
| metadata\_startup\_script | Metadata startup script | `string` | n/a | yes |
| name | Instance name | `string` | n/a | yes |
| network | Network for instance | `string` | n/a | yes |
| region | Region to host the gce instance | `string` | n/a | yes |
| service\_account | Service account to associate to the host | `string` | n/a | yes |
| subnetwork | Subnetwork for instance | `string` | n/a | yes |
| tags | Network tags | `list(string)` | n/a | yes |
| zone | Zone to host the gce instance | `string` | n/a | yes |
| boot\_disk\_size | Boot disk size | `number` | `10` | no |
| boot\_disk\_type | Boot disk type | `string` | `"pd-standard"` | no |
| machine\_type | Machine type | `string` | `"g1-small"` | no |
| service\_account\_scopes | Service account scopes | `list(string)` | <pre>[<br>  "https://www.googleapis.com/auth/cloud-platform"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| name | Instance name |
| private\_ip | Instance private ip address |
| zone | Instance zone |

