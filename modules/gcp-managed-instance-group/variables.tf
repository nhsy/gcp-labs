variable "region" {
  type        = string
  description = "Region to host the gce instance"
}

variable "service_account" {
  type        = string
  description = "Service account to associate to the bastion host"
}

variable "image" {
  type        = string
  default     = null
  description = "Image URI"
}

variable "machine_type" {
  type        = string
  default     = "g1-small"
  description = "Machine type"
}

variable "name" {
  type        = string
  description = "Instance name"
}

variable "subnetwork" {
  type        = string
  description = "Subnetwork for instance"
}

variable "service_account_scopes" {
  type = list(string)

  default = [
    "https://www.googleapis.com/auth/cloud-platform",
  ]

  description = "Service account scopes"
}

variable "metadata_startup_script" {
  type        = string
  default     = null
  description = "Metadata startup script"
}

variable "tags" {
  type        = list(string)
  default     = null
  description = "Network tags"
}

variable "common_labels" {
  type        = map(string)
  default     = null
  description = "Labels applied to instance"
}

variable "windows-startup-script-ps1" {
  type        = string
  default     = null
  description = "Windows startup powershell script"
}

variable "boot_disk_size" {
  type        = number
  default     = 10
  description = "Boot disk size"
}

variable "boot_disk_type" {
  type        = string
  default     = "pd-standard"
  description = "Boot disk type"
}

variable "kms_key" {
  type        = string
  default     = null
  description = "KMS key URI"
}

variable "max_replicas" {
  type        = number
  description = "Autoscaling max replicas"
  default     = null
}

variable "min_replicas" {
  type        = number
  description = "Autoscaling max replicas"
  default     = null
}

variable "cooldown_period" {
  type        = number
  description = "Autoscaling cooldown period"
  default     = 60
}

variable "target_cpu_utilization" {
  type        = number
  description = "Autoscaling target cpu utilization"
  default     = 0.7
}

variable "preemptible" {
  type        = bool
  default     = false
  description = "Preemptible gce instances"
}

variable "metadata" {
  type        = map(string)
  default     = null
  description = "Instance metadata"
}

variable "autohealing_http_health_check" {
  type        = list(map(string))
  description = "Health check http config"
  default     = []
}

variable "autohealing_http2_health_check" {
  type        = list(map(string))
  description = "Health check http2 config"
  default     = []
}

variable "autohealing_https_health_check" {
  type        = list(map(string))
  description = "Health check https config"
  default     = []
}

variable "autohealing_ssl_health_check" {
  type        = list(map(string))
  description = "Health check ssl config"
  default     = []
}


variable "autohealing_tcp_health_check" {
  type        = list(map(string))
  description = "Health check tcp config"
  default     = []
}

variable "autohealing_check_interval_sec" {
  type        = number
  description = "Health check interval"
  default     = 30
}

variable "autohealing_timeout_sec" {
  type        = number
  description = "Health check timeout"
  default     = 5
}

variable "autohealing_healthy_threshold" {
  type        = number
  description = "Health check healthy threshold"
  default     = 2
}

variable "autohealing_unhealthy_threshold" {
  type        = number
  description = "Health check unhealthy threshold"
  default     = 2
}

variable "autohealing_policies" {
  type = list(object({
    initial_delay_sec = number
  }))
  default = [{ initial_delay_sec = 300 }]
}

variable "network" {
  type        = string
  description = "Network for instance"
}

variable "autoscaling_enable" {
  type        = bool
  default     = true
  description = "Autoscaling enable"
}

variable "target_size" {
  type        = number
  default     = null
  description = "Target number of running instances if autoscaling disabled"
}

variable "update_policy" {
  type        = map(string)
  default     = null
  description = "Update policy for managed instance group"
}