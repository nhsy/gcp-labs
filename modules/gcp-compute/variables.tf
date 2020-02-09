variable "region" {
  type        = string
  description = "Region to host the gce instance"
}

variable "zone" {
  type        = string
  default     = null
  description = "Zone to host the gce instance"
}

variable "service_account" {
  type        = string
  description = "Service account to associate to the host"
}

variable "image" {
  type        = string
  description = "Image URI"
  default     = null
}

variable "machine_type" {
  type        = string
  description = "Machine type"
  default     = "g1-small"
}

variable "name" {
  type        = string
  description = "Instance name"
}

variable "network" {
  type        = string
  description = "Network for instance"
}

variable "subnetwork" {
  type        = string
  description = "Subnetwork for instance"
}

variable "service_account_scopes" {
  type        = list(string)
  description = "Service account scopes"

  default = [
    "https://www.googleapis.com/auth/cloud-platform"
  ]
}

variable "metadata_startup_script" {
  type        = string
  description = "Metadata startup script"
  default     = null
}

variable "tags" {
  type        = list(string)
  description = "Network tags"
  default     = null
}

variable "common_labels" {
  type        = "map"
  description = "Labels applied to instance"
  default     = null
}

variable "boot_disk_size" {
  type        = number
  description = "Boot disk size"
  default     = 10
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

variable "metadata" {
  type        = "map"
  default     = null
  description = "Instance metadata"
}
