module "RG" {
  source              = "./module/RG"
  resource_group_name = var.resource_group_name
  location            = var.location

}

module "vnet" {
  depends_on          = [module.RG]
  source              = "./module/vnet"
  resource_group_name = var.resource_group_name
  vnet_docker_name    = var.virtual_network_name
  location            = var.location
}

module "subnet" {
  depends_on           = [module.vnet]
  source               = "./module/subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  subnet_name          = var.azurerm_subnet_name
}

module "vm" {
  depends_on                     = [module.subnet]
  source                         = "./module/vm"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  nic_name                       = var.nic_name
  ip_configuration_name          = var.ip_configuration_name
  Docker_vm_name                 = var.Docker_vm_name
  vm_size                        = var.vm_size
  image_publisher                = var.image_publisher
  os_disk_name                   = var.os_disk_name
  os_disk_caching                = var.os_disk_caching
  os_disk_create_option          = var.os_disk_create_option
  os_disk_managed_disk_type      = var.os_disk_managed_disk_type
  virtual_network_name           = var.virtual_network_name
  computer_name                  = var.computer_name
  azurerm_network_interface_name = var.nic_name
  admin_username                 = var.admin_username
  azurerm_subnet_name            = var.azurerm_subnet_name
  subnet_name                    = var.azurerm_subnet_name
  admin_password                 = var.admin_password
}

