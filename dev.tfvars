region = "us-east-1"
ami_id = "ami-0fc5d935ebf8bc3bc"
instance_type = "t2.micro"
key_name = "awskey1"

user_data1 = <<-EOF
              #!/bin/bash
              # User data for logic1
              # Additional commands for logic1
              sudo apt update
              sudo apt install -y pip
              sudo pip install ansible
            EOF
user_data2 = <<-EOF
              #!/bin/bash
              # User data for logic2
              # Additional commands for logic2
              sudo wget -O /usr/share/keyrings/jenkins-keyring.asc     https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
              echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]     https://pkg.jenkins.io/debian-stable binary/ | sudo tee     /etc/apt/sources.list.d/jenkins.list > /dev/null
              sudo apt-get update
              sudo apt-get install -y fontconfig openjdk-17-jre
              sudo apt-get install -y jenkins
            EOF
user_data3 = <<-EOF
              #!/bin/bash
              # User data for logic3
              # Additional commands for logic3
              sudo wget -O /usr/share/keyrings/jenkins-keyring.asc     https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
              echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]     https://pkg.jenkins.io/debian-stable binary/ | sudo tee     /etc/apt/sources.list.d/jenkins.list > /dev/null
              sudo apt-get update
              sudo apt-get install -y fontconfig openjdk-17-jre
            EOF

name1 = "Ansible-master"
name2 = "slave1-jen&java"
name3 = "slave2-java"            