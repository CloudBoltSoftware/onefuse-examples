variable "property_sets" {
  type = map(string)
  default = {
  sps_env = "sid"
  sps_location = "sid"
  sps_group = "sid"
  sps_app = "sid"
  sps_size = "sid"
  sps_global = "props"
  }
}