module "properties" {
  source = "github.com/CloudBoltSoftware/onefuse-examples.git/Terraform/modules/onefuse//ptk"
  property_set = "sps_sid_test"
  template_properties = {
      "folderGroup"      = "PiedPiper"
      "folderEnv"        = "PROD"
    }
}