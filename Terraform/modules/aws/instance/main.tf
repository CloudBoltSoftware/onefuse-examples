resource "aws_instance" "instance" {
  ami           = "ami-0bbe28eb2173f6167"
  instance_type = "t2.micro"
  subnet_id   = onefuse_ipam_record.ipam-record.network
  private_ip = onefuse_ipam_record.ipam-record.ip_address 
 
    tags = {
      Name = onefuse_naming.instance.name
    }
}