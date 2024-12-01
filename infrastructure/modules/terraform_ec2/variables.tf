variable "instances" {
  description = "Map of instances"
  type = map(object({
    name       = string
    subnet_id  = string
    security_group_ids = list(string)
    role       = string
  }))
}

variable "ami" {
  type        = string
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "domain_name" {
  description = "Domain name for DHCP and Route53"
  type        = string
  default     = "cit.local"
}

variable "zone_id" {
  description = "ID of the private hosted zone"
  type        = string
}