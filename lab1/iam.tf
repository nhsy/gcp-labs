###
# create compute service account for compute instances
###
resource "google_service_account" "compute" {
  account_id   = local.compute_service_account
  display_name = "${local.compute_service_account}-service account"
  project      = var.project_id
}

###
# assign logging permissions
###
resource "google_project_iam_member" "compute_logging" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = format("serviceAccount:%s", google_service_account.compute.email)
}

###
# assign monitoring permissions
###
resource "google_project_iam_member" "compute_monitoring_1" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  member  = format("serviceAccount:%s", google_service_account.compute.email)
}

resource "google_project_iam_member" "compute_monitoring_2" {
  project = var.project_id
  role    = "roles/monitoring.viewer"
  member  = format("serviceAccount:%s", google_service_account.compute.email)
}
