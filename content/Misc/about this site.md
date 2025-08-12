---
title: About this site
description: How?
draft: false
tags: vault
---

# How is this site built?

This site is built with [Quartz 4](https://quartz.jzhao.xyz/)

I  use [Obsidian](https://obsidian.md/) for writing the notes and host the vault with [Github pages](https://docs.github.com/en/pages)

For my notes that I don't want to upload publicly, I have created private github repository that I have added as [git submodule.](https://git-scm.com/book/en/v2/Git-Tools-Submodules) For deploy, I have a bash-script to update both locally and push to Github. 

update-vault.sh
```bash
#!/usr/bin/env bash
set -e  # Exit immediately if a command fails
set -x  # Print commands for debugging


# run quartz sync to update the main repo
npx quartz sync

# Push changes in submodule
cd ./content/Private-Notes

branch=$(git rev-parse --abbrev-ref HEAD)
if [ "$branch" = "HEAD" ]; then
  branch="main"
  git checkout "$branch"
fi

# Fetch and merge latest changes from remote branch
git fetch origin "$branch"
git merge --ff-only origin/"$branch" || {
  echo "Fast-forward merge failed; please resolve manually."
  exit 1
}

# Now add, commit, and push local changes
git add -A
if ! git diff --cached --quiet; then
  git config user.name "github-actions[bot]"
  git config user.email "41898282+github-actions[bot]@users.noreply.github.com"
  git commit -m "Automated update from Quartz sync"
  git push origin "$branch"
fi

echo "Vault Updated!"
```


---
**References:**
* https://quartz.jzhao.xyz/
* https://obsidian.md/
* https://docs.github.com/en/pages
* https://git-scm.com/book/en/v2/Git-Tools-Submodules