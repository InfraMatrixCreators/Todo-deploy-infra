module "Resource_group" {
  source         = "../../Modules/Azurerm_Resource_Group"
  Resource_group = var.Resource_group
}
module "network" {
  depends_on = [module.Resource_group]
  source     = "../../Modules/Azurerm_Networking"
  networking = var.networking
}
module "publicip" {
  depends_on = [module.Resource_group]
  source     = "../../Modules/Azurerm_Public_ip"
  publicip   = var.publicip
}
module "vm" {
  depends_on = [module.Resource_group, module.network, module.publicip]
  source     = "../../Modules/Azurerm_Computing"
  vms        = var.vms
}
module "dbserver" {
  depends_on = [module.Resource_group]
  source     = "../../Modules/Azurerm_mssql_server"
  server     = var.server
}


module "dbase" {
  depends_on = [module.Resource_group, module.dbserver]
  source     = "../../Modules/Azurerm_mssql_database"
  tododb     = var.tododb
}




























