resource "aws_iam_instance_profile" "eks_node_role_profile" {
  name = "eks-node-role-profile"
  role = aws_iam_role.eks_node_role.name
}
