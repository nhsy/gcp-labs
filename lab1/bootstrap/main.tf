/**
* # Bootstrap
* Refer to [README.md](../README.md) in the parent folder.
*
*/

###
# Generate randon id to append to every created resource name
###
resource "random_id" "this" {
  byte_length = 3
}

###
# Create common labels
###
module "labels" {
  source = "../../modules/gcp-labels"

  business_name          = var.business_name
  creator                = var.creator
  creation_date          = var.creation_date != null ? var.creation_date : replace(substr(timestamp(), 0, 10), "-", "")
  cost_code              = var.cost_code
  environment            = var.environment
  project_id             = var.project_id
  project_name           = var.project_name
  project_sponsor        = var.project_sponsor
  project_technical_lead = var.project_technical_lead
  review_date            = replace(substr(timeadd(timestamp(), "168h"), 0, 10), "-", "")
}

locals {
  automation_service_account_id = format("%s-%s", var.automation_service_account_prefix, random_id.this.hex)
  bucket_name                   = "${var.bucket_prefix}-${var.environment}-${random_id.this.hex}"
  kms_key_ring_name             = "${var.kms_key_ring_prefix}-${random_id.this.hex}"
  kms_crypto_name               = "${var.kms_crypto_key_prefix}-${random_id.this.hex}"
}
