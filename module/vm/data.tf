# data "azurerm_network_interface" "nic_data" {
#   name                = var.azurerm_network_interface_name
#   resource_group_name = var.resource_group_name
# }

data "azurerm_subnet" "subnet_id_data" {
  name                 = var.azurerm_subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}
