variable "region" {
  description = "This is the AWS region."
  default     = "ap-northeast-1"
}

variable "profile" {
  description = "This is the AWS profile name as set in the shared credentials file."
  default     = "eks-admin"
}

variable "name_prefix" {
  description = "This is prefix for name tag."
  default     = "dev"
}

variable "node_groups" {
  description = "The definition of node groups."
  type        = list(map(string))

  default = [
    {
      gpu            = false
      disk_size      = 20
      desired_size   = 1
      max_size       = 1
      min_size       = 1
      instance_types = "t3.medium"
    },
  ]
}
