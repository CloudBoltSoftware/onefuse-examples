data "vsphere_datacenter" "datacenter" {
      name = "SovLabs"
}

resource "vsphere_folder" "folder" {
      path = var.path
      type = "vm"
      datacenter_id = data.vsphere_datacenter.datacenter.id
}