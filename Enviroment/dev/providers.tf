terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Vaishno_RG"
    storage_account_name = "vaishnostg"
    container_name       = "vaishnocontainer"
    key                  = "Dev.terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
  subscription_id = "7358504b-783d-43c0-98fb-0683329db2ad"
}

