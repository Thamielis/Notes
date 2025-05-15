---
created: 2022-03-11T11:16:16 (UTC +01:00)
tags: []
source: https://adamtheautomator.com/powershell-splatting/
author: 
---

# PowerShell Splatting: What is it and How Does it Work?

> ## Excerpt
> PowerShell splatting is the strange phrase that can turn your script from a mess of code to a nicely structured work of art. Learn how in this tutorial!

---
[PowerShell splatting](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_splatting?view=powershell-7) may sound strange, but this technique offers a convenient way to format and send arguments to cmdlets and functions. Instead of a long list of [parameters](https://adamtheautomator.com/powershell-parameter/) or those same parameters separated by error-prone backticks, you can leverage splatting to make your code more readable and easier to use.

In this article, you’ll learn how best to use PowerShell splatting to enhance your scripts and code!

-   [Prerequisites](https://adamtheautomator.com/powershell-splatting/#Prerequisites "Prerequisites")
-   [What is PowerShell Splatting?](https://adamtheautomator.com/powershell-splatting/#What_is_PowerShell_Splatting "What is PowerShell Splatting?")
-   [Combining Traditional Parameters and Splatting](https://adamtheautomator.com/powershell-splatting/#Combining_Traditional_Parameters_and_Splatting "Combining Traditional Parameters and Splatting")
    -   [Overriding Splatted Parameters](https://adamtheautomator.com/powershell-splatting/#Overriding_Splatted_Parameters "Overriding Splatted Parameters")
-   [Splatting Arrays for Positional Parameters](https://adamtheautomator.com/powershell-splatting/#Splatting_Arrays_for_Positional_Parameters "Splatting Arrays for Positional Parameters")
-   [Proxy Functions and Splatted Commands](https://adamtheautomator.com/powershell-splatting/#Proxy_Functions_and_Splatted_Commands "Proxy Functions and Splatted Commands")
    -   [Understanding $Args and $PSBoundParameters](https://adamtheautomator.com/powershell-splatting/#Understanding_Args_and_PSBoundParameters "Understanding $Args and $PSBoundParameters")
    -   [Building a Wrapper Function using Splatted Parameters](https://adamtheautomator.com/powershell-splatting/#Building_a_Wrapper_Function_using_Splatted_Parameters "Building a Wrapper Function using Splatted Parameters")
-   [Conclusion](https://adamtheautomator.com/powershell-splatting/#Conclusion "Conclusion")

## Prerequisites

If you’d like to follow along with this article, ensure you have Windows PowerShell 5.1 for most of the common functionality but PowerShell 7.1 to be able to override splatted parameters (demo below).

## What is PowerShell Splatting?

To understand PowerShell splatting, you must first understand basic parameters. Typically, when you pass parameters to a command in PowerShell, you’d use a dash, the parameter name followed by the argument as shown below.

```powershell
Copy-Item -Path "TestFile.txt" -Destination "CopiedFile.txt" -WhatIf -Force
```

Alternatively, you could pass parameters using backticks as well.

```powershell
Copy-Item `
-Path "TestFile.txt" `
-Destination "CopiedFile.txt" `
-WhatIf `
-Force
```

Why might you use the traditional method or the backtick method? The traditional method is fine, but with many parameters, this often becomes unwieldy to deal with and read. Using a backtick, “\`, appears to give much better readability. This technique is usually not recommended due to the ease of forgetting or misplacing a backtick.

Instead, you can use PowerShell [splatting](https://adamtheautomator.com/powershell-splatting/ "splatting"). To splat a parameter set, first create a hashtable containing key/value pairs of each parameter and parameter argument. Then, once you have the hashtable built, pass that set of parameters to the command using `@<hashtable name>`.

For example, you can create a hashtable called `$Params` and then pass that set of parameters defined in the hashtable to the `Copy-Item` cmdlet as shown below.

```powershell
$Params = @{
  "Path"        = "TestFile.txt"
  "Destination" = "CopiedFile.txt"
  "WhatIf"      = $True
  "Force"       = $True
}

Copy-Item @Params
```

## Combining Traditional Parameters and Splatting

When you are testing scripts, or on the command-line, you can easily combine both methods. With scripts, it is often best to ultimately create a splatted variable to assign to the function or cmdlet. As an example of what this looks like is below:

```powershell
$Params = @{
  "Path"        = "TestFile.txt"
  "Destination" = "CopiedFile.txt"
}

Copy-Item @Params -Force -WhatIf
```

As you can tell, this is a pretty useful technique where you don’t have to give up either method depending on your needs. Sometimes you may want to test an additional parameter or format the parameters differently for formatting by combining methods.

### Overriding Splatted Parameters

In PowerShell 7.1, you can now override splatted parameters. Prior to this, you could not modify a splatted parameter via a passed parameter. As an example of overriding splatted parameters, notice how the `-WhatIf` parameter is overridden below.

```powershell
$Params = @{
  "Path"        = "TestFile.txt"
  "Destination" = "CopiedFile.txt"
  "WhatIf"      = $True
  "Force"       = $True
}

Copy-Item @Params -WhatIf:$False
```

![Overriding a splatted parameter](https://adamtheautomator.com/wp-content/uploads/2020/11/Untitled-2020-11-17T124105.244.png)

Overriding a splatted parameter

Overriding splatted parameters allows you to negate the key/value parameter defined in the hashtable and instead, use the value of the parameter defined traditionally.

## Splatting Arrays for Positional Parameters

It’s considered best practice to use named parameters which forces you to specify the name of the parameter followed by the parameter argument. However, you can also splat parameters by _position_ also.

If, for example, you’d like to copy a file called _TestFile.txt_ to a file called _CopiedFile.txt_, you can do this using positional parameters like below.

```powershell
Copy-Item 'TestFile.txt' 'CopiedFile.txt'
```

Instead of specifying positional parameters the old-fashioned way, you can also create an array (vs a hashtable as shown above) with only the parameter values. Below you’ll see an example of this.

```powershell
$ParamArray = @(
  "TestFile.txt"
  "CopiedFile.txt"
)

Copy-Item @ParamArray
```

![Positional splatted parameters using an array.](https://adamtheautomator.com/wp-content/uploads/2020/11/Untitled-2020-11-17T124746.699.png)

Positional splatted parameters using an array.

Though this technique isn’t used quite often, this can be useful, as it is a less verbose method of providing splatted parameters. Remember that you will need to make sure you know the arguments’ positions in a given function or cmdlet; otherwise, you run the risk of passing values to incorrectly targeted parameters.

## Proxy Functions and Splatted Commands

Sometimes, a PowerShell cmdlet doesn’t do quite what you need. In this case, you may choose to create a “wrapper” function or maybe even a [proxy function](https://devblogs.microsoft.com/scripting/proxy-functions-spice-up-your-powershell-core-cmdlets/). These functions allow you to add additional parameters to the original cmdlet and then call that cmdlet with the new parameters.

### Understanding `$Args` and $PSBoundParameters

When you run a function in PowerShell, PowerShell creates an automatic array variable called `$Args`. This array contains all unnamed parameter values passed to that function.

You’ll find another automatic variable called `$PSBoundParameters` which contains a hashtable of all bound parameters. Notice below the `Test-Function` function that returns the `$Param1` and `$Param2` parameters.

```powershell
Function Test-Function {
  Param(
    $Param1,
    $Param2
  
    )
  Write-Host "Unnamed Parameters" -ForegroundColor 'Green'
  $Args

  Write-Host "Bound Parameters" -ForegroundColor 'Green'
  $PSBoundParameters
}

Test-Function "test1" "test2" "test3" -Param1 "testParam" -Param2 "testParam2"
```

![Demonstrating the automatic variables $Args and $PSBoundParameters.](https://adamtheautomator.com/wp-content/uploads/2020/11/Untitled-2020-11-17T124826.542.png)

Demonstrating the automatic variables `$Args` and `$PSBoundParameters`.

How are these automatic variables relevant to splatting? When you are building a proxy command, automatically passing in both bound and unbound parameters is very useful.

### Building a Wrapper Function using Splatted Parameters

To show how useful splatting can be in wrapper functions, create a custom function that passes unnamed parameters and named parameters to the `Copy-Item` cmdlet. With this technique, you can quickly create custom functions that add additional functionality but retain the same parameter set you would expect.

```powershell
Function Copy-CustomItem {
  Get-ChildItem

  Copy-Item @Args @PSBoundParameters

  Get-ChildItem
}
```

![Wrapper Function using Splatted Parameters](https://adamtheautomator.com/wp-content/uploads/2020/11/Untitled-2020-11-17T124857.374.png)

Wrapper Function using Splatted Parameters

_It’s important to remember that if you use the `CmdletBinding` declaration or define parameter attributes, the automatic variable `$Args` no longer becomes available._

## Conclusion

Splatting parameters to functions and cmdlets is an extremely useful technique for code readability and functionality. As it’s easy to manipulate hashtables and arrays, you can quickly expand upon splatted values to conditionally modify values depending on options that were passed. Incorporate this powerful technique into your scripts today!
