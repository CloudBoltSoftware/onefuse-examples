module "properties" {
  source = "github.com/CloudBoltSoftware/terraform-demo.git/modules/onefuse//ptk"
  property_set = "sps_sid_test"
  template_properties = {
      "folderGroup"      = "PiedPiper"
      "folderEnv"        = "PROD"
    }
}