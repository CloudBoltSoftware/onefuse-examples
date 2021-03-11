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
variable "template_properties" {
  type = map
}

variable "ipam_policy" {
  type = string
}

variable "naming_policy" {
  type = string
}

variable "ad_policy" {
  type = string
}

variable "dns_policy" {
  type = string
}

variable "script_policy" {
  type = string
}