resource "azurerm_user_assigned_identity" "uai" {
  resource_group_name = azurerm_resource_group.aks.name
  location            = azurerm_resource_group.aks.location

  name = "mi-${azurerm_kubernetes_cluster.aks.name}"
  tags = var.tags
}



