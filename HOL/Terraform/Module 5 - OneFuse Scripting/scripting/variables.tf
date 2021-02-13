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

variable "name" {
  type = string
}

variable "onefuse_verify_ssl" {
  type = bool
  default = false
}

variable "workspace_url" {
  type = string
  default = "" // Default
}

variable "username" {
  type = string
  default = "" // Default
}

variable "firstname" {
  type = string
  default = "" // Default
}

variable "lastname" {
  type = string
  default = "" // Default
}

variable "domain" {
  type = string
  default = "" // Default
}


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
      "OneFuse_VmNic0.fqdn"   = ""
  }
}
