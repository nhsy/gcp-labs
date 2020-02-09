output "terraform_bucket_name" {
  value       = google_storage_bucket.terraform.name
  description = "Terraform state bucket name"
}

output "kms_key_ring_name" {
  value       = google_kms_key_ring.key_ring.name
  description = "KMS key ring name"
}

output "kms_key_crypto_key_name" {
  value       = google_kms_crypto_key.crypto_key.name
  description = "KMS crypto key name"
}

output "kms_key" {
  value       = google_kms_crypto_key.crypto_key.self_link
  description = "KMS crypto key name"
}

output "project_name" {
  value       = var.project_name
  description = "Project name"
}

output "compute_default_service_account" {
  value = data.google_compute_default_service_account.default.email
}
