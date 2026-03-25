# These values can be used by other modules
output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.main.id
}

output "subnet_ids" {
  description = "IDs of created subnets"
  value       = aws_subnet.public[*].id
}