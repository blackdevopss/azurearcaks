resource "google_compute_subnetwork" "private_svc_conn" {
  for_each                 = var.private_service_connect
  name                     = each.key
  project                  = each.value.project
  ip_cidr_range            = each.value.ip_cidr_range
  region                   = each.value.region
  purpose                  = each.value.purpose
  network                  = google_compute_network.vpc["vpc-provider"].id
  private_ip_google_access = each.value.private_ip_google_access
  stack_type               = each.value.stack_type

  log_config {
    aggregation_interval = each.value.log_config.aggregation_interval
    flow_sampling        = each.value.log_config.flow_sampling
    metadata             = each.value.log_config.metadata

  }
  depends_on = [
    google_project_service.provider, google_project_service.consumer, google_compute_network.vpc
  ]

  lifecycle { ignore_changes = [stack_type, name] }
}

resource "google_compute_subnetwork" "provider_subnet" {
  for_each                 = var.provider_vpc_subnets
  name                     = each.key
  project                  = each.value.project
  ip_cidr_range            = each.value.ip_cidr_range
  region                   = each.value.region
  network                  = google_compute_network.vpc["vpc-provider"].id
  private_ip_google_access = each.value.private_ip_google_access
  stack_type               = each.value.stack_type

  log_config {
    aggregation_interval = each.value.log_config.aggregation_interval
    flow_sampling        = each.value.log_config.flow_sampling
    metadata             = each.value.log_config.metadata

  }
  depends_on = [
    google_project_service.provider, google_project_service.consumer
  ]
}

resource "google_compute_subnetwork" "consumer_subnet" {
  for_each                 = var.consumer_vpc_subnets
  name                     = each.key
  project                  = each.value.project
  ip_cidr_range            = each.value.ip_cidr_range
  region                   = each.value.region
  network                  = google_compute_network.vpc["vpc-consumer"].id
  private_ip_google_access = each.value.private_ip_google_access
  stack_type               = each.value.stack_type

  log_config {
    aggregation_interval = each.value.log_config.aggregation_interval
    flow_sampling        = each.value.log_config.flow_sampling
    metadata             = each.value.log_config.metadata

  }
  depends_on = [
    google_project_service.provider, google_project_service.consumer
  ]
  provider = google.consumer
}



