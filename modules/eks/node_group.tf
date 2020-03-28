resource "aws_eks_node_group" "this" {
  count = length(var.node_groups)

  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${local.name_prefix}-node-group-${count.index}"
  node_role_arn   = var.eks_node_role_arn
  subnet_ids      = var.subnet_ids

  ami_type       = lookup(var.node_groups[count.index], "gpu", local.node_group_default.gpu) ? "AL2_x86_64_GPU" : "AL2_x86_64"
  disk_size      = lookup(var.node_groups[count.index], "disk_size", local.node_group_default.disk_size)
  instance_types = [lookup(var.node_groups[count.index], "instance_types", local.node_group_default.instance_types)]

  scaling_config {
    desired_size = lookup(var.node_groups[count.index], "desired_size", local.node_group_default.desired_size)
    max_size     = lookup(var.node_groups[count.index], "max_size", local.node_group_default.max_size)
    min_size     = lookup(var.node_groups[count.index], "min_size", local.node_group_default.min_size)
  }
}
