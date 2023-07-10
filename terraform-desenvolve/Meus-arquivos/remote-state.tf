terraform {
  cloud {
    organization = "ProjetoAlura"
    hostname = "app.terraform.io" # Optional; defaults to app.terraform.io

    workspaces {
        name = "aws-projetoalura"
    }
  }
}
