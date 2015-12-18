#!/bin/bash

# Install / update packages
yum -y update
yum install -y ruby
yum install -y aws-cli
yum install -y php54
yum install -y mysql55-server

# Install Amazon Code Deploy
cd /home/ec2-user
wget https://aws-codedeploy-us-west-1.s3.amazonaws.com/latest/install
chmod +x ./install
./install auto

# Create heardbeat file.
cd /var/www/html/
touch heartbeat.php
echo "<?php echo 'I am alive.' ?>" > heartbeat.php

# Turn on Apache
service httpd start
chkconfig httpd on

# Tests:

# Test Case: HTTPD
# Test: sudo service httpd status
# Result: httpd (pid  7033) is running...

# Test Case: AWS Code Deploy
# Test: sudo service codedeploy-agent status)
# Result: The AWS CodeDeploy agent is running as PID 6989

# Test Case: Access via HTTP
# Test: Navigate to IP Address in a web browser
# Result: web page returned

# Test Case: Check if alive.
# Test: Navigate to heartbeat.php
# Result: Retuned "I am alive."

# Test Case: Load Balancer
# Test: Add to a Load Balancer
# Result: Heath Status returned: InService

# Test Case: Deploy code to server
# Test: Deploy code from BitBucket
# Result: Succeeded
