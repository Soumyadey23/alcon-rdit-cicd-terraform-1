#!/bin/bash
sudo yum update -y

# mount ebs volume
ebs_mount_dir="/data"
ebs_device_name="nvme1n1"
ebs_filesystem=$(sudo lsblk -f | grep $ebs_device_name | awk '{print $2}' | xargs)

if [ "$ebs_filesystem" == "" ]
then
    echo "Configuring filesystem for '$ebs_device_name'..."
    sudo yum install -y xfsprogs
    sudo mkfs -t xfs /dev/$ebs_device_name
else
    echo "'$ebs_device_name' already have '$ebs_filesystem' filesystem."
fi

echo "Mount device-'$ebs_device_name' to directory-'$ebs_mount_dir'..."
sudo mkdir -p $ebs_mount_dir
sudo mount /dev/$ebs_device_name $ebs_mount_dir

echo "Automatically mount an attached volume after reboot."
ebs_filesystem=$(sudo lsblk -f | grep $ebs_device_name | awk '{print $2}' | xargs)
sudo cp /etc/fstab /etc/fstab.orig
ebs_uuid=$(sudo blkid | grep $ebs_device_name | awk '{print $2}' | xargs)
sudo echo "$ebs_uuid    $ebs_mount_dir      $ebs_filesystem     defaults,nofail 0   2" | sudo tee -a /etc/fstab

# Install httpd for poc testing
sudo yum install -y httpd.x86_64
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
sudo echo "Httpd installation completed"
sudo chown ec2-user /var/www/html
sudo chmod -R o+r /var/www/html
sudo echo "<html><h1>Hello from Amazon EC2 Instance $(hostname) deployed using Terraform and Jenkins.</h1></html>" > /var/www/html/index.html