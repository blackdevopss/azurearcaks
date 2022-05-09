resource "azuredevops_variable_group" "var_group" {
  project_id   = data.azuredevops_project.project.id
  name         = "TerraformVarsGroup"
  description  = "Secrets from Key Vault used by build and release pipelines"
  allow_access = true

  key_vault {
    name                = data.azurerm_key_vault.kv.name
    service_endpoint_id = azuredevops_serviceendpoint_azurerm.service_ep.id
  }

  variable {
    name = "client-id"
  }
  variable {
    name = "client-secret"
  }
  variable {
    name = "tenant-id"
  }
  variable {
    name = "subscription-id"
  }
  variable {
    name = "azdo-pat"
  }
  variable {
    name = "terraform-api-token"
  }
  variable {
    name = "bridgecrew-apikey"
  }
  variable {
    name = "ssh-public-key"
  }
  variable {
    name = "ssh-private-key"
  }
  variable {
    name = "github-pat"
  }
  variable {
    name = "aws-access-key"
  }
  variable {
    name = "aws-secret-access-key"
  }

  depends_on = [
    azuredevops_serviceendpoint_azurerm.service_ep
  ]
}