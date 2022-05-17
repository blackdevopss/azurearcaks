resource "azurerm_resource_group" "aks" {
  name     = "rg-aks-networks"
  location = var.azure_region

  tags = var.tags
}

resource "azurerm_network_security_group" "aks" {
  for_each            = var.vnet_subnets
  name                = each.value.nsg_name
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name

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

resource "azurerm_subnet_network_security_group_association" "aks" {
  for_each                  = var.vnet_subnets
  subnet_id                 = azurerm_subnet.aks[each.key].id
  network_security_group_id = azurerm_network_security_group.aks[each.value.nsg_name].id
}
