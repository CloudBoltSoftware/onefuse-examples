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

variable "workspace_url" {
  type = string
  default = ""
}

variable "name_policy" {
  type = string
  default = "machine"
}

variable "ad_policy" {
  type = string
  default = "prod"
}

variable "ipam_policy" {
  type = string
  default = "atlprod"
}

variable "dns_policy" {
  type = string
  default = "prod"
}

// Begin module inputs
variable "template_properties" {
type = map
default = {
      "nameEnv"               = "p"
      "nameOS"         	      = "w"
      "nameDatacenter"        = "por"
      "nameApp"               = "ap"
      "nameLocation"          = "atl"
      "nameGroup"             = "pp"
      "ouGroup"               = "PiedPiper"
      "ouEnv"                 = "PRD"
      "dnsSuffix"             = "infoblox851.sovlabs.net"
      "sgEnv"                 = "prod"
  }
}