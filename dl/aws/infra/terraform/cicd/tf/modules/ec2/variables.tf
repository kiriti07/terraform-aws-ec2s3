variable "vpc_cidr_block" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "security_group_name" {
  type        = string
  description = "Name of the security group"
  default     = "example-sg"
}

variable "security_group_description" {
  type        = string
  description = "Description of the security group"
  default     = "Example Security Group"
}

variable "instance_ami" {
  type        = string
  description = "AMI ID for the instance"
}

variable "instance_type" {
  type        = string
  description = "Instance type"
  default     = "t2.micro"
}

variable "instance_key_name" {
  type        = string
  description = "Key pair name for the instance"
}

variable "user_data_script" {
  type        = string
  description = "User data script for the instance"
  default     = <<-EOF
    #!/bin/bash
    echo "Instance created!"
  EOF
}
