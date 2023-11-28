output "alb_dns" {
  value       = aws_alb.alb.dns_name
  description = "Application Load balancer DNS"
}

output "alb_arn" {
  value       = aws_alb.alb.arn
  description = "Application Load balancer ARN"
}
