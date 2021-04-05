module "f5vip" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/F5/F5_main"
    f5sps = var.f5sps
    template_properties = var.template_properties
}

module "f5node" {
    source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/F5/Node"
    f5sps = var.f5sps
    name = local.node
    description  = "Test Module Deploy"
    address = onefuse_ipam_record.ipam-record.ip_address
    pool = module.f5vip.pool_name
}

