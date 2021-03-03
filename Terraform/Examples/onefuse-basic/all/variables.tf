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

variable "onefuse_dns_zones" {
  type = list
  default = ["infoblox851.sovlabs.net"]
}

variable "workspace_url" {
  type = string
  default = "" // Default
}

variable "template_properties" {
  type = map
  default = {
      "nameEnv"               = "p"
      "nameOS"         	      = "l"
      "nameDatacenter"        = "por"
      "nameApp"               = "ap"
      "nameLocation"          = "atl"
      "nameGroup"             = "pp"
      "ouGroup"               = "PiedPiper"
      "ouEnv"                 = "PRD"
      "dnsSuffix"             = "infoblox851.sovlabs.net"
      "sgEnv"                 = "prod"
      "username"              = "sidtest"
      "firstname"             = "sid"
      "lastname"              = "test"
      "domain"                = "sovlabs.net"
  }
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