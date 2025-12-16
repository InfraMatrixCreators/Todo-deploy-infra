resource "azurerm_resource_group" "rg" {
  for_each = var.Resource_group
  name = each.value.name
  location = each.value.location
  managed_by = lookup(each.value, "managed_by", null) != null ? each.value.managed_by : "jitu"
  tags = each.value.tags
  lifecycle {
    create_before_destroy = true
  }
}