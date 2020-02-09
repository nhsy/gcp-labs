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
