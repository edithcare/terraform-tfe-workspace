locals {
  organization = "organization"
  environments = ["dev", "staging"]
  slack_url    = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"
}

data "tfe_team" "admins" {
  name         = "admins"
  organization = local.organization
}

data "tfe_team" "developers" {
  name         = "developers"
  organization = local.organization
}

data "tfe_oauth_client" "client" {
  oauth_client_id = "oc-XXXXXXX"
}

module "example" {
  source = "../"

  for_each = toset(local.environments)

  workspace_name               = "example-${each.value}"
  workspace_org                = local.organization
  workspace_auto_apply         = false
  workspace_terraform_version  = "0.14.11"
  workspace_working_directory  = "example/${each.value}"
  workspace_vcs_identifier     = "ORG/REPO"
  workspace_vcs_oauth_token_id = data.tfe_oauth_client.client.oauth_token_id
  team_access = [
    {
      name   = data.tfe_team.admins.name
      id     = data.tfe_team.admins.id
      access = "admin"
    },
    {
      name   = data.tfe_team.developers.name
      id     = data.tfe_team.developers.id
      access = "read"
    }
  ]
  slack_enabled = true
  slack_url     = local.slack_url
  tf_variables = [
    {
      category    = "env"
      name        = "TF_LOG"
      value       = ""
      description = "enables detailed logs to appear on stderr which is useful for debugging"
    },
    {
      category    = "env"
      name        = "TF_IGNORE"
      value       = ""
      description = "set to `trace` to output debug messages to display ignored files and folders"
    },
    {
      category    = "env"
      name        = "TF_IN_AUTOMATION" # https://www.terraform.io/docs/cli/config/environment-variables.html#tf_in_automation
      value       = ""
      description = "adjusts its output to avoid suggesting specific commands to run next"
    },
    {
      category    = "terraform"
      name        = "foo"
      value       = "bar"
      hcl         = false
      description = "a useful description"
    },
    {
      category    = "terraform"
      name        = "aws_secret"
      value       = "AWS_SECRET"
      sensitive   = true
      hcl         = false
      description = "a useful description"
    }
  ]
}
