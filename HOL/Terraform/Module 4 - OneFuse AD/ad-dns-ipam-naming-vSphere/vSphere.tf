provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server
  version = "~> 1.20"

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

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
  name          = onefuse_ipam_record.ipam-record.network //Network information provided by OneFuse IPAM
  datacenter_id = data.vsphere_datacenter.dc.id
}
 
data "vsphere_virtual_machine" "template" {
  name          = "CentOS7"
  datacenter_id = data.vsphere_datacenter.dc.id
}


#Virtual Machine Resource
resource "vsphere_virtual_machine" "vsphereweb1" {
depends_on = [onefuse_microsoft_ad_computer_account.computer]

    // Use OneFuse generated name for VM hostname and domain
    name = onefuse_naming.name.name //Name provided by OneFuse Naming

  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_cluster_id = data.vsphere_datastore_cluster.datastore_cluster.id
  folder = "VRM-BACKUPEXCLUDED/pre-sales-demo/"
 
  num_cpus = "1"
  memory   = "8096"
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
        host_name  = onefuse_naming.name.name //OneFuse generated name
        domain = onefuse_naming.name.dns_suffix //DNS Suffix provided by OneFuse
      }
 
      network_interface {
        ipv4_address = onefuse_ipam_record.ipam-record.ip_address //IP Address Provided by OneFuse
        ipv4_netmask = substr(onefuse_ipam_record.ipam-record.subnet, -2, -1) //Netmask provided by OneFuse
      }
 
      ipv4_gateway = onefuse_ipam_record.ipam-record.gateway //Gateway provided by OneFuse
    }
  }
}
