variable "networking" {
  type = map(object({
    name = string
    location = string
    resource_group_name = string
    address_space = list(string)
    private_endpoint_vnet_policies = optional(string)
    subnet = optional (list(object({
      name = string
      address_prefixes = list(string)
    })))
  }))
}