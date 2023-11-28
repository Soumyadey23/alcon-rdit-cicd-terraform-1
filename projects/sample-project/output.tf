output "ec2_sg_id" {
  value       = module.ec2_sg_module.sg_id
  description = "Security Group for Web instance"
}

output "instance_id" {
  value       = module.ec2_module.instance_id
  description = "EC2 Instance ARN"
}

output "instance_pbl_ip" {
  value       = module.ec2_module.instance_pbl_ip
  description = "Public IP address"
}

output "instance_pvt_ip" {
  value       = module.ec2_module.instance_pvt_ip
  description = "Public IP address"
}

# output "volume_id" {
#   value       = module.ec2_module.volume_id
#   description = "EBS Volume ID"
# }