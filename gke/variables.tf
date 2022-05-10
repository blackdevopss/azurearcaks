variable "gcp_project_id" {
  type = string
}

variable "gcp_region" {
  type = string
}

variable "gke_vpc_name" {
  type = string
}

variable "auto_create_subnetworks" {
  type = bool
}

variable "gke_vpc_mtu" {
  type = number
}

variable "gke_vpc_routing_mode" {
  type = string
}

variable "delete_default_routes_on_create" {
  type = bool
}

variable "gke_subnet_name" {
  type = string
}

variable "gke_subnet_cidr" {
  type = string
}

variable "enable_private_ip_google_access" {
  type = bool
}

variable "vpc_stack_type" {
  type = string
}

variable "gke_subnet_secondary_ip_range" {
  type = string
}