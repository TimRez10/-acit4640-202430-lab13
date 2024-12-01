variable "domain_name" {
  description = "Domain name for DHCP and Route53"
  type        = string
  default     = "cit.local"
}

variable "vpc_id" {
  type        = string
}

variable "dns_servers" {
  description = "List of DNS servers"
  type        = list(string)
  default     = ["AmazonProvidedDNS"]
}

variable "record_ttl" {
  description = "TTL for DNS records"
  type        = number
  default     = 300
}