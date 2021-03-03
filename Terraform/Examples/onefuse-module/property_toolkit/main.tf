module "properties" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ptk"
  property_set = var.property_set
  template_properties = {
      "folderGroup"      = "PiedPiper"
      "folderEnv"        = "PROD"
    }
}