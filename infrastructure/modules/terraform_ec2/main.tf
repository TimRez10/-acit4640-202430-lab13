resource "aws_instance" "main" {
  for_each = var.instances
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = each.value.subnet_id
  key_name        = var.key_name
  security_groups = each.value.security_group_ids

  tags = {
    Name = each.value.name
    Project = var.project_name
    Role = each.value.role

  }
}

resource "aws_route53_record" "main" {
  for_each = var.instances

  zone_id = var.zone_id
  name    = "${each.value.name}.${var.domain_name}"
  type    = "A"
  ttl     = "300"
  records = [aws_instance.main[each.value.name].private_ip]
}