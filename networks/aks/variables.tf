variable "azure_region" { type = string }

variable "client_id" { type = string }
variable "client_secret" { type = string }
variable "subscription_id" { type = string }
variable "tenant_id" { type = string }

variable "tags" { type = map(string) }

variable "service_endpoints" { type = list(string) }

variable "vnet_name" { type = string }
variable "vnet_address_space" { type = list(string) }

variable "vnet_subnets" {
  type = map(object({
    address_prefixes                               = list(string)
    enforce_private_link_endpoint_network_policies = bool
    enforce_private_link_service_network_policies  = bool
    service_delegation                             = bool
    nsg_name                                       = string
  }))
}

