resource "aws_eip" "this" {
  count = var.num_subnets

  vpc = true

  tags = {
    Name = "${local.base_name}-eip-${count.index}"
  }
}

resource "aws_nat_gateway" "this" {
  count = var.num_subnets

  allocation_id = aws_eip.this[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = {
    Name = "${local.base_name}-ngw-${count.index}"
  }
}
