output "ec2_sg_id" {
  value       = module.ec2_sg_module.sg_id
  description = "Security Group for Web instance"
}

output "instance_id" {
  value       = module.ec2_module.instance_id
  description = "EC2 Instance ID"
}

output "instance_arn" {
  value       = module.ec2_module.instance_arn
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

output "pvt_alb_dns" {
  value       = module.pvt_alb_module.alb_dns
  description = "Private Application Load balancer DNS Name"
}
