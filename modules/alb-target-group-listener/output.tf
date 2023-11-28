output "alb_listener_arn" {
  value       = aws_alb_listener.alb_listener.arn
  description = "Application Load balancer Listener ARN"
}
