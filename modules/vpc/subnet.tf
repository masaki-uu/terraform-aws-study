data "aws_availability_zones" "this" {
  state = "available"
}

resource "aws_subnet" "public" {
  count = var.num_subnets

  vpc_id            = aws_vpc.this.id
  availability_zone = data.aws_availability_zones.this.names[count.index]
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 8, count.index)

  tags = {
    Name = "${local.base_name}-subnet-public-${count.index}"
  }
}

resource "aws_subnet" "private" {
  count = var.num_subnets

  vpc_id            = aws_vpc.this.id
  availability_zone = data.aws_availability_zones.this.names[count.index]
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 8, var.num_subnets + count.index)

  tags = {
    Name = "${local.base_name}-subnet-private-${count.index}"
  }
}
