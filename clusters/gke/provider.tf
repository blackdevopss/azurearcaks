terraform {
  required_providers {
    google = {
      source                = "hashicorp/google"
      version               = "4.19.0"
      configuration_aliases = [google.provider, google.consumer]
    }
  }
}

provider "google" {
  project     = "slsfs-hub"
  credentials = file("slsfs-dev-365463f644a0.json")
  region      = "us-central1"
  alias       = "provider"
}

provider "google" {
  project     = "slsfs-prd"
  credentials = file("slsfs-dev-365463f644a0.json")
  region      = "us-central1"
  alias       = "consumer"
}

provider "google" {
  project     = "slsfs-hub"
  credentials = file("slsfs-dev-365463f644a0.json")
  region      = "us-central1"
}

terraform {
  cloud {
    organization = "blackdevopss"

    workspaces {
      name = "gcp-eks-network"
    }
  }
}

