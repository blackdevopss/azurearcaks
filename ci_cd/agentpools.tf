resource "azuredevops_agent_pool" "aws" {
  name           = "aws"
  auto_provision = true
}

resource "azuredevops_agent_pool" "azure" {
  name           = "azure"
  auto_provision = true
}

resource "azuredevops_agent_pool" "gcp" {
  name           = "gcp"
  auto_provision = true
}