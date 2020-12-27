resource "aws_security_group" "efs" {
  name        = "${local.name_prefix}-efs-sg"
  description = "EFS Security group"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${local.name_prefix}-efs-sg"
  }
}

resource "aws_security_group" "efs_to_mount" {
  name        = "${local.name_prefix}-efs-to-mount-sg"
  description = "Allow EFS to mounted"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${local.name_prefix}-efs-to-mount-sg"
  }
}

resource "aws_security_group_rule" "efs-ingress" {
  type                     = "ingress"
  from_port                = 2049
  to_port                  = 2049
  protocol                 = "tcp"
  security_group_id        = aws_security_group.efs.id
  source_security_group_id = aws_security_group.efs_to_mount.id
}
