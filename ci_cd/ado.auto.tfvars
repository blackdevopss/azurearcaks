subscription_name                   = "blackdevops: dev"
azuredevops_service_connection_name = "SVCConn-Dev-BlackDevOps"

azuredevops_project_name = "azurearcaks"
org_service_url          = "https://dev.azure.com/blackdevopss"

azure_devops_projects = {

  "azurearcaks" = {
    description = "Azure Arc-enabled Kubernetes Lab"

    features = {
      artifacts    = "enabled"
      testplans    = "enabled"
      boards       = "enabled"
      repositories = "enabled"
      pipelines    = "enabled"
    }
    version_control    = "Git"
    visibility         = "private"
    work_item_template = "Agile"
  }
}

azure_devops_environments = {

  "Azure" = {
    name = "azure"
  }
  "Amazon" = {
    name = "aws"
  }
  "Google" = {
    name = "gcp"
  }
}

