resource "aws_instance" "example" {
  ami           = "ami-0bbe28eb2173f6167"
  instance_type = "t2.micro"
}