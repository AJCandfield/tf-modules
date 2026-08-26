#!/usr/bin/env bash
# Print the modules changed against a base ref, one directory per line.
#
# Usage: scripts/changed-modules.sh [base-ref]
#
# base-ref defaults to origin/main. If the base ref does not exist (e.g. the
# very first CI run), every module is printed.
#
# Module roots follow the modules/<provider>/<module> convention. Changes to
# shared configuration (CI, tflint config, tool versions, this script)
# trigger a full run across all modules.
set -euo pipefail

BASE="${1:-origin/main}"
cd "$(git rev-parse --show-toplevel)"

ALL_MODULES="$(find modules -mindepth 2 -maxdepth 2 -type d | sort)"

if ! git rev-parse --verify --quiet "$BASE" >/dev/null; then
  echo "$ALL_MODULES"
  exit 0
fi

SHARED="$(git diff --name-only "$BASE"...HEAD -- .tflint.hcl .terraform-version .mise.toml terraform-docs.yml docker/ci/ scripts/ .github/)"
if [ -n "$SHARED" ]; then
  echo "$ALL_MODULES"
  exit 0
fi

git diff --name-only "$BASE"...HEAD -- 'modules/*' \
  | awk -F/ '/^modules\// {print $1 "/" $2 "/" $3}' \
  | sort -u \
  | while read -r module; do
      # Deleted modules have nothing left to check.
      if [ -d "$module" ]; then
        echo "$module"
      fi
    done
exit 0
