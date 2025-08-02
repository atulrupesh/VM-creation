terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.38.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "efdf2ccf-79fa-4d76-96ad-be4a91bcb4bd"
}