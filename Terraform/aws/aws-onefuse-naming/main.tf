data "onefuse_naming_policy" "policy" {
  name = "machine"
}

resource "onefuse_naming" "instance" {
  naming_policy_id        = data.onefuse_naming_policy.policy.id
  template_properties     = var.onefuse_template_properties
}

resource "aws_instance" "instance" {
  ami           = "ami-0bbe28eb2173f6167"
  instance_type = "t2.micro"

    tags = {
      Name = onefuse_naming.instance.name
    }
}