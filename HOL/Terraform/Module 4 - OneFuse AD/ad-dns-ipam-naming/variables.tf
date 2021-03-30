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

//Deployment 1 Variables - Prod East
variable "ipam_policy" {
  type = string
  default = "prodeast" //prodeast, prodwest, deveast, or devwest
}

variable "onefuse_template_properties" {
  type = map
  default = {
      "nameEnvironment"               = "p"     //p for production or d for development
      "nameLocation"                  = "e"     //e for East or w for West
      "nameApplication"               = "wp"    //wp for wordpress or iis for IIS
      "nameOS"         	              = "l"     //l for Linux or w for Windows
      "nameCompliance"                = "pci"   //pci or sox
      "dnsZone"                       = "prod.lab.local" //dev.lab.local or prod.lab.local
      "ouEnvironment"                 = "Prod" //Prod or dev
  }
}


//Deployment 2 Variables - Dev West
/*
variable "ipam_policy" {
  type = string
  default = "devwest" //prodeast, prodwest, deveast, or devwest
}

variable "onefuse_template_properties" {
  type = map
  default = {
      "nameEnvironment"               = "d"     //p for production or d for development
      "nameLocation"                  = "w"     //e for East or w for West
      "nameApplication"               = "wp"    //wp for wordpress or iis for IIS
      "nameOS"         	              = "l"     //l for Linux or w for Windows
      "nameCompliance"                = "pci"   //pci or sox
      "dnsZone"                       = "dev.lab.local" //dev.lab.local or prod.lab.local
      "ouEnvironment"                 = "Dev" //Prod or dev
  }
}
*/
