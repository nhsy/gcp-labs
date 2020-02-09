output "name" {
  value       = google_compute_instance.this.name
  description = "Instance name"
}

output "private_ip" {
  value       = google_compute_instance.this.network_interface.0.network_ip
  description = "Instance private ip address"
}

//output "public_ip" {
//  value       = "${google_compute_instance.this.network_interface.0.access_config.0.nat_ip}"
//  description = "Instance public ip address"
//}

output "zone" {
  value       = google_compute_instance.this.zone
  description = "Instance zone"
}
