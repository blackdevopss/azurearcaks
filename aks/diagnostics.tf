/*
resource "azurerm_network_watcher_flow_log" "nsg" {
  network_watcher_name = azurerm_network_watcher.netw.name
  resource_group_name  = azurerm_resource_group.netw.name
  name                 = azurerm_network_security_group.nsg.name

  network_security_group_id = azurerm_network_security_group.nsg.id
  storage_account_id        = azurerm_storage_account.st_aks.id
  enabled                   = true

  retention_policy {
    enabled = true
    days    = 7
  }

  traffic_analytics {
    enabled               = true
    workspace_id          = azurerm_log_analytics_workspace.aks.workspace_id
    workspace_region      = azurerm_resource_group.netw.location
    workspace_resource_id = azurerm_log_analytics_workspace.aks.id
    interval_in_minutes   = 10
  }

  lifecycle {
    ignore_changes = [location]
  }
}


// VNET DIAGNOSTICS
resource "azurerm_monitor_diagnostic_setting" "vnet" {
  name               = azurerm_virtual_network.vnet.name
  target_resource_id = azurerm_virtual_network.vnet.id
  storage_account_id = azurerm_storage_account.st_aks.id

  log {
    category = "VMProtectionAlerts"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 30
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
      days    = 30
    }
  }
}


// NAT GW PUBLIC IP DIAGNOSTICS
resource "azurerm_monitor_diagnostic_setting" "natpip" {
  name               = "diag-${azurerm_public_ip.natgw.name}"
  target_resource_id = azurerm_public_ip.natgw.id
  storage_account_id = azurerm_storage_account.st_aks.id

  log {
    category = "DDoSProtectionNotifications"
    enabled  = false

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "DDoSMitigationFlowLogs"
    enabled  = false

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "DDoSMitigationReports"
    enabled  = false

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}
*/