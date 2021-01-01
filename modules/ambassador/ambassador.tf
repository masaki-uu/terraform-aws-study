resource "helm_release" "ambassador" {
  name             = "ambassador"
  namespace        = "app-system"
  create_namespace = true

  repository = "https://getambassador.io"
  chart      = "ambassador"

  set {
    name  = "service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
    value = "clb"
  }

  set {
    name  = "service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-cross-zone-load-balancing-enabled"
    value = "true"
  }

  set {
    name = "service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-backend-protocol"
    value = "http"
  }

  set {
    name = "service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-ssl-cert"
    value = var.acm_arn
  }

  set {
    name = "service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-ssl-ports"
    value = "30443"
  }

  set {
    name = "service.ports[0].name"
    value = "http"
  }
    
  set {
    name = "service.ports[0].port"
    value = "80"
  }
    
  set {
    name = "service.ports[0].targetPort"
    value = "8080"
  }
    
  set {
    name = "service.ports[0].nodePort"
    value = "30080"
  }

  set {
    name = "service.ports[1].name"
    value = "https"
  }
    
  set {
    name = "service.ports[1].port"
    value = "443"
  }
    
  set {
    name = "service.ports[1].targetPort"
    value = "8443"
  }
    
  set {
    name = "service.ports[1].nodePort"
    value = "30443"
  }

  provisioner "local-exec" {
    command = "sleep 30"
  }
}
