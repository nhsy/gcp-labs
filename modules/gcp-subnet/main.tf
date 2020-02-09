resource "google_compute_subnetwork" "this" {
  name                     = var.subnet_name
  ip_cidr_range            = var.ip_cidr_range
  region                   = var.region
  network                  = var.network
  private_ip_google_access = var.private_ip_google_access

  dynamic "log_config" {
    for_each = local.enable_flow_logs
    content {
      aggregation_interval = "INTERVAL_10_MIN"
      flow_sampling        = 0.5
      metadata             = "INCLUDE_ALL_METADATA"
    }
  }


  dynamic "secondary_ip_range" {
    for_each = var.secondary_ip_ranges
    content {
      range_name    = secondary_ip_range.value["range_name"]
      ip_cidr_range = secondary_ip_range.value["ip_cidr_range"]
    }
  }
}

locals {
  enable_flow_logs = var.enable_flow_logs ? [0] : []
}