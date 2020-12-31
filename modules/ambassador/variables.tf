variable "hosted_zone_id" {
  description = "The route53 hosted zone id."
  type        = string
}

variable "root_domain_name" {
  description = "This is the name of root domain."
}

variable "acm_arn" {
  description = "The ARN of the certificate."
}
