variable "vpc_id" {
  description = "The VPC id"
}

variable "subnet_ids" {
  description = "The subnet ids of nodes."
  type        = list(string)
}

variable "eks_master_role_arn" {
  description = "The ARN of EKS master role."
}

variable "eks_node_role_arn" {
  description = "The ARN of EKS node role."
}

variable "eks_node_role_profile_id" {
  description = "The instance profile id of EKS node role."
}

variable "eks_cluster_version" {
  description = "The version of EKS Cluster."
  default     = "1.14"
}

variable "name_prefix" {
  description = "Name tag prefix."
}

locals {
  name_prefix  = var.name_prefix
  cluster_name = "${var.name_prefix}-cluster"
}