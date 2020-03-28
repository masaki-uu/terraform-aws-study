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
