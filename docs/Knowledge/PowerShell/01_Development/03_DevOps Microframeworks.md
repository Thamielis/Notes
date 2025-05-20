---
created: 2025-05-20T20:46:14 (UTC +02:00)
tags: [medium,paywall,medium.com,paywall breakthrough]
source: https://freedium.cfd/https://medium.com/@cjkuech/devops-microframeworks-715b882b979c
author: 
---

# DevOps Microframeworks | by Christopher Kuech | in The Startup - Freedium

---
_Part 3 of_ _[Declarative DevOps Microframeworks](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332)_

DevOps and Microframeworks are two words that I have yet to find paired together on the internet. DevOps teams, however, find themselves needing to implement custom code more often than most domains. DevOps Microframeworks help manage the inevitability and complexity of writing custom DevOps code.

![None](https://miro.medium.com/v2/resize:fit:700/1*oZXmY8cSXYGvImmJe4x2Dg.jpeg)

If a sorry craftsman blames his tools, a resourceful craftsman knows when and how to build the right tool. (Photo by [Barn Images](https://unsplash.com/@barnimages?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/search/photos/config-file?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText))

### Custom code is unavoidable

[Conway's Law](https://en.wikipedia.org/wiki/Conway%27s_law) states,

> organizations which design systems … are constrained to produce designs which are copies of the communication [structures](https://en.wikipedia.org/wiki/Organizational_structure "Organizational structure") of these organizations. — M. Conway

For our purposes, Conway's Law states that there can never be a one-size-fits-all solution for software because every company has different team structures and processes. There will always be a need to write custom code to solve a problem because no two teams will ever be solving the same problem in the same context.

DevOps sits at the intersection between release management processes, software development processes, safe deployment processes, and more. As such, there is perhaps no better proof of Conway's Law than a DevOps team trying to create their own processes while satisfying these other teams' processes. Good luck trying to find a DevOps-as-a-Service offering that meets your team's unique requirements — you're often better off writing some concise custom code to solve your team's problems.

### Microframeworks keep custom code manageable

A **microframework** is a framework that adheres to the [single responsibility principle](https://en.wikipedia.org/wiki/Single_responsibility_principle). A (macro)framework solves every aspect of a job; for example, the [aspnet](https://dotnet.microsoft.com/apps/aspnet) web development framework is the only framework you need to build a complete and resilient web service. In contrast, a microframework only solves a single task; for example, the [flask](http://flask.pocoo.org/docs/1.0/) web development microframework only helps implement routing for a web service.

> A **microframework** is a framework that adheres to the [single responsibility principle](https://en.wikipedia.org/wiki/Single_responsibility_principle)

Microframeworks are extremely understated in the DevOps community. Conway's Law is more pertinent to DevOps than most domains, so there is a significant need to write custom code. DevOps teams have a breadth of responsibilities, so ensuring the modular portability of custom code is extremely important. DevOps code is largely shell command [glue code](https://en.wikipedia.org/wiki/Glue_code), file movement/manipulation, command-line interface creation, etc., so it is extremely easy to write DevOps microframeworks if you use a language that natively supports all of these features (i.e. PowerShell).

### How to get started.

**[Declarative DevOps Microframeworks](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332)** provides a complete list of articles and guides for understanding the concepts behind [Declarative DevOps Microframeworks](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332), as well as tutorials on designing and implementing your own [Declarative DevOps Microframeworks](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332) for practical DevOps use cases.
