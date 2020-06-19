output "kubeconfig" {
  value = module.eks.kubeconfig
}

output "aws_auth" {
  value = module.eks.aws_auth
}

output "cluster_name" {
  value = module.eks.cluster_name
}
