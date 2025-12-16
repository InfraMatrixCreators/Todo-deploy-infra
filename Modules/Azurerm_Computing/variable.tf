variable "vms" {
  type = map(object({
    nicname                 = string
    vmname = string
    size = string
    script_name = string
    admin_username = string
    admin_password = string
    os_disk = map(object({
      caching = string
      storage_account_type = string 
    }))
    source_image_reference = map(object({
      publisher = string
      offer = string
      sku = string
      version = string 
    }))
    resource_group_name     = string
    location                = string
    subnetname              = string
    virtual_network_name    = string
    publicipname            = string
    ip_forwarding_enabled   = optional(string)

    ip_configuration = map(object({
      ipconfigname                  = string
      private_ip_address_allocation = string
    }))
  }))
}