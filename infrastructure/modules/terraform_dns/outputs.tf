output "zone_id" {
  description = "ID of the private hosted zone"
  value       = aws_route53_zone.main.id
}