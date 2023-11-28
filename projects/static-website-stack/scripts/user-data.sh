#!/bin/bash
sudo yum update -y
sudo yum install -y httpd.x86_64
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
sudo echo "Httpd installation completed"
sudo chown ec2-user /var/www/html
sudo chmod -R o+r /var/www/html
sudo echo "<html><h1>Hello! from Amazon EC2 Instance deployed using Terraform and Jenkins.</h1></html>" > /var/www/html/index.html