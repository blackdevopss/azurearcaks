resource "azurerm_network_watcher" "aks" {
  name                = "NetworkWatcher_centralus"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name

  tags = var.tags
}

resource "azurerm_storage_account" "aks" {
  name                = "starcakspoclogging"
  resource_group_name = azurerm_resource_group.aks.name
  location            = azurerm_resource_group.aks.location

  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true

  tags = var.tags
}

resource "azurerm_log_analytics_workspace" "aks" {
  name                = "loga-arc-aks-poc"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  sku                 = "PerGB2018"

  tags = var.tags
}

resource "azurerm_network_watcher_flow_log" "aks" {
  for_each             = var.vnet_subnets
  network_watcher_name = azurerm_network_watcher.aks.name
  resource_group_name  = azurerm_resource_group.aks.name
  name                 = each.value.nsg_name

  network_security_group_id = azurerm_network_security_group.aks[each.value.nsg_name].id
  storage_account_id        = azurerm_storage_account.aks.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 7
  }

  traffic_analytics {
    enabled               = true
    workspace_id          = azurerm_log_analytics_workspace.aks.workspace_id
    workspace_region      = azurerm_log_analytics_workspace.aks.location
    workspace_resource_id = azurerm_log_analytics_workspace.aks.id
    interval_in_minutes   = 10
  }
}