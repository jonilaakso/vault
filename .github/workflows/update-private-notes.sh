#!/usr/bin/env bash
set -e  # Exit immediately if a command fails
set -x  # Print commands for debugging


# Push changes in submodule
cd content/Private-Notes
branch=$(git rev-parse --abbrev-ref HEAD)

# Ensure we are on the right branch (default main)
if [ "$branch" = "HEAD" ]; then
  branch="main"
  git checkout "$branch"
fi

git add -A
if ! git diff --cached --quiet; then
  git config user.name "github-actions[bot]"
  git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
  git commit -m "Automated update from Quartz sync"
  git push origin "$branch"
fi

