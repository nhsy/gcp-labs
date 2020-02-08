/**
*# Bootstrap
*
*Refer to README.md in parent folder.
*
*/

###
# Generate randon id to append to every created resource name
###
resource "random_id" "this" {
  byte_length = 3
}

###
# Create common labels
###
module "labels" {
  source = "../modules/gcp-labels"

  business_name          = var.business_name
  creator                = var.creator
  creation_date          = var.creation_date != null ? var.creation_date : replace(substr(timestamp(), 0, 10), "-", "")
  cost_code              = var.cost_code
  environment            = var.environment
  project_id             = var.project_id
  project_name           = var.project_name
  project_sponsor        = var.project_sponsor
  project_technical_lead = var.project_technical_lead
  review_date            = replace(substr(timeadd(timestamp(), "168h"), 0, 10), "-", "")
}

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

locals {
  bucket_name       = "${var.bucket_prefix}-${var.environment}-${random_id.this.hex}"
  kms_key_ring_name = "${var.kms_key_ring_prefix}-${random_id.this.hex}"
  kms_crypto_name   = "${var.kms_crypto_key_prefix}-${random_id.this.hex}"
}
