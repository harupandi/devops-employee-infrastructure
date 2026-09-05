variable "name" {
  description = "Cluster Name"
  type        = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type    = string
  default = "South Central US"
}

variable "address_space" {
  type = list(string)
}

variable "subnets" {
  type = map(object({
    address_prefixes = list(string)
  }))
}

variable "enable_nsg" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}