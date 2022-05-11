resource "azurerm_user_assigned_identity" "uai" {
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  name = "mi-${var.aks_cluster_name}"
  tags = var.tags
}



resource "azurerm_role_assignment" "azdo_agent" {
  scope                = data.azurerm_subscription.current.subscription_id
  role_definition_name = "Owner"
  principal_id         = data.azurerm_virtual_machine.azdo_agent.identity.*.principal_id
}

