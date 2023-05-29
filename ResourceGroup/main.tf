resource "azurerm_resource_group" "nick_rg" {
  name     = "${var.base_name}RG"
  location = var.location
}