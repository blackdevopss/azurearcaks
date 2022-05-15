resource "google_compute_network" "vpc" {
  for_each                        = var.vpcs
  project                         = each.value.project
  name                            = each.key
  auto_create_subnetworks         = each.value.auto_create_subnetworks
  mtu                             = each.value.mtu
  routing_mode                    = each.value.routing_mode
  description                     = each.value.description
  delete_default_routes_on_create = each.value.delete_default_routes_on_create

  depends_on = [
    google_project_service.provider, google_project_service.consumer
  ]
}

resource "google_compute_router" "prov_router" {
  for_each = var.cloud_routers
  name     = each.value.router_name
  region   = each.value.region
  project  = each.value.project
  network  = each.value.vpc_name

  bgp {
    asn                = 64514
    advertise_mode     = "CUSTOM"
    advertised_groups  = ["ALL_SUBNETS"]
    keepalive_interval = 60

    advertised_ip_ranges {
      range       = each.value.advertised_ip_ranges.range
      description = each.value.advertised_ip_ranges.description
    }
  }

  depends_on = [
    google_compute_network.vpc
  ]
  provider = google.provider
}

resource "google_compute_router_nat" "nat" {
  for_each = var.cloud_routers
  name     = each.value.cloud_nat_name
  router   = "router-provider-vpc"
  region   = each.value.region

  nat_ip_allocate_option = "AUTO_ONLY"

  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
  depends_on = [
    google_compute_router.prov_router
  ]
  provider = google.provider
}

resource "google_compute_route" "default_vpc_route" {
  for_each         = var.vpcs
  name             = "default-internet-route"
  dest_range       = "0.0.0.0/0"
  project          = each.value.project
  network          = each.key
  next_hop_gateway = "default-internet-gateway"
  priority         = 1000
  description      = "Default route to the Internet"
  #  next_hop_gateway = "default-internet-gateway"
  depends_on = [
    google_compute_network.vpc, google_project_service.provider, google_project_service.consumer
  ]
  provider = google.provider
}