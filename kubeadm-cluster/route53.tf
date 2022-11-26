data "aws_route53_zone" "main" {
  name         = var.domain_name
  private_zone = false
}


resource "aws_route53_record" "instances" {
  for_each = var.instances

  zone_id = data.aws_route53_zone.main.id
  name    = "${each.value.name}.${var.domain_name}"
  type    = "A"
  ttl     = "300"
  records = [each.value.private_ip]
}