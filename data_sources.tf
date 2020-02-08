data "google_compute_zones" "available" {
  region = var.region
  status = "UP"
}

resource "random_shuffle" "zones" {
  input        = data.google_compute_zones.available.names
  result_count = 3
}

data "google_compute_image" "centos-7" {
  family  = "centos-7"
  project = "centos-cloud"
}

data "template_file" "automation_startup_script" {
  template = file(format("files/%s", var.automation_startup_filename))
}

