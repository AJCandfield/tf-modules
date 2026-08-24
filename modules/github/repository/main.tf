resource "github_repository" "this" {
  name        = var.name
  description = var.description
  visibility  = var.visibility
  topics      = sort(tolist(var.topics))

  has_issues      = var.has_issues
  has_projects    = var.has_projects
  has_wiki        = var.has_wiki
  has_discussions = var.has_discussions

  allow_squash_merge     = var.allow_squash_merge
  allow_merge_commit     = var.allow_merge_commit
  allow_rebase_merge     = var.allow_rebase_merge
  allow_auto_merge       = var.allow_auto_merge
  delete_branch_on_merge = var.delete_branch_on_merge
  auto_init              = false

  security_and_analysis {
    secret_scanning {
      status = var.secret_scanning ? "enabled" : "disabled"
    }
    secret_scanning_push_protection {
      status = var.secret_scanning_push_protection ? "enabled" : "disabled"
    }
  }
}

resource "github_branch_protection" "main" {
  repository_id  = github_repository.this.node_id
  pattern        = "main"
  enforce_admins = true

  required_pull_request_reviews {
    required_approving_review_count = 0
    dismiss_stale_reviews           = true
  }

  dynamic "required_status_checks" {
    for_each = length(var.required_status_checks) == 0 ? [] : [var.required_status_checks]

    content {
      strict   = false
      contexts = required_status_checks.value
    }
  }
}

resource "github_actions_secret" "this" {
  for_each = nonsensitive(toset(keys(var.actions_secrets)))

  repository      = github_repository.this.name
  secret_name     = each.value
  plaintext_value = var.actions_secrets[each.value]
}
