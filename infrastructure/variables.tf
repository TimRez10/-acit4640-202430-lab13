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
  default     = "lab13"
  type        = string
}

variable "public_sn_name" {
  description = "Public subnet name"
  type        = string
  default     = "public_sn"
}

variable "private_sn_name" {
  description = "Private subnet name"
  type        = string
  default     = "private_sn"
}

variable "public_i_name" {
  description = "Public ec2 instance name"
  type        = string
  default     = "w01"
}

variable "private_i_name" {
  description = "Private ec2 instance name"
  type        = string
  default     = "b01"
}
