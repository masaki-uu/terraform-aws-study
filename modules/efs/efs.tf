resource "aws_efs_file_system" "this" {
  encrypted = true

  tags = {
    Name = "${local.name_prefix}-efs"
  }
}

resource "aws_efs_mount_target" "this" {
  count = length(var.subnet_ids)

  file_system_id = aws_efs_file_system.this.id
  subnet_id      = var.subnet_ids[count.index]
}