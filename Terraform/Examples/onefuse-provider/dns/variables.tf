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

variable "ip_address" {
  type = string
}

variable "dnsSuffix" {
  type = string
}

variable "hostname" {
  type = string
}

variable "template_properties" {
  type = map
}
variable "policy" {
  type = string

}
