https://mikefrobbins.com/2023/11/02/navigating-the-nuances-of-powershell-syntax-with-get-help-and-get-command/

> When working with PowerShell, it's essential to understand the tools available for exploring cmdlets
and their syntax. Both Get-Help and Get-Command are …

# Navigating the Nuances of PowerShell Syntax with Get-Help and Get-Command
When working with PowerShell, it's essential to understand the tools available for exploring cmdlets and their syntax. Both `Get-Help` and `Get-Command` are invaluable resources for discovering and understanding cmdlet syntax in PowerShell. While both provide syntax information, they display the details differently for parameters that accept enumerated values. In this article, we'll explore the subtle but significant differences between these two cmdlets and how they can assist in your PowerShell scripting efforts.

## The basics[](https://mikefrobbins.com/2023/11/02/navigating-the-nuances-of-powershell-syntax-with-get-help-and-get-command/#the-basics)

Before exploring the nuances, let's review the purpose of `Get-Help` and `Get-Command`.

-   `Get-Help` is primarily used for retrieving detailed information about cmdlets, functions, or modules. It provides extensive documentation, including descriptions, examples, and parameter details.
    
-   `Get-Command` is used for discovering and exploring the available commands on your system. It lists commands matching specific criteria, including the command's name, module, and syntax.
    

## Enumerated values for parameters[](https://mikefrobbins.com/2023/11/02/navigating-the-nuances-of-powershell-syntax-with-get-help-and-get-command/#enumerated-values-for-parameters)

In PowerShell, many parameters can accept enumerated values. Enumerated values are predefined sets of values that a parameter can accept. For example, a parameter might accept values like `Enabled` or `Disabled`, and these are often defined as enums.

Now, let's explore how `Get-Help` and `Get-Command` handle enumerated values when displaying the parameters for cmdlet syntax.

## Get-Help[](https://mikefrobbins.com/2023/11/02/navigating-the-nuances-of-powershell-syntax-with-get-help-and-get-command/#get-help)

When using `Get-Help` to retrieve information about a cmdlet, it provides comprehensive details about each parameter, including its data type, description, and, if applicable, the enumerated values it accepts.

The **SYNTAX** section of `Get-Help` expands the enumerated values for parameters. It displays the actual values you can use, making it easier to understand the available options.

Here's an example of how the **SYNTAX** section of `Get-Help` displays information about a parameter that accepts enumerated values.

```powershell
(Get-Help -Name Get-ExecutionPolicy).Syntax
```

powershell

In this example, `Get-Help` lists the acceptable values as `{CurrentUser | LocalMachine | MachinePolicy | Process | UserPolicy}` for the **Scope** parameter of `Get-ExecutionPolicy`.

```fallback
Get-ExecutionPolicy [[-Scope] {CurrentUser | LocalMachine | MachinePolicy | Process | UserPolicy}] [-List] [<CommonParameters>]
```

## Get-Command[](https://mikefrobbins.com/2023/11/02/navigating-the-nuances-of-powershell-syntax-with-get-help-and-get-command/#get-command)

Using `Get-Command` with its **Syntax** parameter is more concise, focused primarily on displaying the syntax of a cmdlet. While it provides the parameter names and data types, it doesn't include information about enumerated values.

Here's how `Get-Command` displays the syntax information.

```powershell
Get-Command -Name Get-ExecutionPolicy -Syntax
```

powershell

In this output, you can see the parameter names and their data types, but there's no mention of the specific allowable enumerated values for the **Scope** parameter.

```fallback
Get-ExecutionPolicy [[-Scope] <ExecutionPolicyScope>] [-List] [<CommonParameters>]
```

Now that you understand the differences between `Get-Help` and `Get-Command` regarding enumerated values for parameters of cmdlet syntax, it's essential to choose the best tool for your specific needs.

-   Use `Get-Help` for detailed information about a cmdlet, including parameter descriptions, examples, and acceptable enumerated values. It's an excellent choice for in-depth exploration and learning.
    
-   Use `Get-Command` with its **Syntax** parameter when you want a quick reference to understand the basic syntax of a cmdlet, especially when you're already familiar with the cmdlet and need a reminder of its parameter names and data types.
    

## Summary[](https://mikefrobbins.com/2023/11/02/navigating-the-nuances-of-powershell-syntax-with-get-help-and-get-command/#summary)

Both `Get-Help` and `Get-Command` are valuable tools for PowerShell scripters. By understanding their differences, you can effectively leverage them to streamline your scripting tasks and make the most of PowerShell's powerful features.

## References[](https://mikefrobbins.com/2023/11/02/navigating-the-nuances-of-powershell-syntax-with-get-help-and-get-command/#references)

-   [Get-Help](https://learn.microsoft.com/powershell/module/microsoft.powershell.core/get-help)
-   [Get-Command](https://learn.microsoft.com/powershell/module/microsoft.powershell.core/get-command)

## Acknowledgments[](https://mikefrobbins.com/2023/11/02/navigating-the-nuances-of-powershell-syntax-with-get-help-and-get-command/#acknowledgments)

Thanks to [Sean Wheeler](https://twitter.com/swsamwa) for pointing out the differences between `Get-Help` and `Get-Command` when displaying enumerated values for parameters while reviewing chapter 2 of my [PowerShell 101](https://leanpub.com/powershell101) book.
