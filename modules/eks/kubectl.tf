resource "local_file" "kubeconfig" {
  content  = local.kubeconfig
  filename = "./kubeconfig"

  depends_on = [aws_eks_cluster.this]
}
