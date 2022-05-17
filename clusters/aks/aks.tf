resource "azurerm_resource_group" "aks" {
  name     = "rg-aks-clusters"
  location = var.azure_region

  tags = var.tags
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                      = var.aks_cluster_name
  location                  = azurerm_resource_group.aks.location
  resource_group_name       = azurerm_resource_group.aks.name
  dns_prefix                = var.aks_cluster_dns_prefix
  automatic_channel_upgrade = var.automatic_channel_upgrade
  azure_policy_enabled      = true
  kubernetes_version        = var.kubernetes_version
  open_service_mesh_enabled = true
  oidc_issuer_enabled       = true

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
    outbound_type  = "userAssignedNATGateway"
  }

  microsoft_defender {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.aks.id
  }

  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      key_data = var.ssh_public_key_data
    }
  }

  azure_active_directory_role_based_access_control {
    managed                = true
    tenant_id              = var.tenant_id
    admin_group_object_ids = var.aks_cluster_admin_group_object_ids
    azure_rbac_enabled     = true
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = false

  }

  default_node_pool {
    name                         = "systempool"
    type                         = "VirtualMachineScaleSets"
    vm_size                      = var.system_node_pool_node_vm_size
    enable_auto_scaling          = true
    max_count                    = 2
    min_count                    = 1
    only_critical_addons_enabled = true
    orchestrator_version         = var.kubernetes_version
    os_disk_type                 = "Managed"
    os_disk_size_gb              = "50"
    os_sku                       = "Ubuntu"
    vnet_subnet_id               = data.azurerm_subnet.aks.id

    tags = {
      "nodepool" = "system"
    }

  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.uai.id]
  }

  tags = var.tags

  depends_on = [azurerm_user_assigned_identity.uai]
}



