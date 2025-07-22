---
created: 2025-07-22T11:13:08 (UTC +02:00)
tags: []
source: https://chatgpt.com/g/g-JtV1tF7gf-git-expert-ugithub-gitlabu/c/687f5509-bf8c-832d-9b4a-a29ce95b84e5
author: 
---

# ChatGPT - Git Expert ㆍGitHub & GitLabㆍ

---

Here’s a starter toolkit of the most common Git commands every developer should have in their pocket. 🔨🤖🔧

## 📂 Repository Setup & Inspection

- `**git init**`  
    Create a new Git repository in the current folder.

- `**git clone <repo-url>**`  
    Copy an existing remote repo locally.

- `**git status**`  
    See which files are staged, unstaged, or untracked.

## ➕ Staging & Committing

- `**git add <file|dir|.>**`  
    Stage changes you want to include in your next commit.

- `**git commit -m "Your message"**`  
    Record staged changes to the repo, with a descriptive message.

- `**git commit --amend**`  
    Modify the most recent commit (e.g., to update its message or include new changes).

## 🌿 Branching & Navigation

- `**git branch**`  
    List all local branches, with `*` marking your current one.

- `**git branch <name>**`  
    Create a new branch called `<name>`.

- `**git checkout <branch>**`  
    Switch to another branch.

- `**git checkout -b <new-branch>**`  
    Create and immediately switch to a new branch.

## 🔀 Merging & Rebasing

- `**git merge <branch>**`  
    Merge changes from `<branch>` into your current branch.

- `**git rebase <branch>**`  
    Reapply your commits on top of another base branch, for a linear history.

## 🌐 Syncing with Remotes

- `**git remote -v**`  
    Show the remote repositories you’ve configured.

- `**git fetch [remote]**`  
    Download objects and refs from another repo (but don’t merge).

- `**git pull**`  
    Fetch from remote and immediately merge (or rebase) into your current branch.

- `**git push [remote] [branch]**`  
    Upload your local commits to the remote repo.

## 🕵️♂️ Inspection & History

- `**git log**`  
    Show a detailed commit history.

- `**git diff**`  
    Show unstaged changes between your working directory and the index.

- `**git show <commit>**`  
    Inspect a specific commit’s changes.

## 🔄 Undoing Changes

- `**git reset [--soft|--mixed|--hard] <commit>**`  
    Move your HEAD and (optionally) staging area or working directory to a previous commit.

- `**git revert <commit>**`  
    Create a new commit that undoes the changes from `<commit>`, safe for shared branches.

- `**git stash**`  
    Temporarily save your working directory and index state.

💡 **Tip:** Memorize the workflows you use most often, and refer to `git help <command>` whenever you need more detail.
