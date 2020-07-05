resource "aws_key_pair" "webserver-prod-key" {
  key_name   = var.PATH_TO_PRIVATE_KEY
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "webserver-prod" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.webserver-prod-key.key_name
  subnet_id = aws_subnet.webapp-prod-public-1.id
  security_groups = [aws_security_group.terraform-sg.id]
}
