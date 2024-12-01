output "vpc_id" {
  value       = aws_vpc.main.id
}

output "public_sg_id" {
  value       = aws_security_group.public.id
}

output "private_sg_id" {
  value       = aws_security_group.private.id
}

output "subnet_ids" {
  value = {
    for subnet in aws_subnet.main :
    subnet.tags.Name => subnet.id
  }
}

output "subnets" {
  value       = aws_subnet.main
}
