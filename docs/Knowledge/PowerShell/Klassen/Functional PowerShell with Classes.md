---
created: 2025-05-20T20:54:46 (UTC +02:00)
tags: [medium,paywall,medium.com,paywall breakthrough]
source: https://freedium.cfd/https://medium.com/@cjkuech/functional-powershell-with-classes-820c8e9acd8f
author: 
---

# Functional PowerShell with Classes | by Christopher Kuech | in FAUN — Developer Community 🐾 - Freedium

---
Object-Oriented Programming and [Functional Programming](https://medium.com/@cjkuech/functional-programming-in-powershell-876edde1aadb) paradigms may seem at odds with each other, but they are really just two language paradigms supported by PowerShell. Virtually all programming languages, functional or otherwise, have a means of extensibly binding names to values; Classes, like `struct`s or `record`s, are simply one approach to doing so. As long as we restrict our usage of Classes primarily to binding names and values and avoid heavy object-oriented programming concepts like inheritance, polymorphism, or mutability, we can leverage Classes without complicating our code. Further, by adding immutable type conversion methods, we can elevate our functional code with Classes.

### Casting magic

Casting is one of the most powerful features in PowerShell. When you cast a value, you can trigger abstracted initialization and validation code in your application. For example, just casting a string with `[xml]` will trigger code to parse the string into a complete xml tree. We can leverage classes to implement the same features in our own code.

#### Casting hashtables

If you don't have a constructor, you can cast hashtables to your class type without any modification to your class. Be sure to add [validation attributes](https://medium.com/@cjkuech/defensive-powershell-with-validation-attributes-8e7303e179fd) to fully leverage this pattern. We can also use custom types for the type of our class properties, to trigger even more validation and initialization logic.

Casting also enables cleaner output. Compare the output from an array of `Cluster` hashtables piped to `Format-Table`, versus casting those hashtables to `[Cluster]` before for piping to `Format-Table`. The properties are always listed in the order they are defined on the class. Be sure to include the `hidden`keyword before any properties that should not be visible when outputting the table.

![None](https://miro.medium.com/v2/resize:fit:700/1*ttXoyKLu39Is244BNz3Gwg.png)

#### Casting values

If you have a single-argument constructor, casting a value to your class type will pass the value to your single-argument constructor, where you can initialize your class instance.

#### Casting to string

You can also override the `[string] ToString()` method on the class to define the conversion logic for converting the object to a string, such as when including the object in string interpolation.

#### Casting serialized instances

Casting enables safe input from serialization formats. The examples below will fail if the data does not meet our specifications in `Cluster`.

### Casting in your Functional code

Functional programs define data structures first, then implement the program as a series of transformations upon the immutable data structures. While it may seem contradictory, classes, thanks to type conversion methods, actually facilitate functional code in PowerShell.

#### Is my PowerShell functional?

Many people coming from a C# or similar background write PowerShell that resembles C#. If you do this, you are not leveraging functional concepts and would probably benefit from doubling down on object-oriented programming in PowerShell or learning more about functional programming.

If you rely heavily on transforming immutable data using pipelines (`|`) , `Where-Object`, `ForEach-Object`, `Select-Object`, `Group-Object`, `Sort-Object`, etc, you have a more functional PowerShell style and will benefit from using PowerShell classes in a functional way.

#### Using classes functionally

Casting, though it uses different syntax, is just a mapping function between two domains. We can map values of an array in a pipeline using `ForEach-Object`.

In the example below, the `Node` constructor is run every time we cast to `Datum`, allowing us to abstract away a fair amount of code. As a result, our pipeline only focusses on declarative data querying and aggregation while our classes focus on data parsing and validation.

### Packaging the class for reuse

#### Nothing is as good as it seems

Unfortunately, classes cannot be exported from modules in the same way as functions or variables; however, there are some workarounds. Assuming your classes are defined in a file `./my-classes.ps1`:

-   You can dot-source the file containing the classes: `. ./my-classes.ps1`. This will execute `my-classes.ps1` in your current scope, defining all the classes in your file.
-   You can create a PowerShell module that exports all your user-facing cmdlets and set `ScriptsToProcess = "./my-classes.ps1"` in your module manifest file, which will similarly run `./my-classes.ps1` in your environment.

Whichever approach you take, keep in mind that the PowerShell type system cannot resolve types if they come from two separate places. Even though you have two identical classes with the same names and all the same properties, if they are loaded from two separate locations, you might find yourself facing confusing type issues.

#### The path forward

The best way to avoid type resolution issues is to never expose your classes to users. Rather than expect your user to import the class type, instead export a function from your module that abstracts away the need for directly accessing the class. For example, for `Cluster`, we would export a function `New-Cluster` that supports user-friendly parameter sets and returns a `Cluster`.

### Further Reading

-   [About Classes](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_classes)
-   [Defensive PowerShell](https://medium.com/@cjkuech/defensive-powershell-with-validation-attributes-8e7303e179fd)
-   [Functional Programming in PowerShell](https://medium.com/@cjkuech/functional-programming-in-powershell-876edde1aadb)
