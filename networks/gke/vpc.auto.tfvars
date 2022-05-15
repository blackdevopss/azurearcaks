gcp_region = "us-central1"
project_id = "slsfs-hub"


// VPCS
vpcs = {

  "vpc-provider" = {
    auto_create_subnetworks         = false
    delete_default_routes_on_create = true
    description                     = "Provider Network"
    mtu                             = 1460
    project                         = "slsfs-hub"
    routing_mode                    = "GLOBAL"
  }

  "vpc-consumer" = {
    auto_create_subnetworks         = false
    delete_default_routes_on_create = true
    description                     = "Consumer Network"
    mtu                             = 1460
    project                         = "slsfs-prd"
    routing_mode                    = "GLOBAL"
  }
}

cloud_routers = {

  "vpc-provider" = {
    router_name    = "router-provider-vpc"
    cloud_nat_name = "nat-provider-vpc"
    project        = "slsfs-hub"
    region         = "us-central1"
    vpc_name       = "vpc-provider"
    advertised_ip_ranges = {
      description = "IP range to advertise"
      range       = "172.31.0.0/16"
    }
    bgp = {
      advertise_mode     = "CUSTOM"
      advertised_groups  = ["ALL_SUBNETS"]
      asn                = 64514
      keepalive_interval = 60
    }

  }
}

// SUBNETS
provider_vpc_subnets = {

  "snet-provider-gke" = {
    ip_cidr_range            = "172.31.0.0/20"
    private_ip_google_access = true
    region                   = "us-central1"
    stack_type               = "IPV4_ONLY"
    project                  = "slsfs-hub"
    log_config = {
      aggregation_interval = "INTERVAL_10_MIN"
      flow_sampling        = 0.5
      metadata             = "INCLUDE_ALL_METADATA"
    }
  }

  "snet-provider-ingress" = {
    ip_cidr_range            = "172.31.16.0/20"
    private_ip_google_access = true
    region                   = "us-central1"
    stack_type               = "IPV4_ONLY"
    project                  = "slsfs-hub"
    log_config = {
      aggregation_interval = "INTERVAL_10_MIN"
      flow_sampling        = 0.5
      metadata             = "INCLUDE_ALL_METADATA"
    }
  }
}

private_service_connect = {

  "snet-provider-privsc" = {
    ip_cidr_range            = "172.31.32.0/24"
    private_ip_google_access = true
    region                   = "us-central1"
    stack_type               = "IPV4_ONLY"
    project                  = "slsfs-hub"
    purpose                  = "PRIVATE_SERVICE_CONNECT"
    log_config = {
      aggregation_interval = "INTERVAL_10_MIN"
      flow_sampling        = 0.5
      metadata             = "INCLUDE_ALL_METADATA"
    }
  }
}

consumer_vpc_subnets = {

  "snet-consumer-apps" = {
    ip_cidr_range            = "192.168.240.0/20"
    private_ip_google_access = true
    region                   = "us-central1"
    stack_type               = "IPV4_ONLY"
    project                  = "slsfs-prd"
    log_config = {
      aggregation_interval = "INTERVAL_10_MIN"
      flow_sampling        = 0.5
      metadata             = "INCLUDE_ALL_METADATA"
    }
  }

  "snet-consumer-data" = {
    ip_cidr_range            = "192.168.224.0/20"
    private_ip_google_access = true
    region                   = "us-central1"
    stack_type               = "IPV4_ONLY"
    project                  = "slsfs-prd"
    log_config = {
      aggregation_interval = "INTERVAL_10_MIN"
      flow_sampling        = 0.5
      metadata             = "INCLUDE_ALL_METADATA"
    }
  }
}

// APIS
google_apis = ["dns.googleapis.com", "servicedirectory.googleapis.com",
"servicenetworking.googleapis.com", "compute.googleapis.com"]


// FIREWALL RULES
provider_vpc_firewall_rules = {

  "inter-subnet" = {
    source_ranges = ["172.31.0.0/16"]
    direction     = "INGRESS"
    disabled      = false
    name          = "fwrule-allow-inter-subnet"
    network       = "vpc-provider"
    priority      = "1000"
    project       = "slsfs-hub"
    description   = "FWRule - Allow traffic between subnets"

    allow = {
      ports    = ["0-65535"]
      protocol = "TCP"
    }

  }
  "remote-access" = {
    source_ranges = ["98.159.92.236/32"]
    direction     = "INGRESS"
    disabled      = false
    name          = "fwrule-allow-rdp-ssh"
    network       = "vpc-provider"
    priority      = "500"
    project       = "slsfs-hub"
    description   = "FWRule - Allow SSH and RDP access"

    allow = {
      ports    = ["22", "3389"]
      protocol = "TCP"
    }

  }
}

