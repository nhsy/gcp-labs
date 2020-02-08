variable "project_id" {
  type        = string
  description = "Project ID to create resources"
}

variable "vpc_prefix" {
  type        = string
  default     = "vpc"
  description = "VPC name prefix"
}

variable "network_cidr" {
  type        = string
  default     = "10.128.0.0/16"
  description = "Network CIDR"
}

variable "region" {
  type        = string
  description = "Region to create resources"
}

variable "router_prefix" {
  type        = string
  default     = "rtr"
  description = "Router name prefix"
}

variable "create_nat_gateway" {
  type        = bool
  default     = false
  description = "Create nat gatway for internal servers"
}

variable "enable_flow_logs" {
  type        = string
  default     = true
  description = "Enable flow logging"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment name"
}

variable "creator" {
  type        = string
  description = "Creator name"
}

variable "automation_prefix" {
  type        = string
  default     = "automation"
  description = "Automation name prefix"
}

variable "automation_failover_prefix" {
  type        = string
  default     = "automation-failover"
  description = "Automation name prefix"
}

variable "mgmt_source_cidr" {
  type        = list(string)
  default     = null
  description = "Management CIDR for remote access"
}

variable "firewall_rule_prefix" {
  type        = string
  default     = "remote-mgmt"
  description = "Firewall rule prefix"
}

variable "automation_startup_filename" {
  type        = string
  default     = "metadata_startup.sh"
  description = "Metadata startup script"
}

variable "machine_type" {
  type = map(string)
  default = {
    automation : "n1-standard-1"
  }
  description = "Machine type"
}

variable "boot_disk_size" {
  type = object({
    automation = number
    td-proxy   = number
  })
  default = {
    automation = 10
    td-proxy   = 10

  }
  description = "Boot disk size"
}

variable "boot_disk_type" {
  type = object({
    automation = string
    td-proxy   = string
  })
  default = {
    automation = "pd-standard"
    td-proxy   = "pd-standard"
  }
  description = "Boot disk type"
}

variable "automation_image" {
  type        = string
  default     = null
  description = "Automation image URI"
}

variable "kms_key" {
  type        = string
  default     = null
  description = "KMS key URI"
}

variable "iap_source_cidrs" {
  type        = list(string)
  default     = ["35.235.240.0/20"]
  description = "IAP cidrs"
}

variable "health_check_source_cidrs" {
  type        = list(string)
  default     = ["35.191.0.0/16", "130.211.0.0/22"]
  description = "Health check cidrs"
}

variable "compute_service_account_prefix" {
  type        = string
  default     = "compute"
  description = "Service account for compute instances"
}

variable "project_name" {
  type = string
}

variable "business_name" {
  type = string
}

variable "cost_code" {
  type = string
}

variable "project_sponsor" {
  type = string
}

variable "project_technical_lead" {
  type = string
}

variable "autohealing_policies" {
  type = list(object({
    initial_delay_sec = number
  }))
  default = []
}

variable "glb_source_cidrs" {
  type        = list(string)
  default     = ["130.211.0.0/22", "35.191.0.0/16"]
  description = "GLB ingress IP source cidrs"
}
