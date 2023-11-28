output "instance_id" {
  value       = aws_instance.instance[*].id
  description = "EC2 Instance ID"
}

output "instance_pbl_ip" {
  value       = aws_instance.instance[*].public_ip
  description = "Public IP address"
}

output "instance_pvt_ip" {
  value       = aws_instance.instance[*].private_ip
  description = "Public IP address"
}
