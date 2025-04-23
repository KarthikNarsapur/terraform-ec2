variable "instance_name" {
  type        = string
  description = "Name of the EC2 instance"
  default = ""
}

variable "region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "ap-south-1"
}


variable "instance_type" {
  type        = string
  description = "Type of EC2 instance"
  default = "t2.micro"
}

variable "ami_id" {
  type        = string
  description = "AMI ID to use for the instance"
  default     = "ami-0e35ddab05955cf57"
}

variable "security_group" {
  type        = string
  description = "Security group name"
  default = ""
}

variable "allowed_ports" {
  type        = list(number)
  description = "List of allowed inbound ports"
  default = []
}

variable "enable_public_ip" {
  type        = bool
  description = "Whether to associate a public IP"
  default     = true
}

variable "vpc_id" {
  type        = string
  description = "VPC ID to launch instance in"
  default     = "vpc-0822634396310e8ea"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID to launch instance in"
  default     = "subnet-0376b05408a1be5d4"
}

variable "instanceId" {
  type        = string
  description = "instance id to destroy"
  
}
