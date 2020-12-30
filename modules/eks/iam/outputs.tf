output "eks_master_role_arn" {
  value = aws_iam_role.eks_master_role.arn
}

output "eks_node_role_arn" {
  value = aws_iam_role.eks_node_role.arn
}

output "eks_node_role_profile_id" {
  value = aws_iam_instance_profile.eks_node_role_profile.id
}
