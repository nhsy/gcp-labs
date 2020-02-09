//output "name" {
//  value       = "${google_compute_instance.this.*.name}"
//  description = "Instance name"
//}
//
//output "private_ip" {
//  value       = "${google_compute_instance.this.*.network_interface.0.network_ip}"
//  description = "Instance private ip address"
//}


output "google_compute_instance_template" {
  value = google_compute_instance_template.this
}
