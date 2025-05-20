---
created: 2025-05-20T20:57:17 (UTC +02:00)
tags: [medium,paywall,medium.com,paywall breakthrough]
source: https://freedium.cfd/https://medium.com/swlh/automating-work-item-management-fd9add6351d0
author: 
---

# Automating Work-Item Management | by Christopher Kuech | in The Startup - Freedium

---
_Part 8 of_ _[Declarative DevOps Microframeworks](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332)_

If you've started a new code base, you probably left a lot of `TODO`s in your code comments to indicate that you need to circle back on the implementation of a specific area at a later date. These `TODO`s help you focus on the overall code flow rather than getting distracted by a small implementation detail.

How do you keep track of these `TODO`s? We can leverage PowerShell's native RegEx and I/O capabilities to create a light-weight script for finding and aggregating `TODO`s in our repo.

![None](https://miro.medium.com/v2/resize:fit:700/0*HmzBGsQb3JnaRH8S)

Automatically manage your work items as code annotations (Photo by [Patrick Perkins](https://unsplash.com/@pperkins?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/search/photos/board-post-it?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText))

### Data-first

Because we are writing a simple aggregation script without any need for state, we will write our script adhering to a [functional paradigm](https://medium.com/@cjkuech/functional-programming-in-powershell-876edde1aadb). With this approach, we define our data first. We start with what we have (our inputs) and what we want (our outputs). We will also define our `TODO`s.

#### Inputs

The input data to our script is the path to the root of our repository: `$RepoRoot`.

#### Outputs

The output to our script will be schematized work item objects that we can display with `Format-Table`, filter with `Where-Object`, or aggregate with `Group-Object`.

#### TODO

Our `ToDo` class defines exactly what information we want to include in a `TODO`. We will include an optional "Priority" to indicate the importance of the task, as well as a message. For example, these are all valid `TODO`s.

From this, we can define two RegExs that matches our `TODO`s. The first RegEx matches `TODO`s with a specified Priority and the second RegEx matches `TODO`s without a specified Priority.

### Transformation 1: From RepoRoot to files

We only care about files in the repo and we only care about paths to the files in the repo relative to the repo root. As such, we will leverage `Push-Location $RepoRoot` to stash the current path and change the location to the repo root; we will then be able to use `Resolve-Path -Relative` to resolve paths relative to the current location ( `$RepoRoot` ), before we return to our original location with `Pop-Location`. We will also filter out `$PSCommandPath` because we don't want any `TODO`s listed in comments and strings to be parsed as work items.

### Transformation 2: From files to ToDos

Given our list of relative file paths in `$files`, we can now get the lines from the file and subsequently the line numbers and content of the lines.

Ideally, we like to write our PowerShell in a functional style; however, in our `ToDo` instantiation, we need to reference `$file`, `$Matches`, and the line number`$i` — variables defined in multiple scopes — so adhering to a purely functional style will actually make our code less clear. As such, we will "contain the problem" with a `scriptblock` invoked with `&`; all our `ToDo`s will be written to the output pipeline of the `scriptblock`.

### Transformation 3: Default Sorting

For the convenience of users, we will sort the `ToDo`s by Priority first such that high-priority issues come first (because the order is determined by the enum value), then sort by file path and line number within the priority group.

### The Full Solution

Tying these parts into our single `Get-ToDo.ps1` script —

### Next Steps

#### Manually tracking TODOs

If you have a small project, you can pipe the result of our `Get-ToDo` script to `Format-Table` whenever you want to see the current status of your `TODO`s.

#### Automatically tracking TODOs

If you are on a big team, you can use the output of the script to pipe your `TODO`s to another script for syncing your `TODO`s to a work item management system. For example, if you use Azure Boards, you can leverage the [Azure DevOps CLI](https://github.com/Azure/azure-devops-cli-extension) to create work items for each `TODO` (if you haven't created a work item for that `TODO` already). You can even integrate that script into a continuous integration pipeline to ensure that the code in `master` always correctly reflects.

Each team has a slightly different work item management process, so as Conway's Law predicts, you will have to write custom code to glue your ToDos to your work items. For example, you could use `$tag` to identify your work items as managed by your script.

#### Learn more about scaling your PowerShell

This article is part of [Declarative DevOps Microframeworks](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332) series of articles on managing PowerShell codebases at scale. Read the [rest of the series](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332) to learn more about designing and writing less code for large DevOps codebases.
