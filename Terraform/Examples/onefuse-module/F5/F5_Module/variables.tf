// Provider setup

variable "onefuse_scheme" {
  type = string
  default = "https"
}

variable "onefuse_address" {
  type = string
}

variable "onefuse_port" {
  type = string
}

variable "onefuse_user" {
  type = string
}

variable "onefuse_password" {
  type = string
}

variable "onefuse_verify_ssl" {
  type = bool
  default = false
}

variable "name_policy" {
  type = string
}

variable "environment" {
  type = string
}

variable "application" {
  type = string
}

variable "group" {
  type = string
}

variable "size" {
  type = string
}
variable "location" {
  type = string
}

variable "f5_hostname" {
  type = string
}

variable "f5_username" {
  type = string
}

variable "f5_password" {
  type = string
}

variable "template_properties" {
  type = map
}

variable "property_set" {
  type = string
}

variable "vsphere_user" {
  type = string
}

variable "vsphere_password" {
  type = string
}

variable "vsphere_server" {
  type  = string
}