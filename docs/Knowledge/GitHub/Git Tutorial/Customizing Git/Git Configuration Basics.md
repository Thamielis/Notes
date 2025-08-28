---
created: 2025-07-28T11:25:04 (UTC +02:00)
tags: [Git configuration,Git setup,version control,Git user settings,Git editor settings,Git command line]
source: https://www.tutorialspoint.com/git/git-configuration.htm
author: 
---

# Git Configuration Basics

---
## Customizing Git - Git Configuration

___

___

Git configuration is important as it defines how Git behaves on your system. Configurations for Git can be specified at three different levels − **system, global,** and **local**.

## Levels of Configuration

**1. System Level**

-   Configurations are found at **[path]/etc/gitconfig**.
    
-   Contains configurations that are applied to all users and repositories on the system.
    
-   To edit this file, use **git config** with the **--system** option.
    

```html
git config --system <key> <value>
```

-   Configurations are found in **~/.gitconfig** or in **~/.config/git/config** file.
    
-   Contains configurations that are applied to the current user.
    
-   To edit this file, use the **--global** option.
    

```html
git config --global <key> <value>
```

-   Configurations are found in the **.git/config** file inside a repository.
    
-   Contains configurations that are applied to the current repository.
    
-   To edit this file, use the **--local** option or no option at all, as **local** is the default option.
    

```html
git config --local <key> <value>
```

This hierarchy of settings applies to each level.

## Basic Client Configuration

There are two types of Git configuration options: server-side and client-side.

The majority of settings are client-side and determine individual working preferences.

Although there are several possibilities, only the most popular and practical ones will be discussed.

Use the following command to view the whole list of options for our Git version:

```html
man git-config
```

-   Git uses the text editor that is set by the **VISUAL** or **EDITOR** environment variables by default, or sets the default to vi for editing commit and tag messages.
    

Use the **core.editor** option to modify the current default editor:

```html
git config --global core.editor emacs
```

**commit.template**

Git allows us to select a file to be used as the default first message when we create a commit by using the **commit.template** variable.

-   Reminders and instructions regarding the structure and style we intend to use for commit messages might be included in this template file.
    
-   Every time a commit is made, we are able to remind ourselves or others of the intended message format by utilizing a commit template, which helps to ensure consistency.
    
-   The commit template serves as a useful reminder to keep the subject line short, offer a link to any associated issue or bug tracker ticket below it, and add descriptive information.
    

Configure the **commit.template** value in Git to establish a default commit message template:

```html
git config --global commit.template ~/.taskmessage.txt
git commit
```

-   The pager program that displays output from commands like **git log** and **git diff** is configurable in Git using the **core.pager** setting.
    
-   It is initially set to **less**, but we can modify it to use a different pager or to completely turn off paging by setting it to an empty string (**''**).
    
-   Git will print the entire output, no matter how long, without pausing if paging is disabled.
    

```html
git config --global core.pager ''
```

-   It's easier to use a default key for signing annotated tags when we utilize Git's **user.signingkey** parameter, which lets us provide a GPG key.
    

We use this command to set it:

```html
git config --global user.signingkey 
```

Once the **user.signingkey** is configured, we may use the **git tag -s <tag-name>** command to sign tags without having to provide our key each time.

```html
git tag -s <tag-name>
```

-   With Git, we may provide a global ignore file for patterns (such as **.DS_Store** files or temporary editor files like **~** or **.swp**) that should be ignored in all repositories on our machine by using the **core.excludesfile** setting.
    
-   The project-specific **.gitignore** file is benefited by this.
    
-   We can provide patterns for files we wish Git to ignore across all repositories by creating a global **.gitignore** file (e.g., **~/.gitignore_global**) using the **core.excludesfile** parameter.
    

Git won't track or stage files that match the patterns specified in the global ignore file, which we configure with **git config --global core.excludesfile ~/.gitignore_global**.

```html
*~
.*.swp
.DS_Store
```

Without **help.autocorrect**: Git will identify the most likely correct command if we write it incorrectly, but it won't execute it.

When **help.autocorrect** is enabled, Git will automatically execute the closest matching command after a brief delay if we set it to a non-zero value.

For example, if we set it to 20, or two seconds, we will get:

```html
git config --global help.autocorrect 20
git commt -m "Fix bug"
WARNING: You called a Git command named 'commt', which does not exist.
Continuing under the assumption that you meant 'commit'
in 2 seconds automatically...
```

Git provides colored terminal output to make command results simpler to read and help differentiate between various kinds of data.

Using a variety of setting choices, we can alter the colors to fit our tastes.

Git output interpretation is made faster and more clear with the help of this functionality.

**color.ui**

The **color.ui** setting in Git controls whether colored output is used.

To disable all colored terminal output, we can set it to false with:

```html
git config --global color.ui false
```

Alternatively, we can impose color in redirected output as necessary by using the **--color** parameter with commands.

**color.***

Git provides options such as **color.branch**, **color.diff**, **color.interactive**, and **color.status** for command-specific coloring, giving users extensive flexibility over colors.

We can set each setting to **true**, **false**, or **always** to adjust how color is used for certain Git operations.

```html
color.branch
color.diff
color.interactive
color.status
```

For example, to format the extra lines in the diff output as bold formatting with a yellow background and green text, use:

```html
git config global color.diff.new "green yellow bold"
```

### Formatting and Whitespace

In collaborative development, formatting and whitespace concerns can be challenging, particularly when working across various platforms.

Different line endings on different systems or editor settings might cause minor differences in spacing.

Git provides configuration options to assist with handling and resolving these problems.

**core.autocrlf**

Git handles line-ending problems between different operating systems with the **core.autocrlf** parameter.

-   To automatically convert linefeed (LF) ends to carriage return **+** linefeed (CRLF) when checking out code and back to LF when adding files to the index, set it to **true** on Windows.
    
-   By doing this, issues brought on by different newline characters on different platforms are avoided.
    

```html
git config --global core.autocrlf true
```

This maintains CRLF in Windows checkouts but guarantees LF ends in the repository and on macOS/Linux.

```html
git config --global core.autocrlf input
```

Set **core.autocrlf** to false if we wish to maintain CRLF endings in the repository for a Windows-only project:

```html
git config --global core.autocrlf false
```

Git has six main checks that it uses to identify and resolve whitespace problems.

It activates checks for spaces before tabs, blank lines at the end of files, and spaces at the end of lines by default.

-   By default, the checks for carriage returns at line ends, tabs in indentation, and spaces in place of tabs are disabled.
    
-   Using **core.whitespace**, configure which checks to enable or disable.
    
-   Option names should be separated by commas, and a **-** indicates to disable an option.
    
-   We can set it up to enable everything but the check for spaces before tabs, for instance.
    

```html
git config --global core.whitespace \
    trailing-space,-space-before-tab,indent-with-non-tab,tab-in-indent,cr-at-eol
```

```html
git config --global core.whitespace \
-space-before-tab,indent-with-non-tab,tab-in-indent,cr-at-eol
```

Using **--whitespace=warn** or **--whitespace=fix**, we may automatically resolve whitespace issues or receive warnings when applying patches with **git apply**.

When rewriting commits, the **--whitespace=fix** option can also be used to address whitespace problems with **git rebase**.

```html
git apply --whitespace=warn <patch>
git apply --whitespace=fix <patch>
```

**receive.fsckObjects**

Git may confirm an object's integrity during a push by examining its SHA-1 checksum to make sure it points to an authentic object.

Because of the possible impact this verification may have on performance, especially when dealing with big repositories, it is disabled by default.

Set **receive.fsckObjects** to true to make this check happen after each push:

```html
git config --system receive.fsckObjects true
```

Git will refuse to push if we rebase commits that have already been pushed and then try to push again if the commits are not in the remote branch.

Use the **-f** flag to overcome this and force-update the remote branch.

Set **receive.denyNonFastForwards** to true to stop these force pushes:

```html
git config --system receive.denyNonFastForwards true
```

Set **receive.denyDeletes** to true to stop users from removing branches or tags as a workaround for the **denyNonFastForwards** policy:

```html
git config --system receive.denyDeletes true
```

### Creating Aliases

Shortcuts or aliases can be created for various Git commands. Refer the following commands:

```html
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
```

In order to view your current configuration, you can run the following commands:

```html
# Lists all configurations
git config --list

# Lists global configurations
git config --global --list

# Lists local configurations
git config --local --list
```
