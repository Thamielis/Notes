---
created: 2025-05-20T20:36:28 (UTC +02:00)
tags: [medium,paywall,medium.com,paywall breakthrough]
source: https://freedium.cfd/https://medium.com/@cjkuech/declarative-devops-30788ddd43cd
author: 
---

# Declarative DevOps | by Christopher Kuech | in ITNEXT - Freedium

---
_Part 2 of_ _[Declarative DevOps Microframeworks](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332)_

Declarative Programming is not a new concept — but its use describing DevOps tools has recently exploded. It may seem like just another trendy buzzword, but Declarative Programming has some unique benefits for DevOps that ensure it is here to stay.

![None](https://miro.medium.com/v2/resize:fit:700/1*SDFA4sS4_uJDTR8D0r8_OA.jpeg)

The popularity of Declarative DevOps has grown with the Cloud as developers try and mangle more and more remote resources (Photo by [Sam Schooler](https://unsplash.com/@sam?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/search/photos/the-cloud?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText))

### What is Declarative Programming?

Declarative Programming is often conflated with [Functional Programming](https://medium.com/@cjkuech/functional-programming-in-powershell-876edde1aadb), but is somewhat different. The easiest way to understand the Declarative paradigm is to contrast it to "normal" Imperative code.

#### What is Imperative Programming?

If you are asking this question, a good example of imperative code is your current codebase. Imperative code defines logic as a sequence of steps. Each step waits for the previous step to complete before continuing, and each step modifies the state of your system. "State" is anything that holds a dynamic value, such as:

-   a variable in memory
-   some resource on disk, like a file or registry setting
-   some external resource, like a VM in the cloud

#### What's so bad about Imperative Programming?

State is hard to debug. If you have state stored in variables, you might need a debugger to check the state of your program. If you have state stored on disk or in the cloud, you might have to run a script or open up an explorer to view the state. Worse, state is synonymous with side effects which are much more difficult to unit test than a "[pure function](https://en.wikipedia.org/wiki/Function_(mathematics))". Pure functions — functions that guarantee no side effects — only need to be unit tested in terms of their inputs and outputs, whereas functions with side effects also require testing for the absence or presence of side effect action.

![None](https://miro.medium.com/v2/resize:fit:700/1*eCABmqI2l5yz2rqpAN_qSA.png)

Wow, so much to debug!

#### There has to be a better way!

The alternative to Imperative Programming is Declarative Programming. Declarative Programming is where you "declare" your data structures and "query" their state. For example, SQL is a purely declarative language, because you "declare" your data structures (databases, tables, and their interrelations), then "query" for the resulting value. The same argument can be made for other purely declarative languages like Haskell where you "declare" your data structures as trees and "query" substitutions on those data structures.

> Declarative Programming is where you "declare" your data structures and "query" their state.

Don't worry if you're confused by the abstract language — it can take weeks to intuitively understand how purely declarative languages work. All you need to remember is that declarative code avoids mutating state in your program, subsequently avoiding side effects, and is therefore automatically idempotent and easier to debug.

#### Writing declarative code

You're not using a purely declarative language for your apps and scripts, but you can still apply declarative concepts to your code. These guidelines will make your code more declarative:

-   "Query" your data, putting as much logic as possible into expressions that reference your previously defined constants
-   "Declare" your data, by binding these query expressions to an immutable variable

This example PowerShell snippet for aggregating server request logs demonstrates these guidelines, never mutating state and maximizing the use of expressions.

![None](https://miro.medium.com/v2/resize:fit:700/1*QoxooV3lsM0Lgc8aJs2-bg.png)

An example PowerShell script that applies our declarative coding guidelines

Since we are "querying" instead of "executing a sequence of steps", our computation is inherently stateless and has no side-effects, so we can break down the problem into smaller and smaller unit-testable components without ever having to run a debugger.

### Declarative DevOps

Declarative DevOps is a specific case of Declarative Programming. With Declarative DevOps, we define the **desired state** of our configuration, then let the platform **set** the desired state, or "make it so".

> Declarative DevOps is where you "declare" the desired state of your configuration, then let the platform "make it so".

![None](https://miro.medium.com/v2/resize:fit:700/1*JB_08D1cZf39WYuc3Ue_tg.jpeg)

#### Skip the Intermediate States

While most scripts must account for any number of initial and intermediate states, with declarative configurations we only define the final "desired" state. Since we do not have to account for these other states in our program, we have significantly less code to debug.

Since we don't have to worry about intermediate states, we can guarantee that our code will be **idempotent**: it won't have different outcomes (like throwing an error) if you run it multiple times. With Declarative DevOps, you will never again have to manually rebuild your configuration if your deployment script fails halfway through — you will just rerun your declarative script. Since we don't have to implement idempotency ourselves, our code will also be cleaner because we won't have [WET](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself) `if` statements throughout our code, or use `-Force` and `-ErrorAction Ignore` to suppress all errors, even if some of the errors may (even in rare cases) be actionable.

#### Declare your Abstract Data Types

Declarative DevOps programs take as input a serialized [Abstract Data Type](https://en.wikipedia.org/wiki/List_of_data_structures#Abstract_data_types) — usually a set of "resources" that define the system — that we call a "configuration". Because they are abstract, they are highly extensible, and because they are schematized data types, they can be **statically verified** by validating the configuration against the schema, critical for [defensive DevOps code](https://medium.com/@cjkuech/defensive-powershell-with-validation-attributes-8e7303e179fd).

One common mistake when attempting to create declarative programs is using a [Composite Data Type](https://en.wikipedia.org/wiki/List_of_data_structures#Composite_types_or_non-primitive_type) as input instead of an [Abstract Data Type](https://en.wikipedia.org/wiki/List_of_data_structures#Abstract_data_types). Composite types are really just namespaced global constants, not really extensible data structures. While Composite Data Type configs are beneficial for compiled programs so you can change inputs without recompiling the program, these configs can actually add unnecessary abstraction to DevOps scripts (which don't require recompilation after code changes), and make small code modifications require multiple code changes.

![None](https://miro.medium.com/v2/resize:fit:700/1*rxjFMes4sCF_0CWXh7CYQQ.png)

These are configs for describing environments. The left requires many code changes if the data changes, but the right (while longer) better leverages Abstract Data Types to minimize code changes.

As you can see in the comparison above, our Abstract Data Type config on the right strictly uses Lists and Maps, while the config on the left is not so generic.

#### Popular Declarative DevOps systems

These are some of the most popular DevOps tools for defining desired states of infrastructure and platforms.

-   **Kubernetes/Helm charts** — Helm charts let you define the desired state of Kubernetes resources: Pod, ServiceAccounts, Containers, etc.
-   **[ARM](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authoring-templates)** **and** **[CloudFormation](https://aws.amazon.com/cloudformation/aws-cloudformation-templates/)** **templates** — ARM templates for Azure and CloudFormation templates for AWS let you define the desired state of Cloud resources: VMs, Storage Accounts, Load Balancers, etc.
-   **[PowerShell Desired State Configurations](https://docs.microsoft.com/en-us/powershell/dsc/overview/overview)** — DSCs let you define the desired state of resources within a compute context (physical server, VM, or Docker Container): File, Registry setting, Access Control List, etc.

### Next Steps

Start using a Declarative DevOps system and checking in the configurations to `git`, so you can achieve [Infrastructure as Code](https://en.wikipedia.org/wiki/Infrastructure_as_code).

#### Learn more about scaling your PowerShell

This article is part of [Declarative DevOps Microframeworks](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332) series of articles on managing PowerShell codebases at scale. Read the [rest of the series](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332) to learn more about designing and writing less code for large DevOps codebases.
