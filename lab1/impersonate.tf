data google_compute_default_service_account "default" {}

data "google_service_account_access_token" "default" {
  #target_service_account = data.google_compute_default_service_account.default.email
  target_service_account = google_service_account.compute.email
  scopes                 = ["userinfo-email", "cloud-platform"]
  lifetime               = "300s"
  depends_on             = [module.service_account-iam-bindings]
}

data "google_client_openid_userinfo" "default" {
  provider = google
}

output "source-email" {
  value = data.google_client_openid_userinfo.default
}

provider "google" {
  alias        = "impersonated"
  access_token = data.google_service_account_access_token.default.access_token
  project      = var.project_id
}

data "google_client_openid_userinfo" "impersonate" {
  provider = google.impersonated
}

output "impersonate-email" {
  value = data.google_client_openid_userinfo.impersonate
}

module "service_account-iam-bindings" {
  source  = "terraform-google-modules/iam/google//modules/service_accounts_iam"
  version = "~> 3.0"

  bindings_num         = 1
  service_accounts_num = 1
  service_accounts     = [google_service_account.compute.email]
  project              = var.project_id
  mode                 = "additive"
  bindings = {
    "roles/iam.serviceAccountTokenCreator" = [
      format("user:%s", var.iam_user_email)
    ]
  }
}

resource "google_storage_bucket" "impersonate" {
  provider           = google.impersonated
  name               = format("%s-%s", local.bucket_name, "impersonate")
  bucket_policy_only = true
  force_destroy      = true
  labels             = module.labels.rendered
  location           = var.region

  encryption {
    default_kms_key_name = var.kms_key
  }

  lifecycle {
    ignore_changes = [labels]
  }
}