output "kubeconfig" {
  value = local.kubeconfig
}

output "aws_auth" {
  value = local.aws_auth
}

output "cluster_name" {
  value = aws_eks_cluster.this.id
}