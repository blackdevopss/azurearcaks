variable "aks_resource_group_name" { type = string }
variable "azure_region" { type = string }

variable "tags" { type = map(string) }
variable "service_endpoints" { type = list(string) }

variable "vnet_name" { type = string }
variable "vnet_address_space" { type = list(string) }

variable "aks_security_groups" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}

variable "vnet_subnets" {
  type = map(object({
    name                                           = string
    address_prefixes                               = list(string)
    enforce_private_link_endpoint_network_policies = bool
    enforce_private_link_service_network_policies  = bool
    service_delegation                             = bool
  }))
}