resource "null_resource" "kubeconfig" {
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name ${aws_eks_cluster.this.id} --alias ${local.name_prefix}"
  }

  depends_on = [aws_eks_node_group.this]
}
