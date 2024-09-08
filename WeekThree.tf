resource "aws_s3_bucket" "bucket3" {
  bucket = "my-bucket-weekthree-123"
}
resource "aws_s3_object" "object" {
  bucket ="my-bucket-weekthree-123"
  key    = "logs/"
}
terraform {
  backend "s3" {
    bucket         = "my-bucket-weekthree-123"
    key            = "erakiterrafrom.tfstate"
    region = "eu-central-1"
}
}
