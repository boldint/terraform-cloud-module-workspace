terraform {
  required_version = "~> 0.14"
  required_providers {
    sops = {
      source  = "carlpett/sops"
      version = "~> 0.6"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "sops" {}

data "sops_file" "tfe_secrets" {
  source_file = "secrets.yaml"
}

provider "tfe" {
  token = data.sops_file.tfe_secrets.data["token"]
}

resource "random_id" "random" {
  byte_length = 8
}

resource "tfe_organization" "org" {
  name  = "test-${random_id.random.hex}-org"
  email = "test-${random_id.random.hex}-org@test.com"
}

resource "tfe_organization_token" "org_token" {
  organization = tfe_organization.org.id
}

module "workspace" {
  source = "../"

  organization_name            = tfe_organization.org.id
  workspace_name               = "test-${random_id.random.hex}-workspace"
  terraform_cloud_org_token    = data.sops_file.tfe_secrets.data["token"]
  workspace_terraform_version  = "0.15.0"
  workspace_description        = "Module test workspace"
  workspace_execution_mode     = "remote"
  workspace_allow_destroy_plan = true
  workspace_auto_apply         = false
  workspace_variables = {
    var1 = {
      value       = "value1"
      category    = "env"
      description = "a useful description"
      sensitive   = false
      hcl         = false
    }
    var2 = {
      value       = "value2"
      category    = "terraform"
      description = "another useful description"
      sensitive   = false
      hcl         = false
    }
    secret_var1 = {
      value       = "value1"
      category    = "env"
      description = "a secretfully useful description"
      sensitive   = true
      hcl         = false
    }
    secret_var2 = {
      value       = "value2"
      category    = "terraform"
      description = "another secretfully useful description"
      sensitive   = true
      hcl         = false
    }
  }
}
