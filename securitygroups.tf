resource "aws_security_group" "terraform-sg" {
  name        = "terraform-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.webapp-prod.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0",aws_vpc.webapp-prod.cidr_block]
  }
  ingress {
    description = "Rule 1"
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["11.22.33.44/32", "22.33.44.55/32", "33.44.55.66/32"]
  }

  ingress {
    description = "Rule 2"
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["44.55.66.77/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-sg-name"
  }
}
