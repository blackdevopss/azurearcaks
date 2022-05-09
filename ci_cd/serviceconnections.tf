resource "azuredevops_serviceendpoint_azurerm" "service_ep" {
  project_id                = data.azuredevops_project.project.id
  service_endpoint_name     = var.azuredevops_service_connection_name
  azurerm_spn_tenantid      = var.tenant_id
  azurerm_subscription_id   = var.subscription_id
  azurerm_subscription_name = var.subscription_name

  credentials {
    serviceprincipalid  = var.client_id
    serviceprincipalkey = var.client_secret
  }
}


resource "azuredevops_serviceendpoint_github" "github" {
  project_id            = data.azuredevops_project.project.id
  service_endpoint_name = "SVSConn-GitHub"

  auth_personal {
    # Also can be set with AZDO_GITHUB_SERVICE_CONNECTION_PAT environment variable
    personal_access_token = var.github_personal_access_token
  }
}

resource "azuredevops_resource_authorization" "service_ep" {
  project_id  = data.azuredevops_project.project.id
  resource_id = azuredevops_serviceendpoint_azurerm.service_ep.id
  authorized  = true
  #  type        = "queue"
}

resource "azuredevops_resource_authorization" "github" {
  project_id  = data.azuredevops_project.project.id
  resource_id = azuredevops_serviceendpoint_github.github.id
  authorized  = true
  #  type        = "queue"
}

// AWS

resource "azuredevops_serviceendpoint_aws" "aws" {
  project_id            = data.azuredevops_project.project.id
  service_endpoint_name = "SVS-Connection-AWS"
  access_key_id         = var.aws_access_key
  secret_access_key     = var.aws_secret_key
  description           = "Service Connection To AWS"

}

/*
resource "azuredevops_build_definition_permissions" "aws" {
  project_id = data.azuredevops_project.project.id
  principal  = azuredevops_serviceendpoint_aws.aws.id

  build_definition_id = azuredevops_build_definition.aks.id

  permissions = {
    ViewBuilds       = "Allow"
    EditBuildQuality = "Allow"
    DeleteBuilds     = "Allow"
    StopBuilds       = "Allow"
  }
}
*/