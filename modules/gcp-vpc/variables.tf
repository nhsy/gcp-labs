variable "project_id" {
  type        = string
  description = "Project id"
}

variable "vpc_name" {
  type        = string
  description = "VPC name"
}

variable "region" {
  type        = string
  description = "Region to host the vpc"
}

variable "router_name" {
  type        = string
  description = "Router name"
}

variable "nat_router_name" {
  type        = string
  description = "NAT router name"
  default     = null
}

variable "create_nat_gateway" {
  type        = bool
  default     = true
  description = "Create nat gatway for internal servers"
}

variable "common_labels" {
  type    = map(string)
  default = null
}