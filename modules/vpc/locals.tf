locals {
  name_prefix = var.name_prefix

  base_nacl_ingress_rules = [
    {
      protocol   = -1
      action     = "allow"
      cidr_block = var.vpc_cidr_block
      from_port  = 0
      to_port    = 0
    },
    {
      protocol   = "tcp"
      action     = "allow"
      cidr_block = "0.0.0.0/0"
      from_port  = 1024
      to_port    = 65535
    },
  ]

  public_nacl_ingress_rules  = concat(var.public_nacl_add_ingress_rules, local.base_nacl_ingress_rules)
  private_nacl_ingress_rules = local.base_nacl_ingress_rules
}
