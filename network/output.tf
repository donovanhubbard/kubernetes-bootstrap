output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "ssh_security_group_id" {
  value = aws_security_group.allow_ssh.id
}