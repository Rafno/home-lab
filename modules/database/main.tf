module "database" {
    
    resource "azurerm_sql_server" "server" {
  name                         = "rafnar-server"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "15.0"
  administrator_login          = var.user
  administrator_login_password = var.pass
}

resource "azurerm_sql_database" "database" {
  name                = var.name
  resource_group_name = azurerm_resource_group.example.name
  location            = var.location
  server_name         = azurerm_sql_server.server.name

}