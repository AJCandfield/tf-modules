# tf-modules

Reusable Terraform modules, organized by cloud provider (`modules/<provider>/<module>`).
Consumed by live Terragrunt repositories via git sources:

```hcl
terraform {
  source = "git::https://github.com/AJCandfield/tf-modules.git//modules/github/repository?ref=main"
}
```

Pin `ref` to a tag or commit for reproducible deployments; `main` is for development only.

## Layout

- `modules/<provider>/<module>` — module definitions, one folder per cloud provider
  (e.g. `aws/`, `gcp/`, `github/`, `gitlab/`).
- `scripts/changed-modules.sh` — prints modules changed against a base ref; used by CI.
- `.github/workflows/ci.yml` — runs formatting, `terraform validate`, and tflint on
  changed modules only.

## Local workflow

```sh
mise install                 # terraform, tflint, terraform-docs, pre-commit
pre-commit install           # local hooks: fmt, tflint, docs
scripts/changed-modules.sh   # what CI will check against origin/main
```
