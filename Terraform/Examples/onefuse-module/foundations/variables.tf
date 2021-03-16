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
  default = ""
}

variable "ad_policy" {
  type = string
  default = ""
}

variable "use_ad" {
  type = string
  default = ""
}

variable "ipam_policy" {
  type = string
  default = ""
}

variable "dns_policy" {
  type = string
  default = ""
}