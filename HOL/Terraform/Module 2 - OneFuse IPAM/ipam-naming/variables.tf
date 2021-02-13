variable "onefuse_scheme" {
  type = string
  default = "https"
}

variable "onefusebp_address" {
  type = string
  default = "onefuse12bp.sovlabs.net"
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
