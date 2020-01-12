# VPC
module "vpc" {
  source = "../../modules/vpc"

  aws_proxy_ip_address = var.aws_proxy_ip_address
}
