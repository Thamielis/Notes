---
created: 2025-07-28T11:44:56 (UTC +02:00)
tags: [Git,recording changes,version control,staging,committing,Git commands,Git workflow]
source: https://www.tutorialspoint.com/git/git-recording-the-changes.htm
author: 
---

# Recording Changes in Git

---
___

___

Recording changes to the repository means:

-   A complete copy of every file from the remote Git repository is downloaded to your local computer during a clone.
    
-   You have unrestricted access to edit and alter the files in this local copy.
    
-   You may control which modifications you wish to keep with Git.
    
-   Changes can be kept untracked (not included in commits) or tracked (included in subsequent snapshots or commits).
    
-   Any new or existing files that haven't been uploaded for tracking yet are referred to as untracked files. After cloning, all files are initially regarded as tracked and unaltered.
    

## The Three States in Git

There are three main states, which a file can be in during its life cycle in Git:

Git keeps track of file modifications since the last commit (snapshot).

-   **Modified:** By staging the modified files, you can select which of them to include in the next snapshot.
    
-   **Staged:** By committing, every staged change is captured in a single picture.
    
-   **Committed:** As you work on your project, you will repeat this cycle of editing, staging, and committing.
    

## Checking the Status of Your Files

The most convenient way to verify the condition of files in your Git repository is to use the **git status** command.

```html
$ git status
```

The output message is as follows:

```html
On branch main
Your branch is up to date with 'origin/main'.

nothing to commit, working tree clean
```

It also identifies the current branch and confirms it hasn't diverged from the server's branch, typically master.

```html
$ echo 'myGymProj' > README
$ git status
```

```html
On branch gym-project
Your branch is ahead of 'origin/gym-project' by 3 commits.
   (use "git push" to publish your local commits)

Untracked files:
   (use "git add ..." to include in what will be committed)
         README

nothing added to commit but untracked files present (use "git add" to track)   
```

Git won't automatically track new files. You need to tell Git to start tracking them using the git add command. This ensures accidental files aren't included in commits.

## Tracking New Files

To begin tracking a new file, use **git add**. It will then be recognized by Git for upcoming commits.

After adding a file, you can validate it's tracked and ready to commit by running **git status**.

```html
$ git add README
```

Just as **git add** started tracking these staged files, committing records their current version.

```html
$ git add about_us.html
$ git status
```

```html
On branch gym-project
Your branch is ahead of 'origin/gym-project' by 3 commits.
   (use "git push" to publish your local commits)

Changes to be committed:
   (use "git restore --staged ..." to unstage)
      new file:   about_us.html   
```

## Staging Modified Files

A tracked file such as homePage.html will not immediately be staged when edited. They are listed with git status under **Changes not staged for commit**.

This means that the changes must be staged using **git add** before committing because they aren't captured for the next commit.

```html
$ git status
```

```html
On branch gym-project
Your branch is ahead of 'origin/gym-project' by 3 commits.
   (use "git push" to publish your local commits)

Changes to be committed:
   (use "git restore --staged ..." to unstage)
         new file:   about_us.html

Changes not staged for commit:
   (use "git add <file>..." to update what will be committed)
   (use "git restore <pre>..." to discard changes in working directory)
         modified:   homePage.html
```

```html
$ git add homePage.html
```

The output message is as follows:

```html
On branch gym-project
Your branch is ahead of 'origin/gym-project' by 3 commits.
   (use "git push" to publish your local commits)

Changes to be committed:
   (use "git restore --staged ..." to unstage)
         new file:   about_us.html
         modified:   homePage.html
```

But first, let's execute git status again:

```html
$ vim homePage.html
```

The output message is as follows:

```html
On branch gym-project
Your branch is ahead of 'origin/gym-project' by 3 commits.
   (use "git push" to publish your local commits)

Changes to be committed:
   (use "git restore --staged ..." to unstage)
         new file:   about_us.html
         modified:   homePage.html   
```

```html
$ git add homePage.html
```

The output message is as follows:

```html
On branch gym-project
Your branch is ahead of 'origin/gym-project' by 3 commits.
   (use "git push" to publish your local commits)

Changes to be committed:
   (use "git restore --staged ..." to unstage)
         new file:   about_us.html
         modified:   homePage.html
```

The file status of your Git repository can be thoroughly viewed with **git status**.

Use the **-s** or **--short** flag to obtain a shorter version of the output from git status for a more readable perspective. This simplifies searching for specific changes.

```html
$ git status -s
```

