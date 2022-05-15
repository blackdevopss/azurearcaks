resource "azuredevops_build_definition" "create" {
  project_id      = data.azuredevops_project.project.id
  name            = "Multi-Cloud Networks - Create"
  agent_pool_name = data.azuredevops_agent_pool.blackdevops.name

  ci_trigger {
    use_yaml = true
  }

  repository {
    repo_type             = "GitHub"
    repo_id               = "blackdevopss/azurearcaks"
    branch_name           = "refs/heads/main"
    yml_path              = "ci_cd/pipelines/build/pipeline-build-networks.yml"
    service_connection_id = azuredevops_serviceendpoint_github.github.id
  }

  variable_groups = [
    azuredevops_variable_group.var_group.id
  ]

  variable {
    name      = "repo_id"
    value     = "blackdevops/azurearcaks"
    is_secret = false
  }
  variable {
    name      = "artifact_name"
    value     = "aks_tfplan"
    is_secret = false
  }

  depends_on = [
    azuredevops_serviceendpoint_github.github
  ]

  lifecycle {
    ignore_changes = [repository]
  }

}
