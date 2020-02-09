variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "bucket_prefix" {
  type    = string
  default = "terraform"
}

variable "creator" {
  type = string
}

variable "creation_date" {
  type    = string
  default = null
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

variable "kms_key_ring_prefix" {
  type    = string
  default = "kms-keyring"
}

variable "kms_crypto_key_prefix" {
  type    = string
  default = "kms-crypto"
}

variable "iam_user_email" {
  type        = string
  description = "IAM user email account"
}