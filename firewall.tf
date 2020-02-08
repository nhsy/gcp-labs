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
    ports    = [8118]
  }

  source_ranges = var.health_check_source_cidrs
  target_tags   = ["proxy"]
}

resource "google_compute_firewall" "td_health_check" {
  name        = "td-healthcheck-${random_id.this.hex}"
  network     = module.vpc.name
  description = "Allow inbound health probes from GCP"
  direction   = "INGRESS"

  allow {
    protocol = "tcp"
    //ports    = [80]
  }

  source_ranges = var.health_check_source_cidrs
  target_tags   = ["td-proxy"]
}

resource "google_compute_firewall" "td_glb" {
  name        = "td-glb-${random_id.this.hex}"
  network     = module.vpc.name
  description = "Allow inbound traffic from glb"
  direction   = "INGRESS"

  allow {
    protocol = "tcp"
    //ports    = [80]
  }

  source_ranges = var.glb_source_cidrs
  target_tags   = ["td-proxy"]
}
