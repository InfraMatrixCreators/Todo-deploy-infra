variable "server" {
  type = map(object({
    dbservername = string
    resource_group_name = string
    location = string
    dbserverversion = string
    administrator_login = string
    administrator_login_password = string
    minimum_tls_version = string
    tags = map(string)
  }))
}