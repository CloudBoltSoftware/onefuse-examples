###  vSphere Machine Deployment ###

#Data Sources
data "vsphere_datacenter" "dc" {
  name = "SovLabs"
}

data "vsphere_datastore_cluster" "datastore_cluster" {
  name          = "SovLabs_XtremIO"
  datacenter_id = data.vsphere_datacenter.dc.id
}
 
data "vsphere_compute_cluster" "cluster" {
  name          = "Cluster1"
  datacenter_id = data.vsphere_datacenter.dc.id
}
 
data "vsphere_network" "network" {
  name          = var.network
  datacenter_id = data.vsphere_datacenter.dc.id
}
 
data "vsphere_virtual_machine" "template" {
  name          = var.template
  datacenter_id = data.vsphere_datacenter.dc.id
}


#Virtual Machine Resource
resource "vsphere_virtual_machine" "vm" {


    // Use OneFuse generated name for VM hostname and domain
    name = var.hostname

  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_cluster_id = data.vsphere_datastore_cluster.datastore_cluster.id
  folder = var.folder
 
  num_cpus = var.cpu
  memory   = var.memMb
  guest_id = data.vsphere_virtual_machine.template.guest_id
 
  scsi_type = data.vsphere_virtual_machine.template.scsi_type
 
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }
 
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks.0.size
    eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }
 
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
 
    customize {
      linux_options {
        host_name  = var.hostname
        domain = var.dns_suffix
      }
 
      network_interface {
        ipv4_address = var.ip_address
        ipv4_netmask = var.netmask
      }
 
      ipv4_gateway = var.gateway
    }
  }
}
