# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rafnar-sandbox"
  location = "North Europe"

  tags = var.required_tags
}

resource "azurerm_storage_account" "storage" {
  name                     = "rafnarstorage"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = var.required_tags
}

resource "azurerm_sql_server" "server" {
    name                         = "rafnar-server"
    resource_group_name          = azurerm_resource_group.rg.name
    location                     = azurerm_resource_group.rg.location
    version                      = "12.0"
    administrator_login          = var.USER
    administrator_login_password = var.PASSWORD
    }

    resource "azurerm_sql_database" "database" {
    name                = "Lyfjastofnun"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    server_name         = azurerm_sql_server.server.name
    edition             = "Basic"
    }