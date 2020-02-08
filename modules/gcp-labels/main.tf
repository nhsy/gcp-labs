locals {
  common_labels = {
    business-name          = lower(var.business_name)
    cost-code              = lower(var.cost_code)
    creation-date          = var.creation_date != "" ? var.creation_date : replace(substr(timestamp(), 0, 10), "-", "")
    creator                = lower(var.creator)
    environment            = lower(var.environment)
    project-name           = lower(var.project_name)
    project-sponsor        = lower(var.project_sponsor)
    project-technical-lead = lower(var.project_technical_lead)
    review-date            = var.review_date != "" ? var.review_date : replace(substr(timeadd(timestamp(), "168h"), 0, 10), "-", "")
    state                  = lower(var.state)
    terraform              = true
    workspace              = lower(terraform.workspace)
  }
}
