---
created: 2025-07-28T12:02:37 (UTC +02:00)
tags: [Git commands,Git cheat sheet,version control,Git workflow,Git basics,Git commands list,Git for beginners]
source: https://www.tutorialspoint.com/git/git-cheatsheet.htm
author: 
---

# Git Cheat Sheet

---
___

___

To make it easier for us to look up and utilize the most important and commonly used commands when working with Git, the **cheat sheet** below is a helpful reference guide.

## Setup

Setting up user data that is utilized in all local repositories.

```html
git config --global user.name [firstname lastname]
```

```html
git config --global user.email [valid-email]
```

```html
git config --global color.ui auto
```

## Setup and Initialization

Setting up user details, initializing repositories, and cloning repositories.

```html
git init
```

```html
git clone [url]
```

## Stage and Snapshot

Using the Git staging area and snapshots.

```html
git status
```

```html
git add [file]
```

```html
git reset [file]
```

```html
git diff
```

```html
git diff --staged
```

```html
git commit -m [descriptive message]
```

## Branch and Merge

Isolating work in branches, changing context, and integrating changes.

```html
git branch
```

```html
git branch [branch-name]
```

```html
git checkout
```

```html
git merge [branch]
```

```html
git log
```

## Inspect and Compare

Examining logs, diffs, and object data

```html
git log
```

```html
git log branchB..branchA
```

```html
git log --follow [file]
```

```html
git diff branchB...branchA
```

```html
git show [SHA]
```

## Tracking Path Changes

Versioning file removals and path modifications

```html
git rm [file]
```

```html
git mv [existing-path] [new-path]
```

```html
git log --stat -M
```

## Ignoring Patterns

Preventing files from being accidentally staged or committed.

```html
logs/
*.notes
pattern*/
```

```html
git config --global core.excludesfile [file]
```

## Share and Update

Retrieving updates from another repository and updating local repository.

```html
git remote add [alias] [url]
```

```html
git fetch [alias]
```

```html
git merge [alias]/[branch]
```

```html
git push [alias] [branch]
```

```html
git pull
```

## Rewrite History

Changing commits, rewriting branches, and deleting history

```html
git rebase [branch]
```

```html
git reset --hard [commit]
```

## Temporary Commits

Store tracked files that have been updated temporarily in order to switch branches.

```html
git stash
```

```html
git stash list
```

```html
git stash pop
```

```html
git stash drop
```
