terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.54.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "Vaishno-RG"
    storage_account_name = "vaishnostg1"
    container_name       = "vaishnocontainer1"
    key                  = "Dev.terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
  subscription_id = "1f8db4a8-6e28-4a4d-a2fe-79d018ba6298"
}

