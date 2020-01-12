resource "aws_subnet" "main" {
  count = var.num_subnets

  vpc_id     = aws_vpc.this.id
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index)
}
