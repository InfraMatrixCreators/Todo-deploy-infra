variable "tododb" {
  type = map(object({
    tododbname = string
    collation = string 
    license_type = string
    max_size_gb = number
    sku_name = string
    enclave_type = string
    dbservername = string
    resource_group_name = string
    tags = map(string)
  }))
}