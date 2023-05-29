terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.0.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "nick_rg"
    storage_account_name = "namanbackend"
    container_name = "tfstate"
    key = "terraform.tfstate"
  }
}


provider "azurerm" {
  features {
    
  }
}

module "ResourceGroup" {
  source = "./ResourceGroup"
  base_name = "NamanRG1"
  location = "East US"
}

module "StorageAccount" {
  source = "./StorageAccount"
  base_name = "NamanSG1"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = "East US"
}