output "public_ips" {
  description = "Public IP addresses of web servers"
  value       = aws_instance.web[*].public_ip
}

output "instance_ids" {
  description = "IDs of web servers"
  value       = aws_instance.web[*].id
}