terraform {
  required_providers {
    onefuse = {
      source  = "CloudBoltSoftware/onefuse"
      version = ">= 1.20.0"
   }
   bigip = {
      source = "F5Networks/bigip"
      version = "1.8.0"
    }
  }
  required_version = ">= 0.13"
}