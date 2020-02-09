###
# Create gce service account for compute instances
###
resource "google_service_account" "gce" {
  account_id   = local.gce_service_account
  display_name = "GCE service account"
  project      = var.project_id
}

###
# Assign gce service account permissions
###
resource "google_project_iam_member" "gce" {
  for_each = toset(var.gce_service_account_roles)
  project  = var.project_id
  role     = each.value
  member   = format("serviceAccount:%s", google_service_account.gce.email)
}
