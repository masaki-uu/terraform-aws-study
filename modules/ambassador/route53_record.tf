data "kubernetes_service" "ambassador" {
  metadata {
    name      = "ambassador"
    namespace = "app-system"
  }

  depends_on = [helm_release.ambassador]
}

data "aws_elb" "ambassador" {
  name = split("-", data.kubernetes_service.ambassador.load_balancer_ingress.0.hostname)[0]
}

resource "aws_route53_record" "ambassador" {
  zone_id = var.hosted_zone_id
  name    = ""
  type    = "A"

  alias {
    name                   = data.aws_elb.ambassador.dns_name
    zone_id                = data.aws_elb.ambassador.zone_id
    evaluate_target_health = true
  }
}
