variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "num_subnets" {
  description = "The number subnets."
  default     = "3"
}

variable "name_prefix" {
  description = "Name tag prefix."
}

locals {
  name_prefix = var.name_prefix
}
