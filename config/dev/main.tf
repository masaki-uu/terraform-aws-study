# VPC
module "vpc" {
  source = "../../modules/vpc"

  name_prefix = var.name_prefix
}

# IAM for EKS
module "iam_eks" {
  source = "../../modules/iam/eks"
}

# EKS
module "eks" {
  source = "../../modules/eks"

  name_prefix              = var.name_prefix
  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnet_ids
  eks_master_role_arn      = module.iam_eks.eks_master_role_arn
  eks_node_role_arn        = module.iam_eks.eks_node_role_arn
  eks_node_role_profile_id = module.iam_eks.eks_node_role_profile_id
  node_groups              = var.node_groups
}
