###
# Create VPC
###
module "vpc" {
  source = "./modules/gcp-vpc"

  common_labels      = module.labels.rendered
  create_nat_gateway = var.create_nat_gateway
  project_id         = var.project_id
  region             = var.region
  router_name        = local.router_name
  vpc_name           = local.vpc_name
}

###
# Create subnetworks
###
module "private_subnet" {
  source = "./modules/gcp-subnet"

  enable_flow_logs         = var.enable_flow_logs
  ip_cidr_range            = cidrsubnet(var.network_cidr, 8, 128)
  network                  = module.vpc.name
  private_ip_google_access = true
  region                   = var.region
  subnet_name              = format("%s-%s", "private", random_id.this.hex)
}

module "public_subnet" {
  source = "./modules/gcp-subnet"

  enable_flow_logs         = var.enable_flow_logs
  ip_cidr_range            = cidrsubnet(var.network_cidr, 8, 1)
  network                  = module.vpc.name
  private_ip_google_access = true
  region                   = var.region
  subnet_name              = format("%s-%s", "public", random_id.this.hex)
}