provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}

resource "aws_s3_bucket" "tf_course" {
  bucket = "tf-course-19941995"
  acl    = "private"
}

resource "aws_default_vpc" "default" {}

resource "aws_security_group" "prod_web" {
  name = "prod_web"
  description = "Allow standaty http snd https ports"

  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
  } 
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 443
    to_port = 443
    protocol = "tcp"
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  tags = {
    "Terraform" : "true"
  }
}