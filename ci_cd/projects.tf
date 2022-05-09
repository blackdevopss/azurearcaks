resource "azuredevops_project" "project" {
  for_each           = var.azure_devops_projects
  name               = each.key
  visibility         = each.value.visibility
  version_control    = each.value.version_control
  work_item_template = each.value.work_item_template
  description        = each.value.description

  features = {
    "testplans"    = each.value.features.testplans
    "artifacts"    = each.value.features.artifacts
    "boards"       = each.value.features.boards
    "repositories" = each.value.features.repositories
    "pipelines"    = each.value.features.pipelines
  }
}

