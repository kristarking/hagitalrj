terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.5.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "KingRG" {
  name     = "KingRG"
  location = "Central US"
}

resource "azurerm_virtual_network" "KingVnet" {
  name                = "KingVnet"
  location            = azurerm_resource_group.KingRG.location
  resource_group_name = azurerm_resource_group.KingRG.name
  address_space       = ["10.0.0.0/16"]
}
