# VPC
module "vpc" {
  source = "../../modules/vpc"

  name_prefix = var.name_prefix
}

# Route53
module "route53" {
  source = "../../modules/route53"

  root_domain_name = var.root_domain_name
}

# IAM for EKS
module "iam_eks" {
  source = "../../modules/eks/iam"
}

# EKS
module "eks" {
  source = "../../modules/eks"

  name_prefix              = var.name_prefix
  profile                  = var.profile
  vpc_id                   = module.vpc.vpc_id
  public_subnet_ids        = module.vpc.public_subnet_ids
  private_subnet_ids       = module.vpc.private_subnet_ids
  eks_master_role_arn      = module.iam_eks.eks_master_role_arn
  eks_node_role_arn        = module.iam_eks.eks_node_role_arn
  eks_node_role_profile_id = module.iam_eks.eks_node_role_profile_id
  node_groups              = var.node_groups
}

# EFS
module "efs" {
  source = "../../modules/efs"

  name_prefix = var.name_prefix
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.private_subnet_ids
}

# Ambassador
module "ambassador" {
  source = "../../modules/ambassador"

  depends_on = [module.eks]

  hosted_zone_id   = module.route53.hosted_zone_id
  root_domain_name = var.root_domain_name
  acm_arn          = module.route53.acm_arn
}

# Nginx
module "nginx" {
  source = "../../modules/nginx"

  depends_on = [module.eks]
}
