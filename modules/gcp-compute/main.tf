resource "google_compute_instance" "this" {
  name = var.name

  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.boot_disk_size
      type  = var.boot_disk_type
    }
    kms_key_self_link = var.kms_key
  }


  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    //    access_config {
    //      // REQUIRED TO ALLOW SSH
    //    }
  }

  metadata                = var.metadata
  metadata_startup_script = var.metadata_startup_script

  service_account {
    email  = var.service_account
    scopes = var.service_account_scopes
  }

  labels = var.common_labels
  tags   = var.tags

  allow_stopping_for_update = true

  lifecycle {
    ignore_changes = [labels]
  }
}
