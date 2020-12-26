resource "local_file" "aws_auth" {
  content  = local.aws_auth
  filename = "./_aws_auth.yaml"

  depends_on = [null_resource.kubeconfig]
}

resource "null_resource" "aws_auth" {
  provisioner "local-exec" {
    command = "kubectl apply -f ./_aws_auth.yaml"
  }

  depends_on = [local_file.aws_auth]
}
