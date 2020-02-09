variable "subnet_name" {
  type        = string
  description = "subnet name"
}

variable "ip_cidr_range" {
  type        = string
  description = "ip CIDR range"
}

variable "region" {
  type        = string
  description = "subnet region"
}

variable "network" {
  type        = string
  description = "the network which the subnet should belong to"
}

variable "enable_flow_logs" {
  type        = bool
  description = "boolean value to determine whether to enable flow logs"
}

variable "private_ip_google_access" {
  type        = bool
  default     = false
  description = "boolean value to determine whether to allow private ips to access google services"
}

variable "secondary_ip_ranges" {
  type = list(object({
    range_name    = string
    ip_cidr_range = string
  }))
  description = "secondary ip CIDR ranges"
  default     = []
}