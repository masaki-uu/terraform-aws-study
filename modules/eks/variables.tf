variable "profile" {
  description = "This is the AWS profile name as set in the shared credentials file."
}

variable "vpc_id" {
  description = "The VPC id"
}

variable "public_subnet_ids" {
  description = "The public subnet ids."
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "The private subnet ids."
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
  default     = "1.17"
}

variable "node_groups" {
  description = "The definition of node groups."
  type        = list(map(string))

  default = [
    {
    },
  ]
}

variable "name_prefix" {
  description = "Name tag prefix."
}
