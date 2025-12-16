terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.54.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "todo_app_rg"
    storage_account_name = "todostorage2025"
    container_name       = "testcontainer2025"
    key                  = "test.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "0fed9206-7606-41d6-bea8-83033d2b432f"
}


