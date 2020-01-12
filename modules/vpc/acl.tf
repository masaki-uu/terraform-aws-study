resource "aws_default_network_acl" "public" {
  default_network_acl_id = aws_vpc.this.default_network_acl_id

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = -1
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
}

resource "aws_network_acl_rule" "aws_proxy" {
  count = length(var.aws_proxy_ip_address)

  network_acl_id = aws_default_network_acl.public.id
  rule_number    = (200 + count.index * 10)
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = var.aws_proxy_ip_address[count.index]
  from_port      = 22
  to_port        = 22
}
