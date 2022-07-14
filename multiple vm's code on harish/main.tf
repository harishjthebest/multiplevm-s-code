module "configuration1" {
  source = "./NIC"
  counting = 3 
  nic = "nic_count"
  ipconfig = "hariship"
  vsubid = module.configuration4.vsubid
  location = "eastus"
  rg = module.configuration2.rgid
}
module "configuration2" {
  source = "./Resourcegroup"
  resource_group = "harishRG"
  location = "eastus"
}
module "configuration3" {
  source = "./VM"
  counting = 3 
  size = "standard_f2"
  vmuser_name = "harishweb1"
  user_password = "webharish@2022"
  rights = "ReadWrite"
  storage = "Standard_LRS"
  micsft = "microsoftwindowsserver"
  win = "windowsserver"
  vmwin_versing = "2016-datacenter"
  location = "eastus"
  rg = module.configuration2.rgid
  nic = module.configuration1.nicid
}
module "configuration4" {
  source = "./VNet"
  vnet = "harishvnet"
  cidr_block = "190.162.0.0/16"
  vsub = "harishsubnet"
  ip_address = "190.162.2.0/24"
  location = "eastus"
  rg = module.configuration2.rgid
}
module "configuration5" {
  source = "./security"
  vsubid = module.configuration4.vsubid
  location = "eastus"
  rg = module.configuration2.rgid  
}