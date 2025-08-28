---
created: 2025-07-03T19:04:22 (UTC +02:00)
tags: []
source: https://stevetalkscode.co.uk/merge-to-monorepo-1
author: 
---

# Merging Multiple Git Repositories Into A Mono-Repo with PowerShell (Part 1)

---
Following on from my [last blog](https://stevetalkscode.co.uk/install-octopus-with-domain-account) about the problems I had setting up Octopus Deploy with a service account, this is another DevOps related post that describes the approach I have taken to merging multiple Git repositories into a single Git repository (commonly known as a mono-repo).

## [Disclaimer](https://stevetalkscode.co.uk/merge-to-monorepo-1#disclaimer)

To be clear, I am not going to provide a wide ranging discussion about the relative merits and disadvantages of using a mono-repo for source control vs. having one repository per project (poly-repo).

In the end it comes down to what works best for the team to manage the overall code base by reducing friction.

If you have lots of disparate projects that have no impact on each other's existence or a true micro-service architecture where each service is managed within its own repository, there is very little point in bringing these into a mono-repo.

If on the other hand you have a distributed monolith where a feature requests or bug fixes may be spread across several repositories and require synchronisation when negotiating their way through the CI/CD pipeline (or worse having to jump through hoops to develop or test in concert while developing on your local machine), then a move to mono-repo may be of benefit.

There is no 'one size fits all' and you may end up with a hybrid of some projects occupying their own repositories, whilst others live in one big repository.

## [Background](https://stevetalkscode.co.uk/merge-to-monorepo-1#background)

What prompted the need for a move to a mono-repo in my case was having to coordinate features within a distributed monolith where a feature request may span one, some or all of four key repositories and the only coordinating factor is a ticket number in the branch names used in each of the repositories.

This causes problems when having to context switch between multiple issues and making sure that

-   the correct branches are checked out in the repositories
-   configuration files are amended to point to appropriate local or remote instances of services
-   ensuring pull requests to branches monitored by TeamCity are coordinated as these also trigger Octopus Deploy to deploy to our common development environment
-   version numbers for different projects are understood and the inter-relationships are documented.

Now moving to a mono-repo is not going to solve all these problems, but it is the first step on the road.

## [(Moving To) A Whole New World](https://stevetalkscode.co.uk/merge-to-monorepo-1#whole-new-world)

As described in my previous blog post, the team I am currently working with is in the process of completely rebuilding the CI/CD pipeline with the latest versions of Team City and Octopus Deploy.

This has provided the ideal opportunity to migrate from the current poly-repo structure to a new mono-repo. But how should we approach it?

### [Approaches to Consider](https://stevetalkscode.co.uk/merge-to-monorepo-1#approaches-to-consider)

At it's simplest, we could just take a copy of the current 'live' code and paste it into a new repository. The problem with this would be the loss of the ability to look at the (decade long) history in the context of the current repository. Instead, this would require hopping over to the existing repositories to view the history of files. We could live with, but is not ideal as it introduces friction of a different kind.

So, somehow, we need to try to migrate everything to one place, but this comes with complications.

In each of the current repositories, the source code is held at the root of each repo, so when trying to merge the repositories 'as-is', it introduces problems when trying to merge the contents of each of the existing repositories as it will cause no end of merge conflicts and muddy the code base. Therefore, the first thing we will need to do is to move the source code down from the root into dedicated (uniquely named) folders.

This could be done within the existing repositories before we think about merging repositories. However, this will mean having to revisit all the existing Team City projects to repoint the watched projects to the new folders. This also causes disruption to any current work that is in progress. So this approach should be ruled out.

There is also the problem of what to do with all the branches and tags in the old repositories. Ideally we want to also bring them along into the new repository, but we have a similar problem regarding trying to avoid naming conflicts (as I mentioned above, the branch names are the coordinating factor that we currently use, so these will be the same in each of the repositories where code has changed for a particular feature), so these will need renaming as well.

## [I'll Tell You What I Want (What I Really, Really Want)](https://stevetalkscode.co.uk/merge-to-monorepo-1#what-i-really-really-want)

With all the above in mind, we need a migration plan that can accommodate the following requirements:

-   No changes required to the existing repositories
-   The full history needs to be migrated
-   All live branches need to be migrated
-   All tags need to be migrated
-   Avoid clashes between migrated repositories when brought into a single structure
-   Allow for a pre-migration to be run so that the new Team City can be set up without impacting the existing repositories and existing CI/CD pipeline
-   The process must be repeatable with minimum effort so that any problems can be identified and corrected, but also so that the new CI/CD pipeline can be built in preparation for a low-impact cut-over.

At first this seemed like a tall order, but ultimately what this boils down to is creating a new repository and then repeating the following steps for each legacy repository to be merged:

-   Pull each legacy repository the new repository
-   Rename the legacy branches and tags to they do not clash
-   Select a 'live' branch to merge into the main branch of the new repository and check it out
-   Move the content of the 'live' branch to a sub-folder that will not clash as other repositories are subsequently migrated
-   Merge the 'live' branch into the main branch

These steps can all be achieved by a combination of Git commands and file system commands which can be put together into a script.

In [Part 2](https://stevetalkscode.co.uk/merge-to-monorepo-2), I will show you how I created a PowerShell script to achieve the goal.
