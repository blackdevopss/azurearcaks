/*
resource "azurerm_resource_provider_registration" "features" {
  for_each = var.enable_azurerm_features
  name     = each.key

  feature {
    name       = each.value.feature.name
    registered = each.value.feature.registered
  }
}

variable "enable_azurerm_features" {
  type = map(object({
    feature = object({
      name       = string
      registered = bool
    })
  }))

  default = {

    "Microsoft.Kubernetes" = {
      feature = {
        name       = "Microsoft.Kubernetes"
        registered = true
      }
    }
    "Microsoft.KubernetesConfiguration" = {
      feature = {
        name       = "Microsoft.KubernetesConfiguration"
        registered = true
      }
    }
    "Microsoft.ExtendedLocation" = {
      feature = {
        name       = "Microsoft.ExtendedLocation"
        registered = true
      }
    }
  }
}

resource "azurerm_resource_provider_registration" "oidc" {
  name = "Microsoft.ContainerService"

  feature {
    name       = "EnableOIDCIssuerPreview"
    registered = true
  }
}
*/