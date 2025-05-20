---
created: 2025-05-20T20:47:30 (UTC +02:00)
tags: [medium,paywall,medium.com,paywall breakthrough]
source: https://freedium.cfd/https://medium.com/@cjkuech/writing-maintainable-powershell-503e5b680ed9
author: 
---

# Writing Maintainable PowerShell | by Christopher Kuech | in ITNEXT - Freedium

---
_Part 5 of_ _[Declarative DevOps Microframeworks](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332)_

PowerShell, more so than most languages, can be extremely difficult to manage in large code bases. While REST APIs and apps have standard design patterns you can follow, the same does not necessarily apply to DevOps codebases. As a result, many codebases lack strong separation between user-facing interfaces and internal logic, and subsequently grow hard to read and hard to maintain. We can leverage some common patterns from other languages to work _with_ (not against) PowerShell to keep large PowerShell codebases maintainable.

![None](https://miro.medium.com/v2/resize:fit:700/1*Z6H48s1Qxy2Inw_mLfmmOw.jpeg)

Big things are most easily managed in small pieces (Photo by [Raphael Koh](https://unsplash.com/@dreamevile?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText) on [Unsplash](https://unsplash.com/search/photos/modular?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText))

### MVC

[MVC](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) is a very common software engineering pattern for large user-facing applications, whether they are [ASP.NET websites](https://dotnet.microsoft.com/apps/aspnet/mvc) or iOS applications. MVC cleanly separates presentational logic from business logic by dividing application code into Models, Views, and Controllers. Just like graphical user interfaces, command-line interfaces can benefit from this same separation.

#### Models

Models are schematized data objects that represent the core structures of the application. They can be used for storing the state from business logic or contain business logic directly pertinent to the model. It can never contain presentational logic, other than perhaps a `ToString()` method.

In PowerShell, we typically define our models as classes. [Classes can make your code more intuitive](https://medium.com/@cjkuech/new-to-powershell-use-classes-ab7b1e6f72ec) and enable developers to [better group code directly related to their model](https://medium.com/@cjkuech/functional-powershell-with-classes-820c8e9acd8f). They also support [validation attributes](https://medium.com/@cjkuech/defensive-powershell-with-validation-attributes-8e7303e179fd), to help you minimize code.

#### Views

Views only contain code related to the presentation of models to the end user. In a GUI, a View might be a button, a page, a text editor, or any other user-facing UI element. Views can only receive and present models, or call the Controllers — they cannot update models directly.

In PowerShell, Views are Cmdlets. Cmdlets allow developers to [declaratively](https://medium.com/@cjkuech/defensive-powershell-with-validation-attributes-8e7303e179fd) define [expressive user-facing command line interfaces](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced_methods) for their functions and add support for features like the `-ErrorAction` parameter just by applying the `[CmdletBinding()]` attribute to their `Param` block. Views are the only cmdlets exported from our modules.

There are two categories of View cmdlets —

-   **Data Views** —A Data View outputs models. Classes cannot be cleanly exported from modules in PowerShell, so we need to use Data View functions to abstract any class constructor or static class method calls. Data Views should cleanly integrate with pipelines and if possible adhere to a [functional paradigm](https://medium.com/@cjkuech/functional-programming-in-powershell-876edde1aadb) and run without side effects to execution. In the example below, `Test-Node` is a Data View.
-   **User Views** — Rather than output values, a User View provides user-friendly formatted output to the user, such as with `Format-Table` or `Write-Host`. Even though `Write-Host` is generally forbidden by PSScriptAnalyzer, `Write-Host` is acceptable for use in User Views because User Views should only be run directly by users. Any interaction with the user, such as with `Read-Host` must be contained within a User View, as well as any progress indicators or other UI elements. In the example below, `Start-Troubleshooter` is a User View.

#### Controllers

To ensure presentational logic and business logic are cleanly separated, Views can never modify Models and can only interact with a Controller. The controller is the glue between Models and Views.

Views can be difficult to unit test because they are optimized for humans instead of computers and have many possible parameter combinations. If we cleanly separate out business logic into Controllers and Models with simpler interfaces, we can add unit tests to the Controllers and Models while relying primarily on the declarative validation attributes for minimizing bugs in our View code. We can also keep our Controller and Model code simpler by consolidating input validation to the Views and designing our Controllers to assume valid input from the Views.

In PowerShell, controllers are optimally defined as functions. To differentiate your View functions from your Controller functions, define your Controller functions with param lists (`function MyFunc([int]$x, [string]$y) {`) instead of `Param` blocks, and use PascalCase or camelCase for your Controllers to differentiate them from your Verb-Noun-named Views. The simpified interface of Controllers will force you to program [defensively](https://medium.com/@cjkuech/defensive-powershell-with-validation-attributes-8e7303e179fd) and validate input as early on as possible in your Views. Param lists will also force you to keep Controller interfaces as simple as possible to minimize the number of unit test cases required for test coverage of your Controller.

### Modules

Modules are a way of organizing code. Modules are imported once into your session (unless you use `-Force`), so you can avoid execution time lost to redeclaring code. Modules also allow you to store state in module-scoped variables. As such, modules are equivalent to static classes in purely object-oriented languages like C# and Java for managing code. [Putting your PowerShell in private modules](https://medium.com/@cjkuech/private-powershell-modules-76f51a1bf893) will force you to break up your code into more manageable pieces, which can also push you to beneficially abstract your code into [microframeworks](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332), as well as ensure your code has a well-defined interface. As a result, modules have a few solid advantages —

#### Testable

Modules have a well-defined interface of exported cmdlets. Interfaces can be easily maintained and validated with Pester tests. In contrast, equivalent code implemented without a module does not maintain a strict interface and will inevitably begin to intertwine with the rest of the codebase, making it difficult to test due to hard-to-reproduce state required to run the function, and difficult-to-validate side effects as a result of running the function.

#### Portable

Modules are isolated from the rest of your code base, ensuring [separation of concerns](https://en.wikipedia.org/wiki/Separation_of_concerns). As a result, they can be [portably copied and used elsewhere](https://medium.com/@cjkuech/private-powershell-modules-76f51a1bf893) in your systems. Modules can also be cleanly replaced as your codebase evolves — modules force you to create a well-defined interface for your singly concerned code, so if you ever need to remove it, you know exactly how to replace it.

#### Better than Scripts

Modules also enable import by name, so you can avoid hard-coding relative paths: `Import-Module MyModule`. In contrast, scripts must be invoked with `&"$PSScriptRoot\path\to\MyScript.ps1"`, coupling the script to its relative path.

Scripts that take user input must use `Param` blocks as the first code in the script, prohibiting the declaration of `enum`s or other types that might simplify parameters for the script. They are also inefficient if run multiple times, as any helper function or other constant value defined inside must be redefined every time the script is run. One might be tempted to implement the code below as a single `Get-BadNode` script, but then `$someDynamicSetting` and `myHelperFunction` would be initialized on every invocation, unnecessarily hurting performance; in addition, the script implementation of `Get-BadNode` could not support using the `enum` to aid with tab-complete values to the `-Values` parameter.

### Next Steps

Begin applying these concepts to your own codebase —

-   Decompose your large scripts into business logic and presentational logic.
-   Decompose your groupings of scripts into modules with well-defined interfaces. Unit test these interfaces.
-   Identify areas of your code that are difficult to test or frequently require manual testing, separate their difficult-to-test interface from its core, and add unit tests around the core.
-   Consider how to make your presentational View cmdlets more user-friendly.
-   Start modularizing your code into [Declarative DevOps Microframeworks](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332).
