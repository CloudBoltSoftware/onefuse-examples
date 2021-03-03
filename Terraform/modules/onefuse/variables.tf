variable "name_policy" {
  type = string
}

variable "ad_policy" {
  type = string
}

variable "ipam_policy" {
  type = string
}

variable "dns_policy" {
  type = string
}

variable "template_properties" {
  type = map
}

variable "name_count" {
  type = number
  default = 0
}

variable "ipam_count" {
  type = number
  default = 0
}

variable "dns_count" {
  type = number
  default = 0
}

variable "ad_count" {
  type = number
  default = 0
}