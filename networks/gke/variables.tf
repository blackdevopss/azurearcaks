variable "project_id" {
  type = string
}

variable "gcp_region" {
  type = string
}

variable "provider_vpc_subnets" {
  type = map(object({
    ip_cidr_range            = string
    private_ip_google_access = bool
    stack_type               = string
    region                   = string
    project                  = string
    log_config = object({
      aggregation_interval = string
      flow_sampling        = number
      metadata             = string
    })
  }))
}

variable "consumer_vpc_subnets" {
  type = map(object({
    ip_cidr_range            = string
    private_ip_google_access = bool
    stack_type               = string
    region                   = string
    project                  = string
    log_config = object({
      aggregation_interval = string
      flow_sampling        = number
      metadata             = string
    })
  }))
}

variable "private_service_connect" {
  type = map(object({
    ip_cidr_range            = string
    private_ip_google_access = bool
    stack_type               = string
    region                   = string
    project                  = string
    purpose                  = string
    log_config = object({
      aggregation_interval = string
      flow_sampling        = number
      metadata             = string
    })
  }))
}

variable "vpcs" {
  type = map(object({
    project                         = string
    auto_create_subnetworks         = bool
    mtu                             = number
    routing_mode                    = string
    description                     = string
    delete_default_routes_on_create = bool
  }))
}

variable "google_apis" {
  type = list(string)
}

variable "cloud_routers" {
  type = map(object({
    router_name    = string
    region         = string
    project        = string
    vpc_name       = string
    cloud_nat_name = string
    bgp = object({
      asn                = number
      advertise_mode     = string
      advertised_groups  = list(string)
      keepalive_interval = number
    })
    advertised_ip_ranges = object({
      range       = string
      description = string
    })
  }))
}

variable "provider_vpc_firewall_rules" {
  type = map(object({
    project       = string
    name          = string
    network       = string
    description   = string
    source_ranges = list(string)
    #    destination_ranges = list(string)
    direction = string
    priority  = string
    disabled  = bool

    allow = object({
      protocol = string
      ports    = list(string)
    })

  }))
}
