## Multipart series on writing less DevOps code

Declarative DevOps Microframeworks is the most robust, portable, and scalable pattern for managing your DevOps systems. This series will help you understand the concepts behind Declarative DevOps Microframeworks, then walk you through implementing some common use cases in the most DevOps-friendly language: PowerShell.

![](https://miro.medium.com/max/700/1*zNBy1zL3OXhmGcWm1Q2jMw.png)

## Concepts

First, learn about Declarative DevOps systems, the Microframeworks pattern, and how to package a DevOps microframework.

## Functional Programming in PowerShell

Functional Programming is closely related to Declarative Programming and very beneficial for idiomatic PowerShell code. This article is beyond the scope of this series, but most of the articles in this series either implicitly or explicitly reference the concepts outlined in [Functional Programming in PowerShell][1].

Read [**Functional Programming in PowerShell**][2].

## Declarative DevOps

Declarative DevOps is a rapidly growing trend. Learn how Declarative Programming has influenced DevOps, what constitutes a Declarative config file, and where you can start using Declarative DevOps tools today.

Read [**Declarative DevOps**][3].

## DevOps Microframeworks

Microframeworks are small frameworks that adhere to [Separation of Concerns][4]. Rather solving all your problems, a microframework only solves one of your problems, helping you avoid locking yourself into a specific technology. Learn why microframeworks are especially beneficial for DevOps.

Read [**DevOps Microframeworks**][5].

## Writing Maintainable PowerShell

PowerShell lacks defacto patterns for managing large codebases and more often than not evolves into a massive untestable tangle. We will explore best practices for dividing large codebases into [singly responsible][6] modules, as well as further dividing the code in those modules according to a PowerShell-specific adaptation of the MVC design pattern.

Read [**Writing Maintainable PowerShell**][7].

## Private PowerShell Modules

PowerShell modules are the easiest way to package and deploy your DevOps Microframeworks. Before you learn how to write your microframeworks, learn how to package and consume them.

Read [**Private PowerShell Modules**][8].

## Application

Learn how to apply the concepts behind Declarative DevOps Microframeworks with these walkthroughs of practical use cases for Declarative DevOps Microframeworks.

## Declarative Configuration Management

Configuration management can be either extremely difficult or extremely simple. This walkthrough will show you how thoughtfully posing the problem can help you solve configuration management in only a few lines of PowerShell.

Read [**Declarative Configuration Management**][9].

## Declarative Idempotency

Idempotency is extremely pertinent to DevOps, as errors in DevOps code can easily cause system outages. Idempotency can add a lot of redundant code to your codebase. Learn how to factor out your idempotency code into a Declarative DevOps Microframework.

Read [**Declarative Idempotency**][10].

## Declarative Work-Item Management

Your processes should make your team more agile, not cause daily toil. This guide walks through creating a microframework for declaratively managing work items as code annotations instead of manually updating work items in Azure Boards or Jira.

Read [**Declarative Work-Item Management**][11].

[1]: https://medium.com/@cjkuech/functional-programming-in-powershell-876edde1aadb
[2]: https://medium.com/@cjkuech/functional-programming-in-powershell-876edde1aadb
[3]: https://medium.com/@cjkuech/declarative-devops-30788ddd43cd
[4]: https://en.wikipedia.org/wiki/Separation_of_concerns
[5]: https://medium.com/@cjkuech/devops-microframeworks-715b882b979c
[6]: https://en.wikipedia.org/wiki/Single_responsibility_principle
[7]: https://medium.com/@cjkuech/writing-maintainable-powershell-503e5b680ed9
[8]: https://medium.com/@cjkuech/private-powershell-modules-76f51a1bf893
[9]: https://medium.com/@cjkuech/declarative-configuration-management-daec4007bb77
[10]: https://medium.com/@cjkuech/declarative-idempotency-aaa07c6dd9a0
[11]: https://medium.com/@cjkuech/automating-work-item-management-fd9add6351d0