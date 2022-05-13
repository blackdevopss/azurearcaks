resource "azurerm_resource_group" "aks" {
  name     = var.aks_resource_group_name
  location = var.azure_region

  tags = var.tags
}

resource "azurerm_network_security_group" "aks" {
  for_each            = var.aks_security_groups
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  tags = var.tags
}

resource "azurerm_virtual_network" "aks" {
  name                = var.vnet_name
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  address_space       = var.vnet_address_space

  tags = var.tags
}

resource "azurerm_subnet" "aks" {
  for_each                                       = var.vnet_subnets
  name                                           = each.key
  resource_group_name                            = azurerm_resource_group.aks.name
  virtual_network_name                           = azurerm_virtual_network.aks.name
  address_prefixes                               = each.value.address_prefixes
  service_endpoints                              = var.service_endpoints
  enforce_private_link_endpoint_network_policies = each.value.enforce_private_link_endpoint_network_policies
  enforce_private_link_service_network_policies  = each.value.enforce_private_link_service_network_policies

  dynamic "delegation" {
    for_each = each.value.service_delegation == "true" ? [1] : []

    content {
      name = "delegation"

      service_delegation {
        name    = "Microsoft.ContainerInstance/containerGroups"
        actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
      }
    }

  }
}

