###
# Enable IAP access for SSH access
###
resource "google_compute_firewall" "remote_mgmt_iap" {
  name        = "remote-mgmt-iap-${random_id.this.hex}"
  network     = module.vpc.name
  description = "Allow inbound connections from iap"
  direction   = "INGRESS"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  source_ranges = var.iap_source_cidrs
}

###
# Enable health check probes
###
resource "google_compute_firewall" "proxy_health_check" {
  name        = "proxy-healthcheck-${random_id.this.hex}"
  network     = module.vpc.name
  description = "Allow inbound health probes from GCP"
  direction   = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = [3128]
  }

  source_ranges = var.health_check_source_cidrs
  target_tags   = ["proxy"]
}