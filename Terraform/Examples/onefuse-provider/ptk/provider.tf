 terraform {
  required_providers {
    onefuse = {
      source  = "CloudBoltSoftware/onefuse"
   }
  }
  required_version = ">= 0.13"
 }

 provider "onefuse" {

  scheme     = var.onefuse_scheme
  address    = var.onefuse_address
  port       = var.onefuse_port
  user       = var.onefuse_user
  password   = var.onefuse_password
  verify_ssl = var.onefuse_verify_ssl
}