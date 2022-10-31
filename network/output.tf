output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "security_group_ids" {
  value = [
    aws_security_group.allow_ssh.id, 
    aws_security_group.allow_all_local.id,
    aws_security_group.allow_kubernetes.id
  ]
}
