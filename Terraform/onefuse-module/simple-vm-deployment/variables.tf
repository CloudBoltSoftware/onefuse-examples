//OneFuse Provider Inputs
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

//vsphere provider inputs
variable "vsphere_user" {
        type = string
}

variable "vsphere_password" {
        type = string
}

variable "vsphere_server" {
        type  = string
}

//Module Inputs
variable "environment" {
  type = string
  default = "prod"
}

variable "location" {
  type = string
  default = "atl"
}

variable "group" {
  type = string
  default = "piedpiper"
}

variable "application" {
  type = string
  default = "linux"
}