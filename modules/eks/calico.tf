resource "null_resource" "calico" {
  provisioner "local-exec" {
    command = "kubectl apply -f https://raw.githubusercontent.com/aws/amazon-vpc-cni-k8s/release-1.6/config/v1.6/calico.yaml --kubeconfig ./kubeconfig"
  }

  triggers = {
    kubeconfig_rendered = local.kubeconfig
  }

  depends_on = [aws_eks_node_group.this]
}
