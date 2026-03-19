terraform {
  # It's best to set a minimum version rather than a fixed version
  required_version = ">= 1.14.7"

  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.8.1"
    }
  }
}

provider "random" {
  # Configuration options
}