module "projects_iam_bindings" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 5.0"

  projects = [var.project_id]

  bindings = {
    "roles/iap.tunnelResourceAccessor" = [
      format("user:%s", var.iam_user_email)
    ]
  }
}
