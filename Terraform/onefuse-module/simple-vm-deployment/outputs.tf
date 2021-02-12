//Deployment name
output "deployment_name" {
  value = module.deployment.hostname
}

//Output name from Naming module
output "web_hostname" {
  value = module.web.hostname
}

//Output Network from IPAM module
output "web_network" {
  value = module.web.network
}

//Output IP address from IPAM module
output "web_ip_address" {
  value = module.web.ip_address
}

//Output netmask address from IPAM module
output "web_netmask" {
  value = module.web.netmask
}

//Output gateway from IPAM module
output "web_gateway" {
  value = module.web.gateway
}

//Output fqdn from IPAM module
output "web_fqdn" {
  value = module.web.fqdn
}

//Output ad_ou from AD module
output "web_ad_ou" {
  value = module.web.ad_ou
}



//Output name from Naming module
output "app_hostname" {
  value = module.app.hostname
}

//Output Network from IPAM module
output "app_network" {
  value = module.app.network
}

//Output IP address from IPAM module
output "app_ip_address" {
  value = module.app.ip_address
}

//Output netmask address from IPAM module
output "app_netmask" {
  value = module.app.netmask
}

//Output gateway from IPAM module
output "app_gateway" {
  value = module.app.gateway
}

//Output fqdn from IPAM module
output "app_fqdn" {
  value = module.app.fqdn
}

//Output ad_ou from AD module
output "app_ad_ou" {
  value = module.app.ad_ou
}


//Output name from Naming module
output "db_hostname" {
  value = module.db.hostname
}

//Output Network from IPAM module
output "db_network" {
  value = module.db.network
}

//Output IP address from IPAM module
output "db_ip_address" {
  value = module.db.ip_address
}

//Output netmask address from IPAM module
output "db_netmask" {
  value = module.db.netmask
}

//Output gateway from IPAM module
output "db_gateway" {
  value = module.db.gateway
}

//Output fqdn from IPAM module
output "db_fqdn" {
  value = module.db.fqdn
}

//Output ad_ou from AD module
output "db_ad_ou" {
  value = module.db.ad_ou
}