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

variable "domain" {
  type = string
  default = "sovlabs.net"
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

variable "policy" {
  type = string
  default = "" // Default
}