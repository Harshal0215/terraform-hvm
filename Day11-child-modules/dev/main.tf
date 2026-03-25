# Variables for this environment
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-2"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

# Module 1: Create VPC
module "vpc" {
  source = "../modules/vpc"

  vpc_name          = "${var.environment}-vpc"
  vpc_cidr          = "10.0.0.0/16"
  subnet_cidrs      = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b"]
}

# Module 2: Create Security Group
# Notice: This module uses vpc_id from the vpc module output
module "security" {
  source = "../modules/security"

  security_group_name = "${var.environment}-web-sg"
  vpc_id              = module.vpc.vpc_id  # ← Data flows from VPC module to Security module
}

# Module 3: Create Web Servers
# Notice: This module uses outputs from both VPC and Security modules
module "webserver" {
  source = "../modules/webserver"

  server_name         = var.environment
  instance_count      = 2
  subnet_ids          = module.vpc.subnet_ids      # ← From VPC module
  security_group_ids  = [module.security.security_group_id]  # ← From Security module
}