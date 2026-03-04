terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "AzureResourceGroup1"
  location = "westus2"
}

resource "azurerm_virtual_network" "vnet" {
    name = "AzureVnet"
    address_space = ["10.0.0.0/16"]
    location = "westus2"
    resource_group_name = azurerm_resource_group.rg.name
}