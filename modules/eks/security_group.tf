resource "aws_security_group" "cluster_master" {
  name        = "${local.name_prefix}-cluster-master"
  description = "EKS cluster master security group"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${local.name_prefix}-sg-cluster-master"
  }
}

resource "aws_security_group_rule" "cluster-master-0" {
  security_group_id        = aws_security_group.cluster_master.id
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.cluster_nodes.id
}

resource "aws_security_group_rule" "cluster-master-1" {
  security_group_id        = aws_security_group.cluster_master.id
  type                     = "egress"
  from_port                = 1025
  to_port                  = 65535
  protocol                 = "-1"
  source_security_group_id = aws_security_group.cluster_nodes.id
}

resource "aws_security_group" "cluster_nodes" {
  name        = "${local.name_prefix}-cluster-nodes"
  description = "Worker nodes security group"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${local.name_prefix}-sg-cluster-nodes"
  }
}

resource "aws_security_group_rule" "cluster-nodes-0" {
  description              = "Allow cluster master to access cluster nodes with SSH"
  security_group_id        = aws_security_group.cluster_nodes.id
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.cluster_master.id
}

resource "aws_security_group_rule" "cluster-nodes-1" {
  description              = "Allow cluster master to access cluster nodes with ephemeral ports"
  security_group_id        = aws_security_group.cluster_nodes.id
  type                     = "ingress"
  from_port                = 1025
  to_port                  = 65535
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.cluster_master.id
}

resource "aws_security_group_rule" "cluster-nodes-2" {
  description       = "Allow inter pods communication"
  security_group_id = aws_security_group.cluster_nodes.id
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  self              = true
}

resource "aws_security_group_rule" "cluster-nodes-3" {
  security_group_id = aws_security_group.cluster_nodes.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}
