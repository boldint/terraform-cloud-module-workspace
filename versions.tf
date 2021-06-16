terraform {
  required_version = ">= 0.14"

  required_providers {
    tfe = {
      version = "~> 0.25.0"
    }
  }
}

provider "tfe" {
  token = var.terraform_cloud_org_token
}
