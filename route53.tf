resource "aws_route53_record" "control_plane" {
  zone_id = var.hosted_zone_id
  name    = "${var.control_plane_host_name}.${var.domain_name}"
  type    = "A"
  ttl     = "300"
  records = [var.control_plane_ip]
}

resource "aws_route53_record" "worker1" {
  zone_id = var.hosted_zone_id
  name    = "${var.worker1_host_name}.${var.domain_name}"
  type    = "A"
  ttl     = "300"
  records = [var.worker1_ip]
}

resource "aws_route53_record" "worker2" {
  zone_id = var.hosted_zone_id
  name    = "${var.worker2_host_name}.${var.domain_name}"
  type    = "A"
  ttl     = "300"
  records = [var.worker2_ip]
}