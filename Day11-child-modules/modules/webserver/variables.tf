variable "server_name" {
  description = "Base name for web servers"
  type        = string
}

variable "instance_count" {
  description = "Number of web servers to create"
  type        = number
  default     = 1
}

variable "subnet_ids" {
  description = "List of subnet IDs to launch instances in"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs to attach"
  type        = list(string)
}