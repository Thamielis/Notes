---
created: 2025-05-20T20:49:52 (UTC +02:00)
tags: [medium,paywall,medium.com,paywall breakthrough]
source: https://freedium.cfd/https://medium.com/@cjkuech/declarative-idempotency-aaa07c6dd9a0
author: 
---

# Declarative Idempotency | by Christopher Kuech | in ITNEXT - Freedium

---
_Part 7 of_ _[Declarative DevOps Microframeworks](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332)_

A script is **idempotent** when it can be run multiple times without different outcomes or errors. In DevOps, we frequently describe complex systems then set them to their desired state. The components of the system may be in various states, so it is important that our scripts are idempotent and do not assume the system's initial configuration.

To obtain idempotency, developers typically apply one of a few patterns —

-   Teardown and rebuild, common in imperative scripts that only handle a single starting configuration.
-   Repetitive `if` / `else` blocks that check if the resource is in the desired state before setting it.
-   `-Force` params to silence errors if the resource is already in the desired state.
-   Declarative frameworks, where you define the desired state then let the framework worry about the initial and intermediary states.

Declarative frameworks are by far the best option; however, there are none generic enough to solve idempotency of arbitrary code in our PowerShell scripts. We will implement our own [Declarative DevOps Microframework](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332) to add declarative idempotence support to PowerShell and automatically enforce all code to be idempotent, validated, and consistently logged.

![None](https://miro.medium.com/v2/resize:fit:700/0*trL6xWvZvHkxucsM)

Elevator buttons are idempotent. Hitting the "3" button in an elevator will always set the elevator to go to floor 3, regardless of how many times the button is pressed.

### Improving on Desired State Configurations

PowerShell already comes with a declarative idempotency framework: Desired State Configurations. So why would we want to write our own?

#### The Good

Desired State Configurations are a PowerShell language construct for configuring complex systems. They provide a variety of benefits valuable to DevOps —

-   **Declarative**, so you define how you want your configuration to look, not how to implement your configuration
-   **Idempotent**, so you can apply valid configurations as many times as necessary without error
-   **Statically verified** during compilation, so you catch as many errors as possible before applying your configuration
-   **Integrated with logging**, so we know if, where, and why our configuration failed
-   **Self-healing,** running periodically to reapply drifted configurations

#### The Bad

DSC is really only designed to help a fleet of Windows Server nodes asynchronously maintain desired state. Unfortunately, DSC's asynchronous execution model and reliance on Windows OS rules it out for many otherwise perfect DevOps scenarios, such as —

-   Command-line interfaces
-   CI/CD scripts
-   Dockerfiles
-   Linux

#### Learning from DSC

DSC provides a decent library of Resources, but complex logic always ends up in `Script` resources, which define a "Test" `scriptblock` and a "Set" `scriptblock`. An ideal framework would steal this pattern (and perhaps even steal the library of resources) to enable declaratively defining resources then idempotently setting the resources to their desired state; unlike DSC this ideal framework would run synchronously so that errors propagate to the host and output is cleanly logged.

![None](https://miro.medium.com/v2/resize:fit:700/0*x5bJqGrUAHtZLHGn.jpg)

### Designing a Declarative Idempotency framework

To design our Declarative Idempotency framework, we will define a system in terms of a set of "requirements" that must be met for the system to be in its desired state. We will then write an engine for idempotently setting the requirements into their desired state and outputting events for observing the execution of the engine — we can then format the events using native `Format-*` or even `Export-Csv` cmdlets.

#### Declaring Requirements

A "requirement" is an atomic component of the system. It consists of an individual condition that a system must meet or a prerequisite of another requirement. Common requirements include setting the content of a file, setting an environment variable, placing a binary, or installing a certificate.

A requirement, in its simplest form, can be defined by —

-   A **Name**, for identifying the component in logging.
-   A **Test** condition, that tests whether the system is in the desired state for the configuration.
-   A **Set** condition, for modifying the system to be in the desired state for the configuration.
-   A set of **dependencies**, other requirements that must be in their desired state prior to this requirement applying itself. Rather than implement this (DSC's approach), we will assume Requirements are declared in topological order of their dependency graph.

We will define a `Requirement` as a [PowerShell class](https://medium.com/@cjkuech/functional-powershell-with-classes-820c8e9acd8f) containing these properties.

#### The Requirement Engine

In the snippet above, we have an array of `Requirements` that we now need to set in their desired states. We will write a cmdlet `Invoke-Requirement` to do this work for us. We will use the `Test` condition to determine whether to run the `Set` condition. Unlike DSC, we will run the `Test` condition again to [validate and fail fast](https://medium.com/@cjkuech/defensive-powershell-with-validation-attributes-8e7303e179fd).

#### Weaving with Logging

The solution above is already valuable; however, we can improve it with some logging. We want our logging to be extensible and idiomatic, so we will implement it [functionally](https://medium.com/@cjkuech/functional-programming-in-powershell-876edde1aadb) by returning `RequirementEvent` objects that we can then format with existing cmdlets (`Format-Table`, `Format-List`) or more domain-specific formatters that we implement ourselves.

Now we can pipe our engine logs to a formatter —

Which will cleanly output —

We now have verbose logging at the framework level — we no longer have to rely on engineers to maintain consistent logging. This highlights the true value of [Requirements](https://github.com/microsoft/Requirements) and its underlying [declarative](https://medium.com/@cjkuech/declarative-devops-30788ddd43cd) methodology: rather than relying on conventions, code review, and manually enforced style guides, our declarative solution forces engineers to write consistently logged and validated code.

> a declarative solution forces engineers to write consistently logged and validated code

### The Complete Solution

[`Requirements`](https://github.com/microsoft/Requirements) PowerShell Gallery module provides a complete and more robust implementation of this Declarative Idempotency microframework. Documentation is available on its GitHub site —

> [https://github.com/microsoft/requirements](https://github.com/microsoft/Requirements)

`Requirements` provides multiple interfaces for defining and running `Requirement`s, support for dependency graph execution, support for DSC resources, and includes specialized log formatting cmdlets.

#### Log Formatting

`Requirements` introduces two cmdlets for formatting the `RequirementEvent`s streamed from the engine—

-   `Format-Checklist` — simulates checking off requirements as they are completed, ideal for CLIs and other human-initiated scripts.

![None](https://miro.medium.com/v2/resize:fit:700/1*IelsVq1KpPm6iYLljtcyXQ.png)

Real-time feedback by piping to `Format-Checklist`

-   `Format-Callstack` — logs every event to the output stream, ideal for running in headless environments like CI/CD scripts and Docker container builds.

![None](https://miro.medium.com/v2/resize:fit:700/1*J0n7NxFWwlOM3jwRXVoUEw.png)

Verbose logging by piping to Format-Callstack

#### DSC Support

`New-Requirement` supports referencing a DSC resource, so you can use DSC resources in our synchronous Requirements engine. This allows you to leverage the vast library of declarative DSC resources without committing to the full DSC stack.

![None](https://miro.medium.com/v2/resize:fit:700/1*fb7SwwDxeEv4tPEUOOG6CQ.png)

Using a DSC resource with Requirements

Unfortunately, DSC is not very cross-platform friendly, so this scenario is only supported in PowerShell 5.

### Next Steps

#### Learn more about scaling your PowerShell

This article is part of [Declarative DevOps Microframeworks](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332) series of articles on managing PowerShell codebases at scale. Read the [rest of the series](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332) to learn more about designing and writing less code for large DevOps codebases.
