#!/bin/bash
yum -y update
yum install -y ruby
yum install -y aws-cli
yum install -y php54
yum install -y mysql55-server
cd /home/ec2-user
wget https://aws-codedeploy-us-west-1.s3.amazonaws.com/latest/install
chmod +x ./install
./install auto
service httpd start
chkconfig httpd on
