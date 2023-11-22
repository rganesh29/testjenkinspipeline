variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for instances"
  default     = "ami-0fc5d935ebf8bc3bc"
}

variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name"
  default     = "awskey1"
}

variable "user_data1" {
  description = "User data for logic1"
  type        = string
  default     = <<EOF
                 #!/bin/bash
                 # User data for logic1
                 sudo apt update
               EOF
}

variable "user_data2" {
  description = "User data for logic2"
  type        = string
  default     = <<EOF
                 #!/bin/bash
                 # User data for logic2
                 sudo apt update
               EOF
}

variable "user_data3" {
  description = "User data for logic3"
  type        = string
  default     = <<EOF
                 #!/bin/bash
                 # User data for logic3
                 sudo apt update
               EOF
}

variable "name1" {
  description = "Name for logic1 instance"
  default     = "Ansible-master"
}

variable "name2" {
  description = "Name for logic2 instance"
  default     = "slave1-jen"
}

variable "name3" {
  description = "Name for logic3 instance"
  default     = "slave2-java"
}
