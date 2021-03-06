variable "onefuse_scheme" {
  type = string
  default = "https"
}

variable "onefuse_address" {
  type = string
  default = "onefuse.lab.local"
}

variable "onefuse_port" {
  type = string
  default = "443"
}

variable "onefuse_user" {
  type = string
  default = "admin"
}

variable "onefuse_password" {
  type = string
  default = "Go2atc4labs!"
}

variable "onefuse_verify_ssl" {
  type = bool
  default = false
}

variable "workspace_url" {
  type = string
  default = "" // Default
}

variable "vsphere_server" {
  type = string
  default = "vc-01.lab.local" // Default
}


variable "vsphere_user" {
  type = string
  default = "administrator@vsphere.local" // Default
}

variable "vsphere_password" {
  type = string
  default = "Go2atc4labs!" // Default
}


variable "environment" {
  type = string
  default = "prod" // Default
}

variable "location" {
  type = string
  default = "east" // Default
}

variable "application" {
  type = string
  default = "wordpress" // Default
}

variable "size" {
  type = string
  default = "small" // Default
}

variable "compliance" {
  type = string
  default = "sox" // Default
}
