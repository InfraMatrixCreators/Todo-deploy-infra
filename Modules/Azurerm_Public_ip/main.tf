resource "azurerm_public_ip" "publicip" {
  for_each             = var.publicip
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  location             = each.value.location
  allocation_method    = each.value.allocation_method
  ddos_protection_mode = lookup(each.value, "ddos_protection_mode", "VirtualNetworkInherited")
  sku                  = lookup(each.value, "sku", "Standard")
}
