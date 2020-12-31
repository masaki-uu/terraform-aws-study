resource "aws_eks_node_group" "this" {
  count = length(var.node_groups)

  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${local.name_prefix}-node-group-${count.index}"
  node_role_arn   = var.eks_node_role_arn
  subnet_ids      = var.private_subnet_ids

  ami_type       = lookup(var.node_groups[count.index], "gpu") ? "AL2_x86_64_GPU" : "AL2_x86_64"
  disk_size      = lookup(var.node_groups[count.index], "disk_size")
  instance_types = [lookup(var.node_groups[count.index], "instance_types")]

  scaling_config {
    desired_size = lookup(var.node_groups[count.index], "desired_size")
    max_size     = lookup(var.node_groups[count.index], "max_size")
    min_size     = lookup(var.node_groups[count.index], "min_size")
  }
}
