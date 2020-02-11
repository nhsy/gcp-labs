# Module: gcp-managed-instance-group

## Providers

| Name | Version |
|------|---------|
| google | ~> 3.7 |
| google-beta | ~> 3.7 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| common\_labels | Labels applied to instance | `map(string)` | n/a | yes |
| image | Image URI | `string` | n/a | yes |
| kms\_key | KMS key URI | `string` | n/a | yes |
| max\_replicas | Autoscaling max replicas | `number` | n/a | yes |
| metadata | Instance metadata | `map(string)` | n/a | yes |
| metadata\_startup\_script | Metadata startup script | `string` | n/a | yes |
| min\_replicas | Autoscaling max replicas | `number` | n/a | yes |
| name | Instance name | `string` | n/a | yes |
| network | Network for instance | `string` | n/a | yes |
| region | Region to host the gce instance | `string` | n/a | yes |
| service\_account | Service account to associate to the bastion host | `string` | n/a | yes |
| subnetwork | Subnetwork for instance | `string` | n/a | yes |
| tags | Network tags | `list(string)` | n/a | yes |
| target\_size | Target number of running instances if autoscaling disabled | `number` | n/a | yes |
| update\_policy | Update policy for managed instance group | `map(string)` | n/a | yes |
| windows-startup-script-ps1 | Windows startup powershell script | `string` | n/a | yes |
| autohealing\_check\_interval\_sec | Health check interval | `number` | `30` | no |
| autohealing\_healthy\_threshold | Health check healthy threshold | `number` | `2` | no |
| autohealing\_http2\_health\_check | Health check http2 config | `list(map(string))` | `[]` | no |
| autohealing\_http\_health\_check | Health check http config | `list(map(string))` | `[]` | no |
| autohealing\_https\_health\_check | Health check https config | `list(map(string))` | `[]` | no |
| autohealing\_policies | n/a | <pre>list(object({<br>    initial_delay_sec = number<br>  }))</pre> | <pre>[<br>  {<br>    "initial_delay_sec": 300<br>  }<br>]</pre> | no |
| autohealing\_ssl\_health\_check | Health check ssl config | `list(map(string))` | `[]` | no |
| autohealing\_tcp\_health\_check | Health check tcp config | `list(map(string))` | `[]` | no |
| autohealing\_timeout\_sec | Health check timeout | `number` | `5` | no |
| autohealing\_unhealthy\_threshold | Health check unhealthy threshold | `number` | `2` | no |
| autoscaling\_enable | Autoscaling enable | `bool` | `true` | no |
| boot\_disk\_size | Boot disk size | `number` | `10` | no |
| boot\_disk\_type | Boot disk type | `string` | `"pd-standard"` | no |
| cooldown\_period | Autoscaling cooldown period | `number` | `60` | no |
| machine\_type | Machine type | `string` | `"g1-small"` | no |
| preemptible | Preemptible gce instances | `bool` | `false` | no |
| service\_account\_scopes | Service account scopes | `list(string)` | <pre>[<br>  "https://www.googleapis.com/auth/cloud-platform"<br>]</pre> | no |
| target\_cpu\_utilization | Autoscaling target cpu utilization | `number` | `0.7` | no |

## Outputs

| Name | Description |
|------|-------------|
| google\_compute\_instance\_template | n/a |

