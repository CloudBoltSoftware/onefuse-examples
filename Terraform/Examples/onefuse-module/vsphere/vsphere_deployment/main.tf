module "web" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/standard_build"
  template_properties      = var.template_properties
  name_policy              = var.name_policy
  environment              = var.environment
  application              = var.application
  group                    = var.group
  size                     = var.size
  location                 = var.location
  datacenter    = local.vsphere_cluster.datacenter
  cluster       = local.vsphere_cluster.cluster
  datastore     = local.vsphere_cluster.datastore
}
module "db" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/standard_build"
  template_properties      = var.template_properties
  name_policy              = var.name_policy
  environment              = var.environment
  application              = var.application
  group                    = var.group
  size                     = var.size
  location                 = var.location
  datacenter    = local.vsphere_cluster.datacenter
  cluster       = local.vsphere_cluster.cluster
  datastore     = local.vsphere_cluster.datastore
}