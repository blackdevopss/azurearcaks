// STORAGE ACCOUNT FOR DIAGNOSTICS
resource "azurerm_storage_account" "aks" {
  name                = "starcakspocdiaglogs"
  resource_group_name = azurerm_resource_group.aks.name
  location            = azurerm_resource_group.aks.location

  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true

  tags = var.tags
}

// LOG ANALYTICS WORKSPACE
resource "azurerm_log_analytics_workspace" "aks" {
  name                = "loga-arcaks-poc"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  sku                 = "PerGB2018"

  tags = var.tags
}

