terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.3.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "2.21.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "0.1.1"
    }

  }
}

provider "azuread" {
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  # Configuration options
}

provider "azurerm" {
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  features {}
}

provider "azapi" {
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id

}

terraform {
  cloud {
    organization = "blackdevopss"

    workspaces {
      name = "azure-aks-network"
    }
  }
}