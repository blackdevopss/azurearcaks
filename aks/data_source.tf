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

data "azurerm_virtual_machine" "azdo_agent" {
  name                = "vm-bdo-azdo"
  resource_group_name = "rg-bdo-azdo"
}

output "vm_system_identity_id" {
  value = data.azurerm_virtual_machine.azdo_agent.identity.*.principal_id
}

data "azurerm_subscription" "current" {
}

output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.subscription_id
}

