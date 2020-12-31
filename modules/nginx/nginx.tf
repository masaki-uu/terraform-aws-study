resource "helm_release" "nginx" {
  name             = "nginx"
  namespace        = "nginx"
  create_namespace = true

  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"

  set {
    name  = "service.type"
    value = "ClusterIP"
  }

  set {
    name  = "service.annotations.getambassador\\.io/config"
    value = <<ANNOTATIONS
---
apiVersion: ambassador/v2
kind: Mapping
name: nginx
prefix: /
service: nginx.nginx:80
labels:
  ambassador:
    - request_label:
      - nginx
ANNOTATIONS
  }
}
