resource "azurerm_public_ip_prefix" "nat" {
  name                = "pip-${azurerm_nat_gateway.nat.name}"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  prefix_length       = 31
  zones               = ["1"]
}

resource "azurerm_nat_gateway" "nat" {
  name                    = "ngw-${local.project}-${local.env}"
  location                = azurerm_resource_group.aks.location
  resource_group_name     = azurerm_resource_group.aks.name
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
  zones                   = ["1"]
}

resource "azurerm_nat_gateway_public_ip_prefix_association" "nat" {
  nat_gateway_id      = azurerm_nat_gateway.nat.id
  public_ip_prefix_id = azurerm_public_ip_prefix.nat.id
}

resource "azurerm_subnet_nat_gateway_association" "nat" {
  for_each       = var.vnet_subnets
  subnet_id      = azurerm_subnet.aks[each.key].id
  nat_gateway_id = azurerm_nat_gateway.nat.id

  depends_on = [
    azurerm_subnet.aks, azurerm_virtual_network.aks
  ]
}

