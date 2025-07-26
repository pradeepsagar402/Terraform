output "secuiritygroup_ids" {
  value = [for secuiritygroup in aws_security_group.server : secuiritygroup.id]
}
output "public_ip_address" {
    value = aws_instance.demoone[*].public_ip
}