variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "subnets" {
  type = list(object({
    cidr_block = string
    availability_zone = string
    subnet_name   = string
  }))
}

variable "availability_zone" {
  description = "The availability zone to use for the subnets"
  type        = string
  default     = "us-west-2a"
}

variable "allowed_ip" {
  description = "The IP range allowed to SSH into the instance"
  type        = string
  default     = "0.0.0.0/0"
}
