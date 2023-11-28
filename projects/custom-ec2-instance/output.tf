output "ec2_sg_id" {
  value       = module.pro1_ec2_sg.sg_id
  description = "Security Group for Web instance"
}

output "instance_id" {
  value       = module.pro1_ec2.instance_id
  description = "EC2 Instance ARN"
}

output "instance_pbl_ip" {
  value       = module.pro1_ec2.instance_pbl_ip
  description = "Public IP address"
}

output "instance_pvt_ip" {
  value       = module.pro1_ec2.instance_pvt_ip
  description = "Public IP address"
}