resource "aws_vpc_dhcp_options" "main" {
  domain_name         = var.domain_name
  domain_name_servers = var.dns_servers
}

resource "aws_vpc_dhcp_options_association" "main" {
  vpc_id          = var.vpc_id
  dhcp_options_id = aws_vpc_dhcp_options.main.id
}

resource "aws_route53_zone" "main" {
  name = var.domain_name
  vpc {
    vpc_id = var.vpc_id
  }
}

