resource "aws_security_group" "acesso_ssh" {
  name        = "acesso_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = "${var.cdirs_acesso_remoto}"
  }
  tags = {
    Name = "acesso_ssh"
  }
}

resource "aws_security_group" "acesso_ssh-us-east-2" {
    provider = aws.us-east-2
  name        = "acesso_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = "${var.cdirs_acesso_remoto}"
  }
  tags = {
    Name = "acesso_ssh"
  }
}