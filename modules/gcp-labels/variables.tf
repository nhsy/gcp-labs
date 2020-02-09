variable "project_id" {
  type        = string
  description = "Project ID to create resources"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "creator" {
  type        = string
  description = "Creator name"
}

variable "project_name" {
  type        = string
  description = "Project name"
}

variable "business_name" {
  type        = string
  description = "Business name"
}

variable "cost_code" {
  type        = string
  description = "Code Code"
}

variable "creation_date" {
  type        = string
  default     = ""
  description = "Creation date"

}

variable "project_sponsor" {
  type        = string
  description = "Project sponsor name"
}

variable "project_technical_lead" {
  type        = string
  description = "Project technical lead"
}

variable "review_date" {
  type        = string
  default     = ""
  description = "Review date"
}

variable "state" {
  type        = string
  description = "Resource state"
  default     = "active"
}
