#!/bin/bash
hostnamectl set-hostname ${server-name}
yum update -y
yum install -y docker
systemctl start docker
systemctl enable docker
usermod -a -G docker ec2-user
# install docker-compose
curl -L "https://github.com/docker/compose/releases/download/2.39.1/docker-compose-$(uname -s)-$(uname -m)" \
-o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose