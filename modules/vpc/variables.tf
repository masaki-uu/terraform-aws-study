variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "num_subnets" {
  description = "The number subnets."
  default     = "2"
}
