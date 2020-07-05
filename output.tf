output "instance" {
  value = aws_instance.webserver-prod.public_ip
}

output "vpc-id" {
  value = aws_vpc.webapp-prod.id
}
