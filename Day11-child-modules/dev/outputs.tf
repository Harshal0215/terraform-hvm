output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "web_server_public_ips" {
  description = "Public IP addresses of web servers"
  value       = module.webserver.public_ips
}

output "web_server_urls" {
  description = "URLs to access web servers"
  value       = [for ip in module.webserver.public_ips : "http://${ip}"]
}