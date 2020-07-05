# nat gw
resource "aws_eip" "webapp-prod-nat" {
  vpc = true
}

resource "aws_nat_gateway" "webapp-prod-nat-gw" {
  allocation_id = aws_eip.webapp-prod-nat.id
  subnet_id     = aws_subnet.webapp-prod-public-1.id
  depends_on    = [aws_internet_gateway.main-gw]
}

# VPC setup for NAT
resource "aws_route_table" "webapp-prod-private" {
  vpc_id = aws_vpc.webapp-prod.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.webapp-prod-nat-gw.id
  }

  tags = {
    Name = "webapp-prod-private-1"
  }
}

# route associations private
resource "aws_route_table_association" "main-private-1-a" {
  subnet_id      = aws_subnet.webapp-prod-private-1.id
  route_table_id = aws_route_table.webapp-prod-private.id
}
