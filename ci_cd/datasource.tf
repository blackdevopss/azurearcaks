data "azuredevops_project" "project" {
  name = var.azuredevops_project_name

  depends_on = [
    azuredevops_project.project
  ]
}

output "p_id" {
  value = data.azuredevops_project.project.id
}

data "azurerm_resource_group" "azdo" {
  name = "rg-bdo-azdo"
}

output "rg_name" {
  value = data.azurerm_resource_group.azdo.name
}

data "azurerm_key_vault" "kv" {
  name                = "kv-azdo-core"
  resource_group_name = "rg-bdo-azdo"
}

output "vault_name" {
  value = data.azurerm_key_vault.kv.name
}

data "azuredevops_agent_pool" "blackdevops" {
  name = "blackdevops"
}

output "name" {
  value = data.azuredevops_agent_pool.blackdevops.name
}

output "pool_type" {
  value = data.azuredevops_agent_pool.blackdevops.pool_type
}

output "auto_provision" {
  value = data.azuredevops_agent_pool.blackdevops.auto_provision
}