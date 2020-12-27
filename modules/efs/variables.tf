variable "vpc_id" {
  description = "The VPC id"
}

variable "subnet_ids" {
  description = "The subnet ids of nodes."
  type        = list(string)
}

variable "name_prefix" {
  description = "Name tag prefix."
}
