output "ip_cidr_range" {
  value       = google_compute_subnetwork.subnet.ip_cidr_range
  description = "IP CIDR range"
}

output "secondary_ip_ranges" {
  value       = google_compute_subnetwork.subnet.secondary_ip_range
  description = "Secondary IP CIDR ranges"
}

output "name" {
  value       = google_compute_subnetwork.subnet.name
  description = "Name of the subnetwork"
}

output "self_link" {
  value       = google_compute_subnetwork.subnet.self_link
  description = "The self link of the subnetwork"
}