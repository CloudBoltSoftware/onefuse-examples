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
variable "name_policy" {
  type = string
  default = "machine"
}

variable "ad_policy" {
  type = string
  default = "default"
}

variable "ipam_policy" {
  type = string
  default = "infoblox851_ipampolicy"
}

variable "dns_policy" {
  type = string
  default = "infoblox851_dnspolicy"
}

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