terraform {
  required_version = "~> 0.14.11"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "0.25.0"
    }
  }

  experiments = [module_variable_optional_attrs]
}

# don't set this, for using for_each with module
# provider "tfe" {
#   # Configuration options
# }

resource "tfe_workspace" "workspace" {
  name                  = var.workspace_name
  organization          = var.workspace_org
  auto_apply            = var.workspace_auto_apply
  file_triggers_enabled = var.workspace_file_triggers_enabled
  queue_all_runs        = var.workspace_queue_all_runs
  terraform_version     = var.workspace_terraform_version
  working_directory     = var.workspace_working_directory
  trigger_prefixes      = var.workspace_trigger_prefixes
  allow_destroy_plan    = var.workspace_allow_destroy_plan

  vcs_repo {
    branch             = var.workspace_vcs_branch
    identifier         = var.workspace_vcs_identifier
    ingress_submodules = var.workspace_vcs_ingress_submodules
    oauth_token_id     = var.workspace_vcs_oauth_token_id
  }
}

resource "tfe_team_access" "acces" {
  for_each = {
    for team in var.team_access : team.name => {
      id     = team.id
      access = team.access
    }
  }

  access       = each.value.access
  team_id      = each.value.id
  workspace_id = tfe_workspace.workspace.id
}

resource "tfe_notification_configuration" "slack" {
  destination_type = "slack"
  name             = "tfe workspace notification: ${var.workspace_name}"
  enabled          = var.slack_enabled
  url              = var.slack_url
  triggers         = var.slack_triggers
  workspace_id     = tfe_workspace.workspace.id
}

resource "tfe_variable" "variable" {
  for_each = {
    for variable in var.tf_variables : variable.name => {
      category    = variable.category
      value       = variable.value
      hcl         = variable.hcl
      sensitive   = variable.sensitive
      description = variable.description
    }
  }

  category     = each.value.category
  key          = each.key
  value        = each.value.value
  hcl          = each.value.hcl
  sensitive    = each.value.sensitive
  description  = each.value.description
  workspace_id = tfe_workspace.workspace.id
}
