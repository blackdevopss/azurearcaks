resource "azuredevops_build_definition" "destroy" {
  project_id      = data.azuredevops_project.project.id
  name            = "MultiCloud - K8S Destroy"
  agent_pool_name = data.azuredevops_agent_pool.blackdevops.name

  ci_trigger {
    use_yaml = false
  }

  repository {
    repo_type             = "GitHub"
    repo_id               = "blackdevopss/azurearcaks"
    branch_name           = "refs/heads/main"
    yml_path              = "ci_cd/pipelines/build/pipeline-destroy.yml"
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

  depends_on = [
    azuredevops_serviceendpoint_github.github
  ]

  lifecycle {
    ignore_changes = [repository]
  }

}
