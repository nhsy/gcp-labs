###
# Create GCS bucket for terraform state
###
resource "google_storage_bucket" "terraform" {
  name               = local.bucket_name
  bucket_policy_only = true
  force_destroy      = true
  labels             = module.labels.rendered
  location           = var.region

  encryption {
    default_kms_key_name = google_kms_crypto_key.crypto_key.self_link
  }

  versioning {
    enabled = true
  }

  lifecycle {
    ignore_changes = [labels]
  }
}
