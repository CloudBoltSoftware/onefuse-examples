provider "aws" {
  region     = var.aws_region
  access_key = var.aws_key_id
  secret_key = var.aws_access_key
}