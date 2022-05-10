resource "google_compute_network" "gke" {
  project                         = var.gcp_project_id
  name                            = var.gke_vpc_name
  auto_create_subnetworks         = var.auto_create_subnetworks
  mtu                             = var.gke_vpc_mtu
  routing_mode                    = var.gke_vpc_routing_mode
  description                     = "GKE Cluster Network"
  delete_default_routes_on_create = var.delete_default_routes_on_create
}

resource "google_compute_subnetwork" "gke" {
  name                     = var.gke_subnet_name
  ip_cidr_range            = var.gke_subnet_cidr
  region                   = var.gcp_region
  network                  = google_compute_network.gke.id
  private_ip_google_access = var.enable_private_ip_google_access
  stack_type               = var.subnet_stack_type

  secondary_ip_range {
    range_name    = "gke-secondary-range"
    ip_cidr_range = var.gke_subnet_secondary_ip_range
  }
}

