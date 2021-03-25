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

// Begin module inputs
variable "template_properties" {
type = map
}


variable "name_policy" {
  type = string
}

variable "ad_policy" {
  type = string
}

variable "ipam_policy" {
  type = string
}

variable "dns_policy" {
  type = string
}

variable "ansible_policy" {
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