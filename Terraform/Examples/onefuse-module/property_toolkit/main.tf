module "properties" {
  source = "https://github.com/CloudBoltSoftware/onefuse-examples.git/modules/onefuse//ptk"
  property_set = "sps_sid_test"
  template_properties = {
      "folderGroup"      = "PiedPiper"
      "folderEnv"        = "PROD"
    }
}