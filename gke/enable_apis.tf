resource "google_project_service" "project" {
  count   = 3
  project = var.gcp_project_id
  service = var.gcp_apis_to_enable[count.index]

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}



