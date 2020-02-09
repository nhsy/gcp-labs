###
# Create impersonate google provider
###
provider "google" {
  alias   = "impersonate"
  project = var.project_id
}

###
# Generate temporary access token
###
data "google_service_account_access_token" "default" {
  provider               = google.impersonate
  target_service_account = var.automation_service_account
  scopes                 = ["userinfo-email", "cloud-platform"]
  lifetime               = "3600s"
}

###
# Get OpenID userinfo about the credentials used with the Google provide
###
data "google_client_openid_userinfo" "default" {}
