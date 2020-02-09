###
# Create GCS bucket for file transfer
###
resource "google_storage_bucket" "transfer" {
  name               = local.bucket_name
  bucket_policy_only = true
  force_destroy      = true
  labels             = module.labels.rendered
  location           = var.region

  encryption {
    default_kms_key_name = var.kms_key
  }

  lifecycle {
    ignore_changes = [labels]
  }
}