# Functional Programming in PowerShell

> Clean, concise PowerShell using functional abstractions

Clean, concise PowerShell using functional abstractions
-------------------------------------------------------

_Part 1 of_ [_Declarative DevOps Microframeworks_](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332)

PowerShell isn’t a purely functional language, but PowerShell very elegantly integrates some functional concepts into its semantics. By leveraging Functional Programming concepts in PowerShell, you will be able to spend more time writing clean idiomatic PowerShell and less time reverse engineering your scripts.

![](https://miro.medium.com/max/700/1*1BnG6d85EIKlzk80-He7QA.jpeg)

Improve the flow of your programs by applying Functional Programming patterns

Functional Programming is often contrasted to Imperative Programming. Functional Programming encourages maintaining logic in functions that the interpreter evaluates, while Imperative Programming encourages maintaining logic as a sequence of statements that the interpreter evaluates. The difference between these two paradigms results in differing patterns, benefits, and performance considerations.

Patterns
--------

Functional Programming style encourages several patterns that can be implemented in PowerShell, such as —

*   **Pure functions**, where the function is solely dependent on its input and therefore always has the same output. For example, `square` is a pure function, as the output is solely in terms of `$x`.

comparison of impure functions vs pure functions

*   **Declarative style**, that maximizes the use of expressions and minimizes the use of statements. For example, this imperative `if` / `else` block can be simplified to a single declarative expression.

comparison of imperative code vs declarative code

*   **Recursion**, where a function calls itself instead of relying on `for` or `foreach`. Recursion can simplify code when handling recursive data structures — data structures with properties of the same type as themselves — such as in the case of a tree traversal function, where the function can be applied to the root node of the tree, the left node property of the node, and the right node property of the node equivalently, instead of iterating through each node in the tree with a Stack (depth-first traversal) or Queue (breadth-first traversal). You can compare the iterative depth-first traversal with the recursive depth-first traversal below, or read [Deep Equality with Pester](https://medium.com/@cjkuech/deep-equality-with-pester-a9a00c3cd8a1) to see a real-world application of recursion in PowerShell.

comparison of iterative code vs recursive code

*   **Immutability**, where data is never modified and is instead duplicated with the modification made to the duplicate. Immutability helps avoid shared state in different parts of your script and therefore minimize debugging. Value types (numbers, strings, booleans) are always immutable, but arrays, objects, and hashtables are mutable. For objects made from custom classes, you can [leverage PowerShell’s type conversion constructs](https://medium.com/@cjkuech/functional-powershell-with-classes-820c8e9acd8f) to make your classes more functional. You can generally treat mutable types as immutable types by adhering to the [copy on write](https://en.wikipedia.org/wiki/Copy-on-write) convention, where you only clone the data and modify it for write operations, but read operations occur without cloning.

implementation of functions for immutably reading and writing from a hashtable

*   **Higher-order functions**, where functions receive a function as a parameter or return a function. Higher-order functions keep code simple to write and debug. These are discussed in detail later.
*   **Data-first design**, where you first consider what data you have and what data you want, then apply higher-order functions to transform your data into the form you desire. In contrast, object-oriented design focuses on the functions first (method interfaces) and defines the data (classes) later.
*   **Monads**, where side-effects like state modification and errors are encoded in the return type of a function to keep the function pure. These are discussed in detail later.

Benefits
--------

Adhering to functional patterns will provide some strong benefits —

*   **Stateless**— if you keep your logic in pure functions and maintain immutability, you will avoid side-effects (like modifying the state of variables or using temporary files) in your code. Side effects are much harder to unit test and debug than pure functions and immutable code. If your code does not contain side effects, it will also be **idempotent**, so you will not face unwelcome surprises when executing your code multiple times.

> Side effects are much harder to unit test and debug than pure functions and immutable code

*   **Clean abstractions**—Higher-order function abstractions allow for better separation of concerns, as you separate the “what” from the “how”. Implementing your logic modularly and generically allows you to write simple test cases for your generic implementation while actually calling more complex implementations.

Performance
-----------

People often avoid functional style because of performance concerns over adding otherwise unnecessary function calls; however, considering PowerShell scripts often contain network calls and other much longer operations, the performance hit is negligible.

In cases where performance is a consideration, specifically processing large arrays of data. PowerShell’s native pipeline processing functions that support functional patterns (`ForEach-Object`, `Where-Object`, etc.) are more optimized than equivalent custom PowerShell implementations that might require multiple iterations over the array or manually generating an array with concatenation.

PowerShell supports [first-class functions](https://en.wikipedia.org/wiki/First-class_function), which means you can assign functions to variables, pass them as parameters, and ultimately use functions as you would objects or primitive values. `ScriptBlock`s are PowerShell’s first-class functions. First-class functions are essential to functional style because they facilitate quick function definitions.

Defining ScriptBlocks
---------------------

A `ScriptBlock` consists of an optional `Param` definition and a series of statements, all wrapped in curly braces. Because `ScriptBlock`s are first-class functions, you can assign the expression to a variable.

Addition function implemented as a scriptblock

You may find this syntax a little verbose when compared to defining a function. You can equivalently access the `ScriptBlock` from the function with the `$function:<function-name>` syntax.

Deriving a scriptblock from a function

You can turn any script into a `ScriptBlock` and serialize the `ScriptBlock` back to a script.

Creating a scriptblock from a script file

Invoking ScriptBlocks
---------------------

You can invoke your `ScriptBlock` with write access to variables in your current scope using `.` or without write access to your current scope using `&`.

Comparison of the two ways to invoke a scriptblock

When defining a `ScriptBlock`, you may want to reference variables in the parent scope. Unfortunately, if you invoke the `ScriptBlock` somewhere without access to that scope, or if the value of the variable unexpectedly changes, your script will error. In this case, you can capture the current value of the variable in a closure to ensure it always references the expected value.

Capturing values from the parent scope with a closure

A [higher-order function](https://en.wikipedia.org/wiki/Higher-order_function) is a function that either receives a function as a parameter or returns a function. PowerShell supports a variety of higher-order functions, usually implemented using PowerShell `filter` functions. Using these higher-order functions can greatly simplify your code and even improve the performance of your code on large datasets.

Filter functions
----------------

Idiomatic PowerShell encourages the use of `filter` functions. `filter` functions are a convenient way of creating a function that accepts pipeline input and consists solely of a `process` block.

Example of a filter function

`filter` functions and `process` blocks are more optimized than manually looping through an array, so use them whenever possible.

Filter functions used directly in a pipeline, as in the previous example, are not actually common. The more idiomatic and common solution is to use filter functions as parameters to higher-order functions, as we will see in the next section.

[Map](https://en.wikipedia.org/wiki/Map_(higher-order_function))
----------------------------------------------------------------

`ForEach-Object` is the PowerShell implementation of the [Map higher-order function](https://en.wikipedia.org/wiki/Map_(higher-order_function)), which takes a mapping function and transforms each item in a list using the mapping function. A `filter` invoked directly in a pipeline is also a Map higher-order function; note that a `filter` is not a [filter higher-order function](https://en.wikipedia.org/wiki/Filter_(higher-order_function)).

`filter` functions are most often used as `scriptblock`\-literals when calling`ForEach-Object` . This scenario is so common that `ForEach-Object` has a single-character alias: `%`.

Comparison of filter vs ForEach-Object

Often, you will simply want to map all elements to one of their properties. `ForEach-Object` allows you to provide the property name instead of a `filter` `scriptblock`.

Simplifying mapping functions to a single getter property

[Filter](https://en.wikipedia.org/wiki/Filter_(higher-order_function))
----------------------------------------------------------------------

A [filter higher-order function](https://en.wikipedia.org/wiki/Filter_(higher-order_function)) is a function that takes as argument a “predicate” — a function that returns `true` or `false` for a given item. The predicate is applied to each item in the input list to determine if the value should be added to the output list.

`Where-Object` is PowerShell’s Filter implementation.`Where-Object` applies a `filter` function to each value in the pipeline, writing the value to output if the `filter` function returns a truthy value. It is so useful that it has a single character alias: `?`.

Example of Where-Object — PowerShell’s “filter” higher-order function

Group-Object
------------

`Group-Object` is a higher-order PowerShell function that uses its passed-in `filter` function to generate an aggregation key for the object. It aggregates elements in the pipeline into group objects by the aggregation key. A group object contains a `Name` property containing the aggregation key, a `Group` property containing all the objects with that key, and a `Count` property describing the size of the `Group` property array.

Example of Group-Object

Sort-Object
-----------

`Sort-Object` is a higher-order PowerShell function that uses its passed-in `filter` function to generate a sorting key for the object. It sorts the array by the sorting key. Like the other native higher-order PowerShell functions, `Sort-Object` can accept a property in place of an equivalent `scriptblock`.

Example of Sort-Object

[Compress](https://en.wikipedia.org/wiki/Fold_(higher-order_function))
----------------------------------------------------------------------

The [Compress higher-order function](https://en.wikipedia.org/wiki/Fold_(higher-order_function)), (a.k.a. `reduce`, `fold`, …) takes as argument a reducer function and a list and returns a list. The reducer function takes two arguments — an accumulator and a list item — and returns a new accumulator value, that is immediately passed along with the next item in the list to the reducer function.

Example of Compress-Object from “functional” module

Compress is probably the most difficult higher-order function to conceptualize, but it is the most important list processing higher-order function because all other list processing higher-order functions can be implemented using Compress.

Any higher-order list processing function can be implemented with Compress-Object

All the previous functions we have discussed use PowerShell `filter` functions, which are single-parameter functions that receive their single parameter as `$_`. Compress is different and requires a two-parameter function, with parameters bound as `$a`and `$b`. If your function accesses values other than `$a` and `$b`, you often need to explicitly declare the params with `Param($a, $b)` to tell the higher-order function to provide access to the parent scope.

Implicit arguments vs explicit arguments when invoking Compress-Object

`Compress-Object` is not a native PowerShell function. It is published in the `functional` PowerShell Gallery module, along with other PowerShell functions for facilitating Functional Programming style in PowerShell. You can find more information about the module on [GitHub](https://github.com/chriskuech/functional).

Function Composition
--------------------

[**Function composition**](https://en.wikipedia.org/wiki/Function_composition_(computer_science)) allows you to wrap multiple chained function calls into a single function. For example, if we are adhering to a data-first Functional Programming style, we will often find ourselves with many sequentially applied mapping functions to convert our data to other forms without side effects. For convenience, we could wrap these functions in a single function.

A naive attempt at function composition

This implementation is not ideal because while we are applying sequential steps (`aToB`, `bToC`, `cToD`), we are calling them in reverse order (`cToD`, `bToC`, `aToB`) and balancing the parenthesis to compensate. We can avoid this by using a higher-order compose function, such as the `Merge-ScriptBlock` function from `functional`.

Using Merge-ScriptBlock from “functional” module to compose functions

`Merge-ScriptBlock` will give you a reusable function, but if you do not need a reusable function and simply need to compose functions once within an expression, you can apply a similar pattern with `ForEach-Object`.

Composing functions ad-hoc with pipelines

As we learned earlier, Imperative Programming pattern consists of a sequence of steps, which has some drawbacks. This pipeline pattern allows you to implement a sequence of pipelined steps without having any side effects or confusing flow — the main drawbacks of Imperative Programming. It’s easy to see why this pattern is so prevalent in PowerShell.

Callbacks
---------

While most PowerShell commands are synchronous, meaning the PowerShell interpreter waits for the previous command to complete before starting the next command, an asynchronous action is an action that is invoked without waiting for the action to complete before proceeding to the next step. In PowerShell, asynchronous actions are `Job`s: `scriptblock`s that run in a separate process.

`Job`s are typically created using the `Start-Job` higher-order function that takes as a parameter the function to execute, then executes that function asynchronously, returning a `Job` object for controlling the lifecycle of the function execution.

Creating a Job asynchronously

If a function is executed asynchronously, we will not know when the function completes. So what happens if we want to execute another command after the function completes? We can use a [callback](https://en.wikipedia.org/wiki/Callback_(computer_programming)) function to execute some logic after our original action completes.

We can abstract this into a higher-order function.

Create a job with callback

While this pattern is common in some other languages, PowerShell allows you to resynchronize `Job`s, so it’s much more idiomatic to simply interact with the `Job`.

Synchronizing jobs

Still, using callbacks can help you avoid “[writing everything twice](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself)”; for example, if you want to run the same callback after every action.

A practical example of using a callback in PowerShell

With a functional paradigm, we try to avoid side-effects like throwing an error or modifying a local variable. PowerShell allows us to isolate imperative code with `scriptblock`s and handle errors functionally with a monad.

Containing the Problem
----------------------

Sometimes you cannot initialize a variable without using mutable or local variables. In that case, you can isolate the initialization code by defining it in a`scriptblock` and invoking the `scriptblock` with `&` to ensure the `scriptblock` only has read access to the parent scope.

Containing imperative code in functional code

Monads
------

One of the most common program side-effects is throwing an error. For example, while the division function seems like a pure function, it actually can have side-effects (i.e. throwing an exception) if the denominator is `0`.

A seemingly pure function can still have unexpected side effects

We want to write [defensive PowerShell](https://medium.com/@cjkuech/defensive-powershell-with-validation-attributes-8e7303e179fd) code and throw errors as early as possible if we detect that our program may reach a bad state; as such, we always set `$ErrorActionPreference = "Stop"` at the top of our scripts to direct the interpreter to throw any error the interpreter encounters.

Often, we want to handle an error and proceed conditionally based on if an error occurs or depending on some property of the error. Traditionally, we use `try` / `catch` / `finally` to enable this conditional control flow.

Imperative error handling

`try` / `catch` / `finally` is a sequence of control-flow statements and therefore imperative. As an alternative, PowerShell allows you to return a **monad** from your function instead of throwing an error. A monad is a method of maintaining state in purely functional code by passing state around as an object. This specific monad is the `Nullable[T]` monad — the monad’s value will either be `$null` or of type `T`. (Note that the `[T]` is the PowerShell syntax for indicating that `Nullable` is a [parametric type](https://en.wikipedia.org/wiki/Parametric_polymorphism) with parameter `T`). A `$null` value of the monad indicates that the function encountered an error, while a monad value of type `T` indicates that the function did not encounter an error.

> A monad is a method of maintaining state in purely functional code by passing state around as an object.

In PowerShell, the default `ErrorActionPreference` is `Continue`, so if a function encounters a [non-terminating error](https://github.com/MicrosoftDocs/PowerShell-Docs/issues/1583), it should return the `Nullable` monad and write the error to the error stream, but continue to the next statement. As mentioned above, we typically apply [defensive PowerShell](https://medium.com/@cjkuech/defensive-powershell-with-validation-attributes-8e7303e179fd) principles and set `ErrorActionPreference` to `Stop`, which directs our functions to throw an error and not continue to the next statement, not continuing to the `return` statement and therefore not throwing an error. This is good default behavior, but if we want to catch the error with functional code, we can direct the cmdlet to return the `Nullable` monad by appending `-ErrorAction SilentlyContinue` to the parameters. We can enable this behavior in our own functions by converting our functions into cmdlets with the `CmdletBinding` attribute.

Imperative error handling with try/catch vs Functional error handling with a monad

Bear in mind that not all errors can be handled with `ErrorAction` settings and that there are still occasional cases where you will find you need `try` / `catch` to handle the error (at least [for now](https://github.com/PowerShell/PowerShell/issues/7774)).

Play with “functional”
----------------------

Start applying Functional Programming style to your code! Install the [functional](https://github.com/chriskuech/functional) PowerShell module to get all the higher-order functions described above that are not installed with PowerShell.

Ad-hoc querying with higher-order functions
-------------------------------------------

Take advantage of `Export-Csv` and `Import-Csv` to store information about your systems and ad-hoc query them with the higher-order functions for practice whenever possible. PowerShell is invaluable for collecting and serializing data about systems — if you can start querying and aggregating this data with higher-order functions, you will be able to prescribe more compelling data-driven solutions to your issues.

Learn more PowerShell functional programming techniques
-------------------------------------------------------

You can also begin applying other advanced functional PowerShell concepts like [type checking and custom type conversion functions](https://medium.com/@cjkuech/functional-powershell-with-classes-820c8e9acd8f).

Learn more about scaling your PowerShell
----------------------------------------

This article is part of [Declarative DevOps Microframeworks](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332) series of articles on managing PowerShell codebases at scale. Read the [rest of the series](https://medium.com/@cjkuech/declarative-devops-microframeworks-9908c8d05332) to learn more about designing and writing less code for large DevOps codebases.


[Source](https://medium.com/swlh/functional-programming-in-powershell-876edde1aadb)