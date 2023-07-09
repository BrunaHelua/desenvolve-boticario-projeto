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
    ami = var.amis["us-east-1"]
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev5"
    }   
    vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}"]
}

resource "aws_instance" "dev6" {
    provider = aws.us-east-2
    ami = var.amis["us-east-2"]
    instance_type = "t2.micro"
    key_name = "terraform-aws"
    tags = {
        Name = "dev6"
    }   
    vpc_security_group_ids = ["${aws_security_group.acesso_ssh-us-east-2.id}"]
    depends_on = ["aws_dynamodb_table.dynamodb-homologacao"]
}

resource "aws_s3_bucket" "dev4" {
  bucket = "brunahelua-dev4"

  tags = {
    Name        = "brunahelua-dev4"
  }
}

resource "aws_dynamodb_table" "dynamodb-homologacao" {
  provider       = aws.us-east-2
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }

  attribute {
    name = "TopScore"
    type = "N"
  }
}