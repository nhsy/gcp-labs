module "project_services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "~> 4.0"

  project_id = var.project_id

  disable_dependent_services  = false
  disable_services_on_destroy = false

  activate_apis = [
    "cloudkms.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "iam.googleapis.com",
    "iap.googleapis.com",
    "storage-api.googleapis.com"
  ]
}
