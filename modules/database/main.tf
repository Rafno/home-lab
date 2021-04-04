module "database" {
    
    resource "azurerm_sql_server" "server" {
  name                         = "rafnar-server"
  resource_group_name          = var.resource_group_name
  location                     = "West US"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_sql_database" "database" {
  name                = var.name
  resource_group_name = azurerm_resource_group.example.name
  location            = var.location
  server_name         = azurerm_sql_server.server.name

}