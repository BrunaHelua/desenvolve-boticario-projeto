variable "amis" {
  type = "map"

  default = {
    us-east-1 = "ami-053b0d53c279acc90"
    us-east-2 = "ami-069d73f3235b535bd"
  }
}

variable "cdirs_acesso_remoto" {
  type = "list"

  default = ["177.9.226.219/32"]
}