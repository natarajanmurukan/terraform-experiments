variable "AWS_ACCESS_KEY" {
  default=""
  description = "AWS Access Key"
}

variable "AWS_SECRET_KEY" {
  default=""
  description = "AWS Secret Key"
}
variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
    eu-west-1 = "ami-844e0bf7"
  }
  description = "AWS AMI Image IDs"
}
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
  description = "Default Username for ec2 instance"
}

variable "AWS_REGION" {
  default = "eu-west-1"
  description = "AWS Region"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "tfexperiments"
  description = "Path to private ssh key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "tfexperiments.pub"
  description = "Path to public ssh key"
}
