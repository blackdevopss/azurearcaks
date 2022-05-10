resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.azure_region
  tags     = var.tags
}

resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-${var.aks_subnet_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = var.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.aks_vnet_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.aks_vnet_address_space

  tags = var.tags
}

resource "azurerm_subnet" "subnet" {
  name                                           = var.aks_subnet_name
  resource_group_name                            = azurerm_resource_group.rg.name
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  address_prefixes                               = var.aks_nodepool_subnet_address_prefixes
  service_endpoints                              = var.vnet_service_endpoints
  enforce_private_link_endpoint_network_policies = true
  enforce_private_link_service_network_policies  = true

}

resource "azurerm_route_table" "rtb" {
  name                          = "rtb-${var.aks_subnet_name}"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  disable_bgp_route_propagation = false

  tags = var.tags
}

