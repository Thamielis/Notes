---
created: 2022-03-10T13:10:50 (UTC +01:00)
tags: []
source: https://adamtheautomator.com/powershell-where-object/
author: 
---

# How to Use PowerShell Where-Object to Filter All the Things

> ## Excerpt
> The PowerShell Where-Object cmdlet is one of the most common and useful cmdlets to filter objects. Learn how to use it to it's fullest potential.

---
When you work with PowerShell property values in a collection of objects, sometimes you will need a way to _filter_ out all the things you do not need. Knowing how to use the PowerShell `Where-Object` cmdlet is an important skill to have in your PowerShell toolbox.

The `Where-Object` cmdlet is a handy way to filter objects. In this tutorial, you will learn different ways to construct a `Where-Object` command, it’s available parameters, syntax, as well as how to use multiple conditions like a pro!

-   [Prerequisites](https://adamtheautomator.com/powershell-where-object/#Prerequisites "Prerequisites")
-   [Understanding How PowerShell Where-Object Works](https://adamtheautomator.com/powershell-where-object/#Understanding_How_PowerShell_Where-Object_Works "Understanding How PowerShell Where-Object Works")
    -   [Creating Filter Conditions with Scriptblocks](https://adamtheautomator.com/powershell-where-object/#Creating_Filter_Conditions_with_Scriptblocks "Creating Filter Conditions with Scriptblocks")
    -   [Comparison Statements](https://adamtheautomator.com/powershell-where-object/#Comparison_Statements "Comparison Statements")
-   [Filtering Basics](https://adamtheautomator.com/powershell-where-object/#Filtering_Basics "Filtering Basics")
    -   [Containment Operators](https://adamtheautomator.com/powershell-where-object/#Containment_Operators "Containment Operators")
    -   [Matching Operators](https://adamtheautomator.com/powershell-where-object/#Matching_Operators "Matching Operators")
    -   [Equality Operators](https://adamtheautomator.com/powershell-where-object/#Equality_Operators "Equality Operators")
-   [Next Steps](https://adamtheautomator.com/powershell-where-object/#Next_Steps "Next Steps")

## Prerequisites

There is only one prerequisite for this article. You should have some basic familiarity with PowerShell commands and syntax.

> _All examples in this article will be based on the [current stable release of PowerShell](https://github.com/PowerShell/powershell/releases) (7.1.0 at the time of writing). But as long as you have Windows PowerShell 4.0 and higher, the commands will work the same._

## Understanding How PowerShell Where-Object Works

The PowerShell `Where-Object` cmdlet’s only goal is to filter the output a command returns to only return the information you want to see.

In a nutshell, the `Where-Object` cmdlet is a filter; that’s it. It allows you to construct a condition that returns True or False. Depending on the result of that condition, the cmdlet then either returns the output or does not.

You can craft that condition in one of two ways; the “old” way with [_scriptblocks_](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_script_blocks) and the “new” way using parameters or comparison statements.

### Creating Filter Conditions with Scriptblocks

Scriptblocks are a key component in PowerShell. Scriptblocks are used in hundreds of places throughout the language. A scriptblock is an anonymous function. It’s a way to compartmentalize code and execute it in various places. You can build a filter for `Where-Object` via a scriptblock.

To use a scriptblock as a filter, you’d use the `FilterScript` parameter. This parameter allows you to create and pass a scriptblock to the `FilterScript` parameter which is then executed.

If the scriptblock returns a value other than a boolean False or null variable, it’s considered True. If not, it’s considered False.

For example, let’s say you need to find all of the Windows services which currently have a startup type of _Automatic_. You’d first gather all of the current services with `Get-Service` . `Get-Service` then returns many different service objects with various properties.

Using the PowerShell pipeline, you could then pipe those objects to the `Where-Object` cmdlet and use the `FilterScript` parameter. Since the `FilterScript` parameter accepts a scriptblock, you could create a condition to check whether or not the `StartType` property of each object is equal to _Automatic_ like below.

```powershell
{$_.StartType -EQ 'Automatic'}
```

Once you have the filtering scriptblock, you’d then provide that scriptblock to the `FilterScript` parameter. `Where-Object` would then execute that scriptblock for every object coming over the pipeline and evaluate each `StartType` property. If the property equals _Automatic_, `Where-Object` would pass the object though. If not, the object would be dropped.

You can see a simple example of this methodology below.

```powershell
Get-Service | Where-Object -FilterScript {$_.StartType -EQ 'Automatic'}
```

![Script Block construct](https://adamtheautomator.com/wp-content/uploads/2021/01/Untitled-2021-01-07T100519.397.png)

Script Block construct

> _Many people use positional parameters with the `Where-Object` cmdlet and don’t include the `FilterScript` parameter name. Instead, they simply provide the scriptblock alone like `Where-Object {$_.StartType -eq 'Automatic'}`._

While this type of construct works for this particular scenario. The concept of a scriptblock with the curly braces or even the _[pipeline variable `$_`](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_pipelines?view=powershell-7.2?view=powershell-7.2)_ makes the code less readable and more difficult for less experienced PowerShell users. This readability issue is what caused the PowerShell team to introduce parameters or comparison statements.

### Comparison Statements

Introduced in Windows PowerShell 3.0, comparison statements have more of a _natural_ flow to how they are constructed. Using the same scenario as the previous example, let’s use the comparison statement construct to find all of the Windows services with an _Automatic_ startup type:

```powershell
Get-Service | Where-Object -Property StartType -EQ 'Automatic'
```

Notice above that instead of using a scriptblock, the command specifies the object property as a parameter value to the `Property` parameter. The `eq` operator is now a parameter as well allowing you to pass the value of _Automatic_ to it.

Using parameters in this manner now eliminates the need for a scriptblock entirely.

> _A scriptblock is a better choice when defining more complex filtering conditions. The `Property` parameter may not always be the best choice. If using a scriptblock, just remember to document your code using comments!_

In the next section, you’ll learn about the available comparison operator types that can be used with `Where-Object` to filter all the things.

## Filtering Basics

Using parameters, `Where-Object` filters collections of objects using common comparison operators. Let’s dive into some examples of how they work.

### Containment Operators

Containment operators are useful when working with collections. Containment operators allow you to define a condition if a collection _contains_ an item or not.

As an example, let’s say you want to filter for a particular property value in a collection. You could use containment operators.

In PowerShell, you’ll find a few different containment operators:

-   `-contains` / `-ccontains` – Filter a collection containing a property value.
-   `-notcontains` / `-cnotcontains` – Filter a collection that does not contain a property value.
-   `-in` / `-cin` – value is in a collection, returns property value if a match is found.
-   `-notin` / `-cnotin` – value is not in a collection, `null`/`$false` if there is no property value.

_For case sensitivity, use containment operators that begin with `-c[operator]`_

**_Related: [Understanding PowerShell Comparison Operators by Example](https://adamtheautomator.com/powershell-like/)_**

Let’s say you’d like to check the status of the _BITS_ Windows service. You can do so using the `contains` parameter (operator) by passing the value of _BITS_ to it like below.

```powershell
Get-Service | Where-Object -Property Name -Contains 'BITS'
```

And below is what you would expect to see:

![Where-Object equivalent to Get-Service -ServiceName 'BITS'](https://adamtheautomator.com/wp-content/uploads/2021/01/Untitled-2021-01-07T100555.251.png)

Where-Object equivalent to _Get-Service -ServiceName ‘BITS’_

> _Always remember to filter left! The previous example is the equivalent to running `Get-Service -ServiceName 'BITS'` ._

Perhaps you’d like to get fancier and find all services with a _Status_ that is not _Running_ _and_ a _StartType_ that is _in_ a single string (or could be an array) called _Manual_. Using a scriptblock below, the command is using the `FilterScript` parameter to pass a scriptblock that evaluates on both of those conditions.

**_Related: [Back to Basics: Understanding PowerShell Objects](https://adamtheautomator.com/powershell-objects/)_**

```powershell
Get-Service |
Where-Object {($_.Status -notcontains 'Running') -and ($_.StartType -in 'Manual')}
```

When you run the above command, you will only see services that are stopped and have a _StartType_ of _Manual_.

![More advanced filtering of a collection of objects](https://adamtheautomator.com/wp-content/uploads/2021/01/Untitled-2021-01-07T101148.325.png)

More advanced filtering of a collection of objects

Filtering with containment operators works well with collections that contain many property values. Given the number of properties that `Get-Service` returns, filtering through all of these properties is made easier when you combine containment and _[logical operators](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_operators?view=powershell-7.1#logical-operators)._

### Matching Operators

Similar to how you use contaimment operators with `Where-Object`, you can also use mathcing operators. Matching operators allow you to match strings inside of strings. For example, `'foofoo' -like '*foo*'` returns True or `'foofoo' -match 'foo'` returns True. Matching operators match strings _in_ strings.

In PowerShell, you have a few different matching operators that you can use within `Where-Object`.

-   `-like` / `-clike` – string matches a wildcard pattern.
-   `-notlike` / `-cnotlike` – string does not match wildcard pattern.
-   `-match` / `-cmatch` – string matches regex pattern.
-   `-notmatch` / `-cnotmatch` – string does not match regex pattern

> _For case sensitivity, use matching operators that begin with `-c[operator]`_

Almost identical in form to containment operators, you can use matching operators as shown below. The below example is finding all services which have _Windows_ in the _DisplayName_ property value.

```powershell
Get-Service | Where-Object { $_.DisplayName -match 'Windows'}
```

![The match operator uses regular expressions to match on certain values.](https://adamtheautomator.com/wp-content/uploads/2021/01/Untitled-2021-01-07T101224.668.png)

The `match` operator uses regular expressions to match on certain values.

**_Related: [Getting Started with PowerShell and Regex](https://adamtheautomator.com/powershell-where-object/)_**

You can also use the `like` operator to use common matching techniques like using a wildcard (`*`) to match any character or perhaps a `?` to match a single character.

```powershell
Get-Service | Where-Object {($_.Name -like 'Win*')}
```

The results are filtered now to just those service names with ‘_Win_‘ as the first three characters:

![service names with 'Win'](https://adamtheautomator.com/wp-content/uploads/2021/01/Untitled-2021-01-07T101254.185.png)

service names with ‘_Win_‘

Using the wildcard means you don’t have to know the full name of the service. A few letters of the string are all that’s needed. These operators can also be combined with [_logical operators_](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_operators?view=powershell-7.1#logical-operators) to enhance filtering even further.

### Equality Operators

Similar to how to use containment and comparison operators, you can also use equality operators with `Where-Object`. Equality operators are useful when needing to compare numeric values.

For example, `1 -eq 1` would be True while `1 -gt 2` would be False. PowerShell has many different equality operators that you can use as `Where-Object` parameters or inside of condition scriptblocks.

-   `-eq` / `-ceq` – value equal to specified value.
-   `-ne` / `-cne` – value not equal to specified value.
-   `-gt` / `-cgt` – value greater than specified value.
-   `-ge` / `-cge` – value greater than or equal to specified value.
-   `-lt` / `-clt` – value less than specified value.
-   `-le` / `-cle` – value less than or equal to specified value.

For example, perhaps you’d like to find all running processes that are taking up between two and 10 percent of your CPU. Not a problem with the `[Get-Process](https://adamtheautomator.com/powershell-get-process/ "Get-Process")` and `Where-Object` PowerShell cmdlets.

Using a scriptblock, you can combine two conditions together using the `and` operator which will evaluate them both. If they both return True, `Where-Object` returns the process object passed over the pipeline. If at least one of the conditions returns False, `Where-Object` drops the object.

```powershell
Get-Process | Where-Object {($_.CPU -gt 2.0) -and ($_.CPU -lt 10)}
```

Here’s what you would expect to see:

![Filtering with greater than and less than](https://adamtheautomator.com/wp-content/uploads/2021/01/Untitled-2021-01-07T101342.039.png)

Filtering with greater than and less than

Filtering using `Where-Object` equality operators will help you in building system reports or for comparing values.

## Next Steps

Now that you know more about how to use the PowerShell `Where-Object` cmdlet to filter all the things, what else can you do? Try some more complex filtering tasks using multiple conditions and operators on collections to filter out property values and formatting the output to your liking.
