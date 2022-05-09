variable "resource_group_name" {
  type = string
}

variable "azure_region" {
  type = string
}

variable "aks_vnet_name" {
  type = string
}

variable "aks_vnet_address_space" {
  type = list(string)
}

variable "aks_vnet_dns_servers" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

variable "aks_subnet_name" {
  type = string
}

variable "aks_nodepool_subnet_address_prefixes" {
  type = list(string)
}

variable "vnet_service_endpoints" {
  type = list(string)
}


variable "aks_natgw_public_ip_zone" {
  type = list(string)
}

variable "aks_nat_gateway_name" {
  type = string
}


variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}


