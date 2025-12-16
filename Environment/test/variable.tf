variable "Resource_group" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = optional(map(string))
  }))
}

variable "networking" {
  type = map(object({
    name                           = string
    location                       = string
    resource_group_name            = string
    address_space                  = list(string)
    private_endpoint_vnet_policies = optional(string)
    subnet = optional(list(object({
      name             = string
      address_prefixes = list(string)
    })))
  }))
}
variable "publicip" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    location             = string
    allocation_method    = string
    ddos_protection_mode = optional(string)
    sku                  = optional(string)
  }))
}
variable "vms" {
  type = map(object({
    nicname        = string
    vmname         = string
    size           = string
    script_name    = string
    admin_username = string
    admin_password = string
    os_disk = map(object({
      caching              = string
      storage_account_type = string
    }))
    source_image_reference = map(object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    }))
    resource_group_name   = string
    location              = string
    subnetname            = string
    virtual_network_name  = string
    publicipname          = string
    ip_forwarding_enabled = optional(string)

    ip_configuration = map(object({
      ipconfigname                  = string
      private_ip_address_allocation = string
    }))
  }))
}
variable "server" {
  type = map(object({
    dbservername                 = string
    resource_group_name          = string
    location                     = string
    dbserverversion              = string
    administrator_login          = string
    administrator_login_password = string
    minimum_tls_version          = string
    tags                         = map(string)
  }))
}
variable "tododb" {
  type = map(object({
    tododbname          = string
    collation           = string
    license_type        = string
    max_size_gb         = number
    sku_name            = string
    enclave_type        = string
    dbservername        = string
    resource_group_name = string
    tags                = map(string)
  }))
}



