provider "google" {
  version = "~> 3.7"

  region  = var.region
  project = var.project_id

  access_token = data.google_service_account_access_token.default.access_token

}

provider "google-beta" {
  version = "~> 3.7"

  region  = var.region
  project = var.project_id

  access_token = data.google_service_account_access_token.default.access_token
}

provider "random" {
  version = "~> 2.2"
}

provider "template" {
  version = "~> 2.1"
}

provider "http" {
  version = "~> 1.1"
}
