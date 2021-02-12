variable "aws_key_id" {
  type = string
  default = ""
}

variable "aws_access_key" {
  type = string
  default = ""
}

variable "aws_region" {
  type = string
  default = "us-east-2"
}

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

variable "onefuse_template_properties" {
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

variable "default_tags" { 
    type = map 
    default = {data.onefuse_static_property_set.aws_tags.required_tags} 
}