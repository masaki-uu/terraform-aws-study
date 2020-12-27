resource "null_resource" "kubeconfig" {
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name ${aws_eks_cluster.this.id} --alias ${local.name_prefix} --profile ${var.profile}"
  }

  depends_on = [aws_eks_node_group.this]
}
