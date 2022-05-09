resource "azuredevops_environment" "environment" {
  for_each   = var.azure_devops_environments
  project_id = data.azuredevops_project.project.id
  name       = each.value.name
}

