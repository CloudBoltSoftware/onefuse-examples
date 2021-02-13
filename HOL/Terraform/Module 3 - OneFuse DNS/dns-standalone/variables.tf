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
  default = "" // Default
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

variable "onefuse_template_properties" {
  type = map
  default = {
      "nameEnvironment"               = "p"
      "nameOS"         	              = "w"
      "nameApplication"               = "ap"
      "nameLocation"                  = "east"
      "dnsSuffix"                    = "infoblox851.sovlabs.net"
  }
}
