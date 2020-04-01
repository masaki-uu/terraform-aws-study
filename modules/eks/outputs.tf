output "eks_configmap" {
  value = local.eks_configmap
}

output "cluster_name" {
  value = aws_eks_cluster.this.id
}