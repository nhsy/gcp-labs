/**
* # Module: vpc
*/

###
# Create VPC
###
resource "google_compute_network" "this" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

###
# Create additional Networking Resources
###
resource "google_compute_router" "this" {
  name    = var.router_name
  network = google_compute_network.this.self_link
  project = var.project_id
  region  = var.region
}

resource "google_compute_router_nat" "nat" {
  count                              = var.create_nat_gateway ? 1 : 0
  name                               = var.nat_router_name
  nat_ip_allocate_option             = "AUTO_ONLY"
  project                            = var.project_id
  region                             = var.region
  router                             = google_compute_router.this.name
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