```html
A  about_us.html
M  homePage.html
?? .homePage.html.swp
```

-   **??** - New untracked files
    
-   **A** - Newly added files
    
-   **M** - Modified files (and others)
    

The output is displayed in two columns:

-   Left - Staging area status (what's ready for commit)
    
-   Right - Working directory status (current state of your files)
    

## Ignoring Files

In the root directory of your project, create a.gitignore file to exclude unwanted files from Git tracking.

List patterns in the **.gitignore** file to match and exclude them. This stops these unnecessary files from being accidentally committed.

```html
$ cat .gitignore
```

-   Logs
    
-   Temporary files (tmp directories)
    
-   Process ID (pid) directories
    
-   Automatically generated documentation
    

```html
$ cat .gitignore
```

```html
# no .a files
*.a

# but do track lib.a, even though you're ignoring .a files above
!lib.a

# only ignore the root TODO file, not subdir/TODO
/TODO

# ignore all files in the build/ directory
build/

# ignore doc/notes.txt, but not doc/server/arch.txt
doc/*.txt

# ignore all .txt files in the doc/ directory
doc/**/*.txt
```

-   Ignore comments (lines with #) and blank lines.
    
-   Use glob patterns for matching files:
    

-   ***** matches any number of characters (e.g., *.log)
    
-   **[]** matches characters within brackets (e.g., [abc])
    
-   **?** matches a single character
    
-   **[0-9]** matches a range of characters (e.g., numbers 0-9)
    
-   ****** matches nested directories (e.g., a/**/z)
    

-   Start patterns with **/** to ignore only the specific file (not subdirectories).
    
-   End patterns with **/** to target directories (e.g., tmp/).
    
-   Prefix patterns with **!** to negate the rule (e.g., include README.md).
    

## Viewing the Staged and Unstaged Changes

The **git status** offers a concise overview of changes in your working directory.

-   It lists files that are modified, staged, or untracked.
    
-   Use **git status** to get a general idea of what's changed.
    
-   In contrast, **git diff** provides a detailed view of the actual edits.
    
-   It shows line-by-line additions and removals, like a patch of the modifications.
    
-   Use **git diff** when you need to see the exact edits made to your files.
    

```html
$ git status
```

```html
$ git diff
```

```html
diff --git a/homePage.html b/homePage.html
index 994cc5a..9e40d3c 100644
--- a/homePage.html
+++ b/homePage.html
@@ -47,7 +47,7 @@
         }
         .navbar li{
               display: inline-block;
-            font-size: 20px;
+            font-size: 22px;

         }
         .navbar li a{
@@ -94,7 +94,7 @@
         </div>
         
         <div class="right">
-            <button class="btn">Call Us</button>
+            <button class="btn">Contact Us</button>
<button class="btn">Email Us</button>
</div>
</header>   
```

Use **git diff --staged** to see changes that have been staged for the next commit by comparing them to the previous commit.

```html
$ git diff --staged
```

```html
diff --git a/about_us.html b/about_us.html
new file mode 100644
index 0000000..e69de29
diff --git a/homePage.html b/homePage.html
index 3abf58d..994cc5a 100644
--- a/homePage.html
+++ b/homePage.html
@@ -99,7 +99,7 @@
   </div>
   <header>
   <div class="Container">
   -        <h2>Join the best gym of Delhi now</h2>
   +        <h2>Join the best gym of Pune now</h2>
   </div>
   <body>  
```

If all of your changes have been staged, **git diff** will return nothing.

Once the **homePage.html** file has been staged and edited, you can use **git diff** to see both the staged and unstaged changes in the file.

```html
$ git status
```

```html
On branch gym-project
Your branch is ahead of 'origin/gym-project' by 3 commits.
   (use "git push" to publish your local commits)

Changes to be committed:
   (use "git restore --staged ..." to unstage)
         new file:   about_us.html
         modified:   homePage.html

Changes not staged for commit:
   (use "git add ..." to update what will be committed)
   (use "git restore ..." to discard changes in working directory)
         modified:   homePage.html   
```

```html
$ git diff
```

```html
diff --git a/homePage.html b/homePage.html
index 9e40d3c..dbf6cf4 100644
--- a/homePage.html
+++ b/homePage.html
@@ -80,7 +80,7 @@
         <div class="left">
         <img src="img/dumbbell.jpg" alt="">
-                <div>ABC Fitness</div>
+                <div>XYZ Fitness</div>
         </div>
```

It's worth noting that **--staged** and **--cached** are synonyms in this context.

```html
$ git diff --cached
```

```html
diff --git a/about_us.html b/about_us.html
index e69de29..9a1eb8d 100644
--- a/about_us.html
+++ b/about_us.html
@@ -0,0 +1 @@
+<h1>Hello World</h1>
\ No newline at end of file
diff --git a/homePage.html b/homePage.html
index 9e40d3c..dbf6cf4 100644
--- a/homePage.html
+++ b/homePage.html
@@ -80,7 +80,7 @@
      <div class="left">
      <img src="img/dumbbell.jpg" alt="">
      -                <div>ABC Fitness</div>
      +                <div>XYZ Fitness</div>
      </div> 
```

You can fine-tune precisely which modifications are part of a commit using the staging area.

-   Unstaged modifications won't be included, such as newly added or modified files that weren't added via git add.
    
-   Use git commit to commit all staged changes.
    
-   This is predicated on a prior git status verifying that everything is staged according to plan.
    

```html
$ git commit
```

You can either:

-   Delete these comments and write your own commit message.
    
-   Keep the comments as a reference for what's being committed.
    
-   When you save and exit the editor, Git creates the commit using your message (without the comments or diff).
    

![git commit](https://www.tutorialspoint.com/git/images/git-comit.png)

You can skip the editor! You can write your commit message directly after the git commit command using the **-m** flag.

For example: git commit -m "Fixed Test.htm". This avoids opening the editor and lets you include your message inline.

```html
$ git commit -m "changed the name"
```

```html
[gym-project 5c4824d] changed the name
2 files changed, 2 insertions(+), 1 deletion(-)  
```

The staging area can increase complexity even though it is helpful for precise commits.

-   Git provides a shortcut, **git commit -a**, to avoid staging.
    
-   The **git add** is not necessary because this command automatically stages all tracked files before committing.
    
-   When you wish to commit all changes at once, it makes workflows simpler.
    

```html
$ git commit -a -m "added h2 tag"
```

```html
[gym-project c2a4e75] added h2 tag
1 file changed, 2 insertions(+), 1 deletion(-)  
```

But be careful it contains all recorded changes, which can include unintended ones. Consider using the staging area with git add for more exact control.

## Removing the files

When you remove a file from your Git repository, it needs to be removed from two places:

-   Working directory: This is the file's local copy for you.
    
-   Staging area: Files that you have ready for the next commit are stored here.
    
-   You use the **git rm** command to accomplish this. By doing this, the file is deleted from both locations and made sure not to reappear as an untracked file in the future.
    

When you remove a file from your working directory directly without using **git rm**, it gets listed in the **Changes not staged for commit** portion of the **git status** output.

```html
$ rm about_us.html
```

The output message is as follows:

```html
On branch gym-project
Your branch is ahead of 'origin/gym-project' by 6 commits.
   (use "git push" to publish your local commits)

Changes not staged for commit:
   (use "git add/rm <file>..." to update what will be committed)
   (use "git restore <file>..." to discard changes in working directory)
         deleted:    about_us.html

no changes added to commit (use "git add" and/or "git commit -a")   
```

```html
$ git rm about_us.html
```

```html
rm 'about_us.html'
```

The output message is as follows:

```html
On branch gym-project
Your branch is ahead of 'origin/gym-project' by 6 commits.
   (use "git push" to publish your local commits)

Changes not staged for commit:
   (use "git add/rm <file>..." to update what will be committed)
   (use "git restore <file>..." to discard changes in working directory)
         deleted:    about_us.html

no changes added to commit (use "git add" and/or "git commit -a")   
```

```html
$ git rm --cached Test.htm    
```

```html
$ git rm docs/\*.txt
```

## Moving the files

Git's Methodology for Renaming Files: In contrast to several other version management systems, Git does not explicitly record the moves that occur while renaming files.

-   This implies that renaming a file creates a new file after it is first deleted.
    
-   However, Git uses advanced algorithms to recognize these renames later on, in an intelligent manner.
    

Git has the ability to rename files within its repository using the **mv** command, while without explicitly tracking file transfers.

```html
$ git mv file_from file_to\
```

```html
$ git mv homePage.html home_page.html
```

The output message is as follows:

```html
On branch gym-project
Your branch is ahead of 'origin/gym-project' by 6 commits.
   (use "git push" to publish your local commits)

Changes to be committed:
   (use "git restore --staged <file>..." to unstage)
         deleted:    about_us.html
         renamed:    homePage.html -> home_page.html
```

Before committing, you can handle the add/remove stages and rename using any tool.
