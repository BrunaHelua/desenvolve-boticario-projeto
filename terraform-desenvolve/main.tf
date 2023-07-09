provider "aws" {
  region  = "us-east-1"
}
resource "aws_instance" "dev" {
    ami = "ami-053b0d53c279acc90"
    count = 3
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev${count.index}"
    }   
}
resource "aws_security_group" "acesso_ssh" {
  name        = "acesso_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["177.9.226.219/32"]
  }
  tags = {
    Name = "acesso_ssh"
  }
}