terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.54.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "MotoRG"
    storage_account_name = "motostorageaccount98"
    container_name       = "moto-container"
    key                  = "Dev.terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
  subscription_id = "c83e7967-42e9-4d03-8751-f614e751e7bc"
}

