resource "aws_eks_cluster" "this" {
  name     = local.cluster_name
  role_arn = var.eks_master_role_arn
  version  = var.eks_cluster_version

  vpc_config {
    subnet_ids = concat(var.public_subnet_ids, var.private_subnet_ids)
  }
}
