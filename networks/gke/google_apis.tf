resource "google_project_service" "provider" {
  count   = length(var.google_apis)
  project = "slsfs-hub"
  service = var.google_apis[count.index]

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}


resource "google_project_service" "consumer" {
  count   = length(var.google_apis)
  project = "slsfs-prd"
  service = var.google_apis[count.index]

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}