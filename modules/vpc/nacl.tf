resource "aws_default_network_acl" "default" {
  default_network_acl_id = aws_vpc.this.default_network_acl_id

  tags = {
    Name = "${local.name_prefix}-nacl-default"
  }
}

resource "aws_network_acl" "private" {
  vpc_id     = aws_vpc.this.id
  subnet_ids = aws_subnet.private[*].id

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${local.name_prefix}-nacl-private"
  }
}

resource "aws_network_acl_rule" "private" {
  count = length(local.private_nacl_ingress_rules)

  network_acl_id = aws_network_acl.private.id
  rule_number    = (count.index + 1) * 10
  egress         = false
  protocol       = local.private_nacl_ingress_rules[count.index]["protocol"]
  rule_action    = local.private_nacl_ingress_rules[count.index]["action"]
  cidr_block     = local.private_nacl_ingress_rules[count.index]["cidr_block"]
  from_port      = local.private_nacl_ingress_rules[count.index]["from_port"]
  to_port        = local.private_nacl_ingress_rules[count.index]["to_port"]
}

resource "aws_network_acl" "public" {
  vpc_id     = aws_vpc.this.id
  subnet_ids = aws_subnet.public[*].id

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${local.name_prefix}-nacl-public"
  }
}

resource "aws_network_acl_rule" "public" {
  count = length(local.public_nacl_ingress_rules)

  network_acl_id = aws_network_acl.public.id
  rule_number    = (count.index + 1) * 10
  egress         = false
  protocol       = local.public_nacl_ingress_rules[count.index]["protocol"]
  rule_action    = local.public_nacl_ingress_rules[count.index]["action"]
  cidr_block     = local.public_nacl_ingress_rules[count.index]["cidr_block"]
  from_port      = local.public_nacl_ingress_rules[count.index]["from_port"]
  to_port        = local.public_nacl_ingress_rules[count.index]["to_port"]
}
