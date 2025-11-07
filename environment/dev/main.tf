module "rg" {
    source = "../../modules/azurerm_rg"
    rgs = var.rgs
}

module "vnet" {
    depends_on = [ module.rg ]
    source = "../../modules/azurerm_vnet"
    vnets = var.vnets
}

module "pip" {
    depends_on = [ module.rg ]
    source = "../../modules/azurerm_pip"
    pips = var.pips
}
module "nsg" {
    depends_on = [ module.rg, module.vnet ]
    source = "../../modules/azurerm_nsg"
    nsgs =  var.nsgs
}
module "vm" {
    depends_on = [ module.rg, module.vnet, module.secret, module.key ]
    source = "../../modules/azurerm_vm"
    vms = var.vms
}
module "key" {
    depends_on = [ module.rg ]
    source = "../../modules/azurerm_key_vault"
    keys = var.keys
}
module "secret" {
    depends_on = [ module.rg, module.key ]
    source = "../../modules/azurerm_kv_secret"
    secrets = var.secrets 
}

module "server" {
    depends_on = [ module.rg ]
    source = "../../modules/azurerm_mysql_server"
    servers = var.servers
  
}

module "database" {
    depends_on = [ module.rg, module.server ]
    source = "../../modules/azurerm_mysql_database"
    databases =  var.databases
  
}