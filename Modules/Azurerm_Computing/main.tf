resource "azurerm_network_interface" "nic" {
  for_each = var.vms
  name = each.value.nicname
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  ip_forwarding_enabled = lookup(each.value, "ip_forwarding_enabled", "false")

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration
    content {
      name = ip_configuration.value.ipconfigname
      subnet_id = data.azurerm_subnet.nicsubnet[each.key].id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
      public_ip_address_id = data.azurerm_public_ip.nicpublicip[each.key].id
    }
  }
}
data "azurerm_subnet" "nicsubnet" {
  for_each = var.vms
  name = each.value.subnetname
  virtual_network_name = each.value.virtual_network_name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_public_ip" "nicpublicip" {
  for_each = var.vms
  name = each.value.publicipname
  resource_group_name = each.value.resource_group_name
}
resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.vms
  name = each.value.vmname
  resource_group_name = each.value.resource_group_name
  location = each.value.location
  size = each.value.size
  custom_data = base64encode(file(each.value.script_name))
  admin_username = each.value.admin_username
  admin_password = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids = [azurerm_network_interface.nic[each.key].id]
  dynamic "os_disk" {
    for_each = each.value.os_disk
    content {
      caching = os_disk.value.caching
      storage_account_type = os_disk.value.storage_account_type
    }
    }
    dynamic "source_image_reference" {
      for_each = each.value.source_image_reference
      content {
        publisher = source_image_reference.value.publisher
        offer = source_image_reference.value.offer
        sku = source_image_reference.value.sku
        version = source_image_reference.value.version
      }
    }
}