resource "aws_subnet" "main" {
  count = var.num_subnets

  vpc_id     = aws_vpc.this.id
  cidr_block = cidrsubnet(var.vpc_cidr_block, 8, count.index)
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }
}

