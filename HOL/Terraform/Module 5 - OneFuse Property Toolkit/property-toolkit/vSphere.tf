provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

###  vSphere Machine Deployment ###

#Data Sources
data "vsphere_datacenter" "dc" {
  name = "lab-dc"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "LAB-Cluster"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_host" "esxi_host" {
  name = "lab-esxi-01.lab.local"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name           = "lab-esxi-01"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = onefuse_ipam_record.ipam-record.network //Network information provided by OneFuse IPAM
  datacenter_id = data.vsphere_datacenter.dc.id
}
 
data "vsphere_virtual_machine" "template" {
  name          = local.template //Provided by OneFuse
  datacenter_id = data.vsphere_datacenter.dc.id
}

#Virtual Machine Resource
resource "vsphere_virtual_machine" "vm" {
depends_on = [onefuse_microsoft_ad_computer_account.computer]

    // Use OneFuse generated name for VM hostname and domain
    name = onefuse_naming.name.name //Name provided by OneFuse Naming

  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id = data.vsphere_datastore.datastore.id
  folder = format("Lab_Deployments/%s", local.onefuse_template_properties.vCenterFolder)
 
  num_cpus = local.cpuCount //Provided by OneFuse
  memory   = local.memSize //Provided by OneFuse
  guest_id = data.vsphere_virtual_machine.template.guest_id
 
  scsi_type = data.vsphere_virtual_machine.template.scsi_type
 
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = "vmxnet3"
  }
 
  cdrom {
    client_device = true
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
