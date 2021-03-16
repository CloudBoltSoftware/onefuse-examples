module "onefuse" {
    source = "git::https://github.com/CloudBoltSoftware/terraform-module-onefuse.git?ref=v1.2-beta.1"
 
 // Policy assignments
    name_policy = var.name_policy
    ipam_policy = var.ipam_policy
    ad_policy = var.ad_policy
    dns_policy = var.dns_policy
    template_properties = var.template_properties

//
// Additional variables if using modules independent of each other
//
//  hostname = "sid-test-nn" 
//  dns_suffix = "infoblox851.sovlabs.net"
//  ip_address = "10.30.29.240"   
}