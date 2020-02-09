output "labels" {
  value = module.labels.rendered
}

output "vpc_name" {
  value = module.vpc.name
}

output "private_subnet_name" {
  value = module.private_subnet.name
}

output "private_subnet_ip_cidr_range" {
  value = module.private_subnet.ip_cidr_range
}

output "public_subnet_name" {
  value = module.public_subnet.name
}

output "public_subnet_ip_cidr_range" {
  value = module.public_subnet.ip_cidr_range
}

output "transfer_bucket_name" {
  value = google_storage_bucket.transfer.name
}

//output "automation_name" {
//  value = module.automation.name
//}
//
//output "automation_private_ip" {
//  value = module.automation.private_ip
//}
//
//output "automation_zone" {
//  value = module.automation.zone
//}

//output "automation_failover_name" {
//  value = module.automation_failover.name
//}
//
//output "automation_failover_private_ip" {
//  value = module.automation_failover.private_ip
//}
//
//output "automation_failover_zone" {
//  value = module.automation_failover.zone
//}

//
//output "gke_failover_cluster_name" {
//  value = module.gke_failover.name
//}
//
//output "gke_failover_node_locations" {
//  value = join(", ", local.gke_failover_node_locations)
//}
