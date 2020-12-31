output "hosted_zone_id" {
  value = data.aws_route53_zone.root.zone_id
}

output "acm_arn" {
  value = aws_acm_certificate.root.arn
}