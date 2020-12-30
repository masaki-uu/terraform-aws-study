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
}
