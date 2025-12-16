resource "azurerm_virtual_network" "networking" {
  for_each = var.networking
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space = each.value.address_space
  private_endpoint_vnet_policies = lookup(each.value, "private_endpoint_vnet_policies", "Disabled")

  dynamic "subnet" {
    for_each = lookup(each.value, "subnet", null) != null ? lookup(each.value, "subnet", []) : []
    content {
      name = subnet.value.name
      address_prefixes = subnet.value.address_prefixes
    }
  }
}

