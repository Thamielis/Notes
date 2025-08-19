---
created: 2025-07-28T10:54:55 (UTC +02:00)
tags: [Git branches,version control,Git branch types,create Git branch,manage branches,Git workflow]
source: https://www.tutorialspoint.com/git/git-branches.htm
author: 
---

# Git Branches

---
___

___

## What is Branch

A branch is simply a pointer to a specific commit in the history. It represents an independent line of development in your project.

Branching in VCS is a common feature that allows developers to work on separate lines of code without affecting the main development.

Traditional VCS tools can be slow when creating branches, especially for large projects. This slowdown is caused by copying the entire codebase for each new branch.

Git shines in VCS due to its lightweight branching model, allowing for very fast creation and switching between branches.

-   This efficiency comes from Git not duplicating the entire codebase for each branch, unlike many other VCS tools.
    
-   This enables frequent branching and merging, potentially happening multiple times a day.
    
-   By mastering Git's branching, developers can significantly improve their workflow and productivity.
    

## Git Vs Other VCS

Git differs from other VCSs in how it keeps data. It makes use of several snapshots as compared to a series of modifications.

-   In Git, every commit takes a picture of the code as it stands at that particular moment.
    
-   This snapshot is kept in the form of a commit object, which has details about the author, message, and parent commit referenced to it.
    
-   Regular commits have one parent, merges (combining branches) have several parents, and first commits have none.
    

## Stage and Commit

Git keeps track of the files that are staged for a particular commit.

-   The command **git add** is used to mark files that should be included in a commit.
    
-   Git generates a distinct checksum (SHA-1 hash) for every staged file, accurately reflecting its content at that particular moment.
    
-   The repository stores these checksums as **blobs**.
    

## Making of a Snapshot

Git keeps track of the entire project's state at every commit.

-   Git generates a snapshot of the whole project directory structure when we use the **git commit** command.
    
-   The contained files (blobs) and their accompanying checksums are listed in a map format, called a **tree object**, which is how this snapshot is kept.
    

## Commit Object

Git represents the commit by creating a commit object.

-   Metadata such as author details, commit message, timestamp, and above all a pointer to the root tree object are stored in this object.
    
-   Git can rebuild the precise project state at that particular commit using this pointer.
    

### Chain of Commits

-   Every commit we make, adds a reference to (points to) the commit before it.
    
-   By doing this, a chronological chain of commits is created, connecting the commits and giving us the access to the project's history.
    

## Using Branches

-   For the commit chain, Git uses **branches** as moveable, lightweight pointers.
    
-   These are bookmarks indicating certain commit history points.
    
-   By default, Git creates a main branch named **master** that initially points to our latest commit.
    

![git branch3](https://www.tutorialspoint.com/git/images/git-branch3.png)

### Updates for the Master Branch

-   The **master** branch pointer automatically refreshes to point to the most recent commit as we make changes and commit.
    
-   This guarantees that the most recent snapshot of our project is always reflected in the **master** branch.
    

## Creating a New Branch

In Git, a newly formed branch creates a new pointer to monitor an alternate development path.

Consider a project with a branch named **master**, which points to a specific commit in the project's history.

Create a branch using the following command:

```html
 $ git branch feature-xyz
 
```

A branch serves as a bookmark or label. The **feature-xyz** branch and **master** will point to the same commit.

![git branchA](https://www.tutorialspoint.com/git/images/git-branchA.png)

### Tracking the Current Branch

Git uses a special pointer called **HEAD** to keep track of the currently active branch.

When a new branch is created, **HEAD** still points to the master branch, indicating that the current working branch remains master until explicitly switched.

![git branchB](https://www.tutorialspoint.com/git/images/git-branchB.png)

The **git log** command with the **--decorate** option shows where the branch pointers are pointing in the commit history.

```html
$ git log --decorate
```

```html
f55bc (HEAD -> master, feature-xyz) Add support for new file formats
54bd2 Fix crash issue under heavy load conditions
88ba6 Initial setup and configuration
```

### Switching Branches

To change the active branch and update **HEAD** to point to the **feature-xyz** branch, use:

```html
$ git checkout feature-xyz
```

![git branchC](https://www.tutorialspoint.com/git/images/git-branchC.png)

The states of each branch may diverge upon a new commit after branch switching.

After executing these commands, a new commit is created on the currently active branch **feature-xyz**.

For example:

```html
$ vim update_script.py
$ git commit -a -m 'Enhance script functionality'
```

![git branchD](https://www.tutorialspoint.com/git/images/git-branchD.png)

### Switching Back to master

Use the following command to switch back to the **master** branch.

```html
$ git checkout master
```

![git branchE](https://www.tutorialspoint.com/git/images/git-branchE.png)

It updates the files in the working directory to match the state of the commit that master points to.

This results in diverging work, as changes made on **feature-xyz** are not reflected on **master** and vice versa.

Let's make some additional changes and then commit:

```html
$ vim notes.txt
$ git commit -a -m 'Add notes for upcoming features'
```

The **master** branch now includes different changes, like the notes for upcoming features.

![git branchF](https://www.tutorialspoint.com/git/images/git-branchF.png)

A clear visual history of commits and branches is provided by the **git log --oneline --decorate --graph --all** command, which also illustrates the relationships and divergences between them.

```html
$ git log --oneline --decorate --graph --all
* 9d0f1 (HEAD -> master) Add notes for upcoming features
| * 6a1b2 (feature-xyz) Enhance script functionality
|/
* f55bc Add support for new file formats
* 54bd2 Fix crash issue under heavy load conditions
* 88ba6 Initial setup and configuration
```

-   Git branches are created and deleted almost instantly since they are simply files with a 40-character SHA-1 checksum of a commit.
    
-   This allows for efficient branch management.
    
-   Git's method saves the time-consuming step of copying entire directories for new branches, which is required by older version control systems.
    
-   Git also streamlines the merging process by automatically identifying merge bases and recording commit parents.
    
-   This efficiency and automation encourage frequent branching and flexible development workflows.
