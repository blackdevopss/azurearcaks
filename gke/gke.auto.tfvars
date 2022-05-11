gcp_region     = "us-central1"
gcp_project_id = "slsfs-dev"

// VPC
gke_vpc_name                    = "vpc-azarc-eks"
gke_subnet_name                 = "snet-azarc-eks"
gke_subnet_cidr                 = "10.255.240.0/20"
gke_subnet_secondary_ip_range   = "192.168.240.0/20"
subnet_stack_type               = "IPV4_ONLY"
auto_create_subnetworks         = false
gke_vpc_mtu                     = 1460
gke_vpc_routing_mode            = "REGIONAL"
delete_default_routes_on_create = true
enable_private_ip_google_access = true

gcp_apis_to_enable = [
  "dns.googleapis.com",
  "servicedirectory.googleapis.com",
  "servicenetworking.googleapis.com",
]
