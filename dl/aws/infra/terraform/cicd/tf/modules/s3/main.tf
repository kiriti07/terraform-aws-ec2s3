provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "example" {
  bucket = "example-bucket-name"
  acl    = "private"

  tags = {
    Name        = "Example Bucket"
    Environment = "Production"
  }

  versioning {
    enabled = true
  }

  logging {
    target_bucket = "example-logs-bucket"
    target_prefix = "s3-logs/"
  }

  lifecycle {
    prevent_destroy = false
  }
}

