  data "onefuse_static_property_set" "aws_tags" {
  name = "sps_tags_aws"
}

data "onefuse_naming_policy" "policy" {
  name = "machine"
}

resource "onefuse_naming" "instance" {
  naming_policy_id        = data.onefuse_naming_policy.policy.id
  template_properties     = var.onefuse_template_properties
}

// OneFuse Data Source for IPAM Policy to lookup policy ID
data "onefuse_ipam_policy" "policy" {
  name = "awseastprodapp"
}

// OneFuse Resource for IPAM Record
resource "onefuse_ipam_record" "ipam-record" {
    
    hostname = onefuse_naming.instance.name
    policy_id = data.onefuse_ipam_policy.policy.id
    workspace_url = var.workspace_url
    template_properties = var.onefuse_template_properties
}


resource "aws_instance" "instance" {
  ami           = "ami-0bbe28eb2173f6167"
  instance_type = "t2.micro"
  subnet_id   = onefuse_ipam_record.ipam-record.network
  private_ip = onefuse_ipam_record.ipam-record.ip_address 
 
    tags = "merge
              (map
                ( 
                  Name = onefuse_naming.instance.name
                ),
              data.onefuse_static_property_set.aws_tags.required_tags
              )"
}