resource "google_compute_network" "eks" {
  project                         = var.gcp_project_id
  name                            = var.eks_vpc_name
  auto_create_subnetworks         = var.auto_create_subnetworks
  mtu                             = var.vpc_mtu
  routing_mode                    = var.vpc_routing_mode
  description                     = "EKS virtual network"
  delete_default_routes_on_create = var.delete_default_routes_on_create
}

resource "google_compute_subnetwork" "eks" {
  name                     = var.eks_subnet_name
  ip_cidr_range            = var.eks_subnet_cidr
  region                   = var.gcp_region
  network                  = google_compute_network.eks.id
  private_ip_google_access = var.private_ip_google_access
  stack_type               = var.stack_type

  secondary_ip_range {
    range_name    = "eks-secondary-range"
    ip_cidr_range = var.eks_subnet_secondary_ip_range
  }
}

