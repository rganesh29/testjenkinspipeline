 provider "aws" {
  region = "us-east-1" 
}

resource "aws_instance" "logic1" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"  # Set the instance type as needed
  key_name = "awskey1"

  tags = {
    Name = "ubuntu1" 
  }
}

resource "aws_instance" "logic2" {
  ami           = "ami-0fc5d935ebf8bc3bc"
  instance_type = "t2.micro"  # Set the instance type as needed
  key_name = "awskey1"

  tags = {
    Name = "ubuntu2" 
  }
}