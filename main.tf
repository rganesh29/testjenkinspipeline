provider "aws" {
  region = var.region
}
ubuntu@ip-172-31-42-222:~/terraform$ cat main.tf 
resource "aws_instance" "logic1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = var.user_data1
  tags = {
    Name = var.name1
  }
}

resource "aws_instance" "logic2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = var.user_data2
  tags = {
    Name = var.name2
  }
}

resource "aws_instance" "logic3" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = var.user_data3
  tags = {
    Name = var.name3
  }
}