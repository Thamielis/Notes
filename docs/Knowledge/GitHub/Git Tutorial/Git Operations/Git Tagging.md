---
created: 2025-07-28T10:56:49 (UTC +02:00)
tags: [Git tagging,version control,Git tags,repository management,software development]
source: https://www.tutorialspoint.com/git/git-tagging.htm
author: 
---

# Git Tagging

---
___

___

Git **tags** are a means to highlight significant events in a project's history.

In addition to explaining the many kinds of tags that are readily available it will understand how to locate current tags, add new ones, and remove them. These points are usually associated with releases (like v1.0, v2.1, etc.) or milestones in the development of a project.

## Basic Syntax for Tagging

Unlike branches, which can move over time as new commits are added, a tag is immutableit always points to the same commit.

There are two types of tags in Git:

-   **Lightweight tags:** Like bookmarks, these are just direct pointers to a particular commit. They don't store any extra information, like a message or tagger details.
    
-   **Annotated tags:** Think of them as more complex bookmarks. They store extra metadata such as the tagger's name, the date, and a message. Annotated tags are the preferred type when we're tagging releases because they are more descriptive and provide more historical information.
    

The syntax for creating and managing tags in Git is straightforward. Here's an example:

```bash
git tag <tag-name>
```

```bash
git tag v1.0
```

To create an annotated tag, use the `-a` option:

```bash
git tag -a <tag-name> -m "Tag message"
```

```bash
git tag -a v1.0 -m "Initial release"
```

## Types of Git Tags

As mentioned earlier, there are two main types of tags: lightweight tags and annotated tags. Let's explore both types in detail.

### Lightweight Tags

A lightweight tag is essentially a pointer to a specific commit. It's like creating a branch that doesn't move. Lightweight tags don't have any additional metadata like messages or timestamps, and they are used mostly for temporary or quick tagging tasks.

To create a lightweight tag, simply run:

```html
git tag v1.0
```

```html
git tag v1.0 <commit-hash>
```

### Annotated Tags

Annotated tags, on the other hand, are full Git objects that store metadata. When we create an annotated tag, Git records who created the tag, when it was created, and a message along with it.

When generating an annotated tag in Git, we can provide a tagging message by using the **-m** option.

```html
git tag -a v1.0 -m "Version 1.0 release"
```

```html
git show v1.0
```

## Tagging Older Commits

Even after we've progressed beyond a commit, we can still tag it. i.e sometimes, we may need to go back in history and tag an older commit. To do this, simply provide the commit hash when creating the tag:

```html
git tag v1.0 <commit-hash>
```

```html
git tag -a v1.0  -m "Version 1.0 release"
```

## Pushing Tags to a Remote Repository

By default, tags are not automatically pushed to the remote repository when we run **git push**. To push tags, we need to explicitly include them in the push command.

To push a single tag to the remote repository, use the following command:

```html
git push origin <tagname>
```

```html
git push origin v1.0
```

```html
git push origin --tags
```

Use the following command to remove a tag from our local repository. On remote servers, the tag is still present even after executing this action.

```html
git tag -d <tagname>
```

```html
git tag -d v1.0
```

Using the following command is the first method.

```html
git push origin --delete <tagname>
```

For example:

```html
git push origin --delete v1.0
```

We can perform a **git checkout** of a tag in order to view the file versions linked to that tag.

This operation, however, puts our repository in a **detached HEAD** state, which has certain unfavorable effects.

```html
git checkout t1.9a
Note: switching to 't1.9a'.

You are in 'detached HEAD' state. You can look around, make experimental changes and commit them, 
and you can discard any commits you make in this state without impacting any branches by switching back to a branch.

If you want to create a new branch to retain commits you create, you may do so (now or later) by using -c with the switch command. Example:

 git switch -c <new-branch-name>

Or undo this operation with :

 git switch -

Turn off this advice by setting config variable advice.detachedHead to false

Head is now at cc086fa user interface added
```

```html
$ git checkout -b type2 t2.0
Previous HEAD position was cc086fa user interface added
Switched to a new branch 'type2'
```

## Best Practices for Git Tagging

To use Git tags effectively, follow these best practices:

-   **Use Annotated Tags for Releases:** Annotated tags provide more information and context, making them ideal for marking important points like releases.
    
-   **Follow a Consistent Naming Convention:** Adopt a consistent naming scheme for the tags, such as using v1.0, v1.1, etc. This helps keep the tags organized and easy to understand.
    
-   **Push Tags to the Remote Repository:** Ensure to push tags to the remote repository so that other collaborators can see and use them.
    
-   **Tag Major and Minor Versions:** Tagging both major and minor versions (e.g., v1.0 and v1.0.1) helps in identifying the state of the code at different levels of stability.
