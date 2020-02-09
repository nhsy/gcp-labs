###
# Create KMS key ring and crypto key
###
resource "google_kms_key_ring" "key_ring" {
  name     = local.kms_key_ring_name
  location = var.region
}

resource "google_kms_crypto_key" "crypto_key" {
  name     = local.kms_crypto_name
  key_ring = google_kms_key_ring.key_ring.id
  labels   = module.labels.rendered

  lifecycle {
    ignore_changes = [labels]
  }
}

###
# Add compute service account to keyring
###
resource "google_kms_key_ring_iam_member" "iam_binding_1" {
  key_ring_id = google_kms_key_ring.key_ring.id
  role        = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member      = format("serviceAccount:%s", data.google_compute_default_service_account.default.email)
}

###
# Add project service account to keyring for gcs
###
resource "google_kms_key_ring_iam_member" "iam_binding_2" {
  key_ring_id = google_kms_key_ring.key_ring.id
  role        = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member      = format("serviceAccount:%s", data.google_storage_project_service_account.default.email_address)
}
