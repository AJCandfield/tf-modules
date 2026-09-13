mock_provider "github" {}

run "defaults" {
  command = plan

  variables {
    name = "example"
  }

  assert {
    condition     = github_repository.this.auto_init
    error_message = "Repository auto-initialization must be enabled by default."
  }

  assert {
    condition     = !github_repository.this.has_issues
    error_message = "GitHub Issues must be disabled by default."
  }

  assert {
    condition     = github_branch_default.main.branch == "main"
    error_message = "The default branch must be main."
  }

  assert {
    condition     = github_branch_default.main.repository == github_repository.this.name
    error_message = "The default branch must target the managed repository."
  }

  assert {
    condition     = github_branch_protection.main.pattern == github_branch_default.main.branch
    error_message = "Branch protection must target the managed default branch."
  }
}

run "issues_override" {
  command = plan

  variables {
    name       = "example"
    has_issues = true
  }

  assert {
    condition     = github_repository.this.has_issues
    error_message = "GitHub Issues must support an explicit enabled override."
  }
}
