output "instances" {
  value = {
    for k, instance in aws_instance.main :
    k => instance
  }
}

