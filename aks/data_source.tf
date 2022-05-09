data "azurerm_resource_group" "rg" {
  name = var.resource_group_name

  depends_on = [azurerm_resource_group.rg]
}

output "rg_name" {
  value = data.azurerm_resource_group.rg.name
}

output "location" {
  value = data.azurerm_resource_group.rg.location
}