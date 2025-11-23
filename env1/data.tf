data "terraform_remote_state" "env0" {
  backend = "local"

  config = {
    path = "./../env0/terraform.tfstate"
  }
}
