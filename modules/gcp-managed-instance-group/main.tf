/**
* # Module: gcp-managed-instance-group
*/


###
# Create instance template
###
resource "google_compute_instance_template" "this" {
  name_prefix = "${var.name}-"

  machine_type = var.machine_type

  disk {
    source_image = var.image
    disk_size_gb = var.boot_disk_size
    disk_type    = var.boot_disk_type

    disk_encryption_key {
      kms_key_self_link = var.kms_key
    }
  }

  network_interface {
    subnetwork = var.subnetwork
  }

  metadata                = merge(local.metadata, var.metadata)
  metadata_startup_script = var.metadata_startup_script

  service_account {
    email  = var.service_account
    scopes = var.service_account_scopes
  }

  scheduling {
    automatic_restart   = var.preemptible ? false : true
    on_host_maintenance = var.preemptible ? "TERMINATE" : "MIGRATE"
    preemptible         = var.preemptible
  }

  labels = var.common_labels
  tags   = var.tags

  lifecycle {
    create_before_destroy = true
    ignore_changes        = [labels]
  }
}

resource "google_compute_region_instance_group_manager" "this" {
  provider           = "google-beta"
  name               = var.name
  base_instance_name = var.name

  region = var.region
  # set target size if autoscaling disabled
  target_size = ! var.autoscaling_enable && var.target_size != null ? var.target_size : null

  version {
    instance_template = google_compute_instance_template.this.self_link
    name              = var.name
  }

  dynamic "auto_healing_policies" {
    for_each = var.autohealing_policies
    content {
      health_check      = google_compute_health_check.this[0].self_link
      initial_delay_sec = auto_healing_policies.value["initial_delay_sec"]
    }
  }
}

###
# Create regional autoscaler
###
resource "google_compute_region_autoscaler" "this" {
  count  = var.autoscaling_enable ? 1 : 0
  name   = var.name
  region = var.region
  target = google_compute_region_instance_group_manager.this.self_link

  autoscaling_policy {
    max_replicas    = var.max_replicas
    min_replicas    = var.min_replicas
    cooldown_period = var.cooldown_period

    cpu_utilization {
      target = var.target_cpu_utilization
    }
  }
}

###
# Create health check if auto healing policies are defined
###
resource "google_compute_health_check" "this" {
  count               = local.autohealing_health_check_enable ? 1 : 0
  name                = var.name
  check_interval_sec  = var.autohealing_check_interval_sec
  timeout_sec         = var.autohealing_timeout_sec
  healthy_threshold   = var.autohealing_healthy_threshold
  unhealthy_threshold = var.autohealing_unhealthy_threshold

  ###
  # Use dynamic terraform blocks to set health check type
  ###
  dynamic "http_health_check" {
    for_each = var.autohealing_http_health_check
    content {
      port = http_health_check.value["port"]
    }
  }

  dynamic "https_health_check" {
    for_each = var.autohealing_https_health_check
    content {
      port = https_health_check.value["port"]
    }
  }

  dynamic "http2_health_check" {
    for_each = var.autohealing_http2_health_check
    content {
      port = http2_health_check.value["port"]
    }
  }

  dynamic "ssl_health_check" {
    for_each = var.autohealing_ssl_health_check
    content {
      port = ssl_health_check.value["port"]
    }
  }

  dynamic "tcp_health_check" {
    for_each = var.autohealing_tcp_health_check
    content {
      port = tcp_health_check.value["port"]
    }
  }
}

locals {
  autohealing_health_check_enable = length(var.autohealing_http_health_check) > 0 || length(var.autohealing_https_health_check) > 0 || length(var.autohealing_http2_health_check) > 0 || length(var.autohealing_ssl_health_check) > 0 || length(var.autohealing_tcp_health_check) > 0

  metadata = {
    windows-startup-script-ps1 = var.windows-startup-script-ps1
  }
}
