---
created: 2025-04-29T16:31:48 (UTC +02:00)
tags: []
source: https://jeffbrown.tech/using-exception-messages-with-try-catch-in-powershell/
author: Jeff Brown
---

# Mastering PowerShell Try Catch with Exception Messages | Jeff Brown Tech

---
You have had it happen before. You run a PowerShell script, and suddenly the console is full of errors. Did you know you can handle these errors in a much better way? Enter PowerShell try catch blocks!

Using error handling with PowerShell try catch blocks allows for managing and responding to these terminating errors. In this post, you will be introduced to PowerShell try catch blocks and learn how to handle specific exception messages.

## Understanding PowerShell Try Catch Syntax

The PowerShell try catch block syntax is straightforward. It is composed of two sections enclosed in curly brackets. The first identified section is the `try` block, and the second section is the `catch` block.

The try block can have as many statements in it as you want; however, keep the statements to as few as possible, probably just a single statement. The point of error handling is to work with one statement at a time and deal with anything that occurs from the error.

Here is an example of an error occurring in the PowerShell console. The command is creating a new file using the **New-Item** cmdlet and specifying a non-existent folder for **Path**.

![](http://jeffbrown.tech/wp-content/uploads/2024/02/New-Item-Failed-Output.png)

If this command was in a script, the output wastes some screen space, and the problem may not be immediately visible. Using a PowerShell try catch block, you can manipulate the error output and make it more readable.

Here is the same **New-Item** command in a try catch block. Note that line 5 uses the **\-ErrorAction** parameter with a value of **Stop** to the command. Not all errors are considered “terminating,” so sometimes you need to add this bit of code to terminate into the catch block properly.

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p></td><td><div><p><code>try {</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>New-Item</code> <code>-Path</code> <code>C:\doesnotexist `</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>-Name</code> <code>myfile.txt `</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>-ItemType</code> <code>File `</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>-ErrorAction</code> <code>Stop</code></p><p><code>}</code></p><p><code>catch {</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Write-Warning</code> <code>-Message</code> <code>"Oops, ran into an issue"</code></p><p><code>}</code></p></div></td></tr></tbody></table>

![](http://jeffbrown.tech/wp-content/uploads/2020/04/Try-Catch-with-Generic-Message.png)

Instead of a block of red angry-looking text, you have a simple warning message that it ran into an issue. The non-existent Path name along with forcing **\-ErrorAction Stop** drops the logic into the catch block and displays the custom warning.

## Adding the $Error Variable to Catch Output

While more readable, this is not very helpful. All you know is the command did not complete successfully, but you don’t know why. Instead of displaying my custom message, you can display the specific error message that occurred instead of the entire exception block.

When an error occurs in the try block, it is saved to the automatic variable named **$Error**. The **$Error** variable contains an array of recent errors, and you can reference the most recent error in the array at index 0.

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p></td><td><div><p><code>try {</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>New-Item</code> <code>-Path</code> <code>C:\doesnotexist `</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>-Name</code> <code>myfile.txt `</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>-ItemType</code> <code>File `</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>-ErrorAction</code> <code>Stop</code></p><p><code>}</code></p><p><code>catch {</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Write-Warning</code> <code>$Error</code><code>[0]</code></p><p><code>}</code></p></div></td></tr></tbody></table>

![](http://jeffbrown.tech/wp-content/uploads/2020/04/Try-Catch-with-Error-Variable-Message.png)

The warning output is now more descriptive showing that the command failed because it couldn’t find part of the path. This message was a part of our original error message but is now more concise.

Alternatively, you can save the incoming error to a variable using `$_`. The dollar sign + underscore in PowerShell indicates the current item in the pipeline. In this case, the current item is the error message coming out of the try block.

Once you have saved this incoming message, you use it in a custom output message, like so:

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p></td><td><div><p><code>try {</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>New-Item</code> <code>-Path</code> <code>C:\doesnotexist `</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>-Name</code> <code>myfile.txt `</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>-ItemType</code> <code>File `</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code>-ErrorAction</code> <code>Stop</code></p><p><code>}</code></p><p><code>catch {</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>$message</code> <code>= </code><code>$_</code></p><p><code>&nbsp;&nbsp;&nbsp;&nbsp;</code><code>Write-Warning</code> <code>"Something happened! $message"</code></p><p><code>}</code></p></div></td></tr></tbody></table>

![try catch error messages](https://jeffbrown.tech/wp-content/uploads/2021/04/save-to-variable-1024x454.png)

## Adding Exception Messages to Catch Blocks

You can also use multiple catch blocks to handle specific errors differently. This example displays two different custom messages:

-   One for if the path does not exist
-   One for if an illegal character is used in the name

Note that the following screenshot shows the script running twice with two different commands in the try block. Each command, catch block, and the orange and green arrows indicate the final output.

![](https://jeffbrown.tech/wp-content/uploads/2024/02/Multiple-Catch-Blocks.png)

Looking at lines 14-16, there is a third catch block without an exception message. This is a “catch-all” block that will run if the error does not match any other exceptions. If you are running this script and seeing the message in the last catch block, you know the error is not related to an illegal character in the file name or part of the path not being valid.

Now how do you find the exception messages to use in the first two catch blocks? You find it by looking at the different information attached to the `$Error` variable. After a failed command occurs, you can run **$Error\[0\].Exception.GetType().FullName** to view the exception message for the last error that occurred.

Going back to the PowerShell console, rerun the `New-Item` command with a non-existent path, then run the **$Error** command to find the exception message.

![](https://jeffbrown.tech/wp-content/uploads/2024/02/Finding-Exception-Messages.png)

The red text immediately following the failed command also contains the exception message but does not contain which module it is from. Looking at the **$Error** variable shows the full message to be used for a catch block.

## Getting Exception Messages in PowerShell 7

PowerShell version 7 introduced the `[Get-Error](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-error)` command. This command displays the most recent error from the current session. After encountering an error, run Get-Error to show the exception type to use in the `catch` block.

![powershell 7 get-error exception message type](https://jeffbrown.tech/wp-content/uploads/2021/12/ps7_get-error.png)

Finding exception message type in PowerShell 7

## Summary

Using PowerShell try catch blocks gives additional power to handle errors in a script and take different actions based on the error. The catch block can display more than just an error message. It can contain logic that will resolve the error and continue executing the rest of the script.

Do you have any tips on using try/catch blocks? Leave a comment below or find me on [Twitter](https://twitter.com/JeffWBrown) or [LinkedIn](https://www.linkedin.com/in/jeffwaynebrown/) for additional discussion.

Enjoyed this article? Check out more of my PowerShell articles [**here**](https://jeffbrown.tech/category/powershell/)!

**References**:

[Microsoft Docs: About Try Catch Finally](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_try_catch_finally)  
[Microsoft Docs: About Automatic Variables ($Error)](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_automatic_variables?view=powershell-6#error)  
[Microsoft Blog: Understanding Non-Terminating Errors in PowerShell](https://devblogs.microsoft.com/scripting/understanding-non-terminating-errors-in-powershell/)

## Post navigation
