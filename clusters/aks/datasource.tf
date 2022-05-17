data "azurerm_subnet" "aks" {
  name                 = "snet-aks-nodes"
  virtual_network_name = "vnet-arc-aks-poc"
  resource_group_name  = "rg-aks-networks"
}

output "subnet_id" {
  value = data.azurerm_subnet.aks.id
}