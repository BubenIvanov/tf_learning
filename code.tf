provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}

resource "aws_s3_bucket" "tf_course" {
  bucket = "tf_course_19941995"
  ac1    = "private"
}