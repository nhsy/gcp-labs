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

variable "mgmt_source_cidr" {
  type        = list(string)
  default     = []
  description = "Management CIDR for remote access"
}

variable "kms_key" {
  type        = string
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

variable "gce_service_account_prefix" {
  type        = string
  default     = "gce"
  description = "GCE service account prefix"
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

variable "bucket_prefix" {
  type        = string
  default     = "transfer"
  description = "Bucket name prefix"
}

variable "iam_user_email" {
  type        = string
  description = "IAM user email"
}

variable "automation_service_account" {
  type        = string
  description = "Automation service account"
}

variable "gce_service_account_roles" {
  type        = list(string)
  description = "GCE service account roles"
  default = [
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/monitoring.viewer"
  ]
}
