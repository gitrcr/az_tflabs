module "rg" {
  source = "../../modules/resource_group"

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "network" {
  source = "../../modules/network"

  resource_group_name = module.rg.name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  admin_ip            = var.admin_ip

  subnets = {
    dmz = {
      address_prefixes = ["10.20.1.0/24"]
    }
    apps = {
      address_prefixes = ["10.20.2.0/24"]
    }
  }
}

module "linux_vm" {
  source              = "../../modules/linux"
  vm_name             = "nux1-dev-vm"
  location            = var.location
  resource_group_name = module.rg.name
  subnet_id           = module.network.subnet_ids["apps"]
  admin_username      = var.admin_username
  public_key          = var.public_key
  tags                = var.tags
}



module "windows_vm" {
  source = "../../modules/windows"

  vm_name             = "wd1-dev-vm"
  location            = var.location
  resource_group_name = module.rg.name
  subnet_id           = module.network.subnet_ids["dmz"]
  admin_username      = var.admin_username
  tags                = var.tags
}
