---
created: 2025-07-28T11:04:17 (UTC +02:00)
tags: [git init,Git repository,initialize Git,version control,create Git repo]
source: https://www.tutorialspoint.com/git/git-init.htm
author: 
---

# Git Init Command

---
___

___

The **git init** command is used to create a new Git repository. This command when run in a directory, initializes a new, empty Git repository by creating a new hidden **.git** sub-directory.

The **.git** directory, which houses all project references and objects, is created by this command.

-   The project's history is based on the **.git** directory, which also holds important configuration files.
    
-   To create a new repository, select **git init**; to clone an existing repository, use **git clone**; do not select both at the same time.
    
-   Using both **git init** and **git clone** simultaneously can lead to conflicts and improper repository setup.
    

A blank Git repository is created when we run **git init**.

A **.git** directory with particular subdirectories is present in the repository:

-   **objects :** Includes all of the information that Git handles (commits, trees, and blobs).
    
-   **refs/heads :** Provides references to the ends of the repository's branches.
    
-   **refs/tags :** Stores pointers to tag objects that have been added to the repository.
    
-   **Template files :** These are also included in the **.git** directory.
    

By using the **$GIT_DIR** environment variable, one can select a different base path for the repository instead of the standard **./.git**.

-   Git stores objects in **$GIT_OBJECT_DIRECTORY** if it is set; if not, it defaults to **$GIT_DIR/objects**.
    
-   In an already-existing repository, executing **git init** is risk-free and doesn't replace current files.
    
-   It's frequently used with the **--separate-git-dir** option to move the repository or configure new templates.
    

## Syntax

In order to use this command, navigate to your project directory in the terminal and run this command.

```html
  git init
```

## Options

The **git init** command has the following options:

**-q**

**--quiet**

-   Git's **-q** or **--quiet** option hides all additional information from output, restricting it to error and warning messages for a more simplified command-line interface.
    

```html
  git init --quiet

  git init -q
```

-   When using Git, the **--bare** option establishes a repository without a working directory, which is appropriate for server setups where changes are pulled and pushed but not edited directly.
    
-   The repository is created in the current directory if **GIT_DIR** isn't given.
    

```html
  git init --bare sample-repo.git
```

-   In Git, the hash algorithm (object format) for the repository can be specified using the **--object-format=<format>** option.
    
-   When it comes to hashing object identifiers, Git uses **sha1** by default.
    
-   If enabled, an additional hash algorithm, **sha256**, may be selected.
    
-   This option affects how object identifiers are computed and managed by Git throughout the repository.
    
-   The formats that can be used are **loose** and **pack**.
    
    **loose** is default format where the objects are stored as separate files in **.git/objects** directory.
    
    **pack** is where objects are stored in a packed format, which is more efficient in storage.
    

```html
  git init --object-format=pack
```

-   In Git, the **--ref-format=<format>** option defines the repository's references' (refs) storage format.
    
-   The default format is **files**, where refs are stored as loose files with packed-refs.
    
-   An alternative option is **reftable**, which represents an experimental format known as **reftable**.
    
    As Git develops and improves it, the **reftable** format might see internal modifications.
    

```html
  git init --ref-format=loose
```

-   In Git, the **--template=<template-directory>** option specifies a directory from which templates will be sourced when initializing repositories.
    

```html
  git init --template=/path/to/template sample-repo
```

-   Git allows repository initialization without requiring the creation of a **.git** directory by using the **--separate-git-dir=<git-dir>** option.
    
-   Rather, it generates a text file that points to the real repository at the given location (**<git-dir>**).
    
-   To enable repository operations across many file systems, this text file serves as a symbolic link.
    

```html
  git init --separate-git-dir=/path/to/git-dir /path/to/working-dir
```

**--shared[=(false|true|umask|group|all|world|everybody|<perm>)]**

-   Git allows group members to push changes by specifying that the repository should be shared among many users via the **--shared** option.
    
-   It applies **umask(2)** if no value is supplied, or it sets permissions for files and directories under **$GIT_DIR** based on specified values.
    
-   Options consist of:
    

-   **umask :** When permissions are not given, it uses **umask(2)** as the default.
    
-   **group :** Modifies **umask(2)** values, sets **g+sx** permissions, and makes the repository group-writable.
    
-   **all**, **world**, **everybody** **:** Like **group**, but allows any user to browse the repository.
    
-   **<perm> :** Overrides **umask(2)** settings by specifying permissions with a 3-digit octal number prefixed with **0**.
    

```html
  git init --shared=group
```

Hence, the **git init** sets up your version control, if you are starting a project from scratch. It can also be used in an existing project to start tracking the changes.
