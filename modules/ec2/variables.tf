variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "key_name" {
  description = "Key pair name to connect to the instance"
  type        = string
}

variable "subnet_id" {
  description = "VPC subnet ID where the instance will be launched"
  type        = string
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "security_group" {
  description = "Security group ID"
  type        = string
}