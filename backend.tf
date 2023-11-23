terraform {
  backend "s3" {
    bucket         = "bucketforstatefile"
    key            = "terraform.tfstate"
    region         = "us-east-1"  # Replace with your bucket's region
  }
}
