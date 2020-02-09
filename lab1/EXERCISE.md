# Exercise

## Architecture
The diagram below describes the architecture, consisting of the following:
* Bastion GCE instance
* Proxy GCE managed instance group
* Management GCE instance
* Cloud DNS
* Firewall Rules

![diagram](docs/lab1.png)

## Instructions
The main steps to be followed are listed below:

1. Create bastion instance
1. Create proxy managed instance group
1. Create internal load balancer for proxy managed instance group
1. Create management instance
1. SSH into the bastion instance
1. Use the bastion instance as a jumpserver (ssh -J) to SSH into the management instance
1. Setup management instance for terraform
1. Deploy compute instance to private subnet from management instance using terraform

**Note:** Additional steps such as firewall rules have not been listed above.
