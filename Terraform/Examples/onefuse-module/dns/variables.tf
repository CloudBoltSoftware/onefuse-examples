//OneFuse provider inputs
 "onefuse_scheme" {
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

//OneFuse module inputs
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

variable "ip_address" {
  type = string
}

variable "dns_zones" {
  type = string
}

variable "hostname" {
  type = string
}

variable "policy" {
  type = string
  default = "" // Default
}