###
# Create iam permissions
###
module "projects_iam_bindings" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 5.0"

  projects = [var.project_id]

  bindings = {
    "roles/iap.tunnelResourceAccessor" = [
      format("user:%s", var.impersonate_user_email)
    ]
  }
}

###
# Create automation service account
###
resource "google_service_account" "automation" {
  account_id   = local.automation_service_account_id
  display_name = "Automation service account"
  project      = var.project_id
}

module "service_account_iam_bindings_impersonate" {
  source  = "terraform-google-modules/iam/google//modules/service_accounts_iam"
  version = "~> 3.0"

  bindings_num         = 1
  service_accounts_num = 1
  service_accounts     = [google_service_account.automation.email]
  project              = var.project_id
  mode                 = "additive"
  bindings = {
    "roles/iam.serviceAccountTokenCreator" = [
      format("user:%s", var.impersonate_user_email)
    ]
  }
}

module "service_account_iam_bindings_automation" {
  source  = "terraform-google-modules/iam/google//modules/service_accounts_iam"
  version = "~> 3.0"

  bindings_num         = 1
  service_accounts_num = 1
  service_accounts     = [google_service_account.automation.email]
  project              = var.project_id
  mode                 = "additive"
  bindings = {
    "roles/iam.serviceAccountTokenCreator" = [
      format("user:%s", var.impersonate_user_email)
    ]
  }
}

###
# Assign automation service account permissions
###
resource "google_project_iam_member" "automation" {
  for_each = toset(var.automation_service_account_roles)
  project  = var.project_id
  role     = each.value
  member   = format("serviceAccount:%s", google_service_account.automation.email)
}
