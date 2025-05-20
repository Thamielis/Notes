---
created: 2025-05-20T20:51:36 (UTC +02:00)
tags: [medium,paywall,medium.com,paywall breakthrough]
source: https://freedium.cfd/https://medium.com/@cjkuech/new-to-powershell-use-classes-ab7b1e6f72ec
author: 
---

# New to PowerShell? Use Classes | by Christopher Kuech | in ITNEXT - Freedium

---
_Before you continue, learn the basic semantics of using and defining Classes:_ _[About Classes](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_classes)_

PowerShell has powerful but sometimes unintuitive programming features that can cause headaches for new users. These features make PowerShell the ideal candidate for almost any DevOps task, but often intimidate novice PowerShell devs into choosing substantially more cumbersome languages like C# or Python. By using Classes, new PowerShell developers can take their first steps into the PowerShell ecosystem without retreating from unwelcome surprises

### Classes are simpler than functions?

In most languages, functions are simpler than Classes. Static Classes are basically just ways to organize functions, but PowerShell already supports modules for organizing functions, so why would we want to use static Classes when we could use modules and functions?

![None](https://miro.medium.com/v2/resize:fit:700/1*qWqnobCV6iJx2IckfQctDg.png)

Equivalent implementations of a trivial function using static method vs a function

#### Simplified inputs

PowerShell functions are extremely powerful. With a few lines of parameter attributes, you can have a full featured command-line interface for your function. These interfaces are great for user-facing functions, but this user-facing presentation logic should not be kept with our core implementation logic.

Method inputs are much simpler, with each parameter being mandatory by default, and therefore can keep internal business logic simple. By isolating business logic, you can implement [unit tests](https://github.com/pester/Pester) around only your core business logic and lean on the declarative parameter validation for code hygiene on your presentational cmdlets.

#### Simplified outputs

One of the biggest surprises for people learning PowerShell is that `return` statements aren't the only statements that output a value from the function — every non-void expression writes a value to the output. In methods, only `return` statements output a value, making them easier to test, debug, and comprehend.

Methods also support simple return type declaration in the method headers, ensuring your function always returns the type you expect (or throws a type error).

### Graduation

So you've met your deadlines using static Classes, now you're comfortable with basic PowerShell semantics and you're read to take your scripts up a notch. Here's how you can grow next.

#### Dive into Functions

We avoided Functions because their approach to handling parameters and returns can be confusing, but once you learn the nuances of these features, they can dramatically elevate your code.

-   Learn about [Function Parameters](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_parameters) so you can quickly and declaratively make powerful command-line interfaces, or make your scripts more stable with parameter validations.
-   Stop thinking of outputs as singular values and think of them as a stream. Learn how to [redirect the stream](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_redirection) and operate upon it in a [pipeline](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_pipelines).

#### Take Classes to the next level

Classes aren't just for beginners. Learn to leverage advanced features, like implicit and explicit type conversion functions implemented through Classes, so you can [amplify your functional code with classes](https://medium.com/@cjkuech/functional-powershell-with-classes-820c8e9acd8f).
