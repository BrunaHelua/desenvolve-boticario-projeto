provider "aws" {
  region  = "us-east-1"
}

provider "aws" {
  alias = "us-east-2"
  region  = "us-east-2"
}

resource "aws_instance" "dev" {
    ami = "ami-053b0d53c279acc90"
    count = 3
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev${count.index}"
    }   
    vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}"]
}

resource "aws_instance" "dev4" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev4"
    }   
    vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}"]
    depends_on = [ aws_s3_bucket.dev4 ]
}

resource "aws_instance" "dev5" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev5"
    }   
    vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}"]
}

resource "aws_instance" "dev6" {
    provider = aws.us-east-2
    ami = "ami-069d73f3235b535bd"
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev6"
    }   
    vpc_security_group_ids = ["${aws_security_group.acesso_ssh-us-east-2.id}"]
}

resource "aws_s3_bucket" "dev4" {
  bucket = "brunahelua-dev4"

  tags = {
    Name        = "brunahelua-dev4"
  }
}