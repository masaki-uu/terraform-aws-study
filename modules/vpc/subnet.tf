data "aws_availability_zones" "this" {
  state = "available"
}

resource "aws_subnet" "public" {
  count = var.num_subnets

  vpc_id            = aws_vpc.this.id
  availability_zone = data.aws_availability_zones.this.names[count.index]
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 8, count.index)

  tags = {
    Name = "${local.name_prefix}-subnet-public-${count.index}"
    "kubernetes.io/role/elb" = 1
  }
}

resource "aws_subnet" "private" {
  count = var.num_subnets

  vpc_id            = aws_vpc.this.id
  availability_zone = data.aws_availability_zones.this.names[count.index]
  cidr_block        = cidrsubnet(var.vpc_cidr_block, 8, var.num_subnets + count.index)

  tags = {
    Name = "${local.name_prefix}-subnet-private-${count.index}"
    "kubernetes.io/role/internal-elb" = 1
  }
}
