terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "rmerceslabs"

    workspaces {
      name = "aws-rmerceslabs"
    }
  }
}