https://www.leeholmes.com/playing-with-classes-in-powershell-v5-preview/

> Precision Computing - Software Design and Development

# Playing with Classes in PowerShell v5 Preview
### Playing with Classes in PowerShell v5 Preview

Thu, Oct 9, 2014 2-minute read

One of the features we’re working on in the [latest version of PowerShell](http://blogs.msdn.com/b/powershell/archive/2014/09/04/windows-management-framework-5-0-preview-september-2014-is-now-available.aspx) is the ability to define custom classes.

If you’ve ever used a PSCustomObject or a Hashtable in a script for storing related data, you’ll probably find classes to be a useful addition to your scripting toolkit.

```powershell
$point = @{ X = 0; Y = 0 } $point.X = 10 $point.Y = 20
```

While PSCustomObjects and Hashtables let you group related data, what if you want to perform actions on that data? For example:

```powershell
$point = @{ X = 0; Y = 0 } $point.Move(10, 20)
```

This is the kind of scenario that classes really excel at. You use classes for holding “buckets” of related data, and operations on that date.

While the release notes in the V5 Preview (and of course, upcoming actual documentation) give an overview of how to define a class in PowerShell, here’s what they end up looking like:

```powershell
class Point { ## Define two properties, using PowerShell's regular ## variable syntax. You can limit variables to a type ## using regular type contraints, toos: ## [type] $VarName = initialValue $X = 0 $Y = 0 ## Define a method (that returns void), and takes ## two parameters. You can limit the types on these ## parameters, of course. [void] Move($xOffset, $yOffset) { $X += $xOffset $Y += $yOffset } } ## Create a point and use it $point = [Point]::new() $point.Move(10, 20) $point
```

And in use:

```
PS C:\\temp&gt; c:\\temp\\point.ps1 | Format-Table -Auto

 X  Y
 -  -
10 20

                                                                                                                        
```

Now, if you wanted to extend this concept far further than you would ever want to, you might get this :)

[![saddle](https://www.leeholmes.com/images/2014/10/saddle_thumb.gif "saddle")](https://www.leeholmes.com/images/2014/10/saddle.gif)

And Show-BoxDemo in all of its glory. TAB switches between objects, and there are a few other hotkeys in the source.

[http://www.leeholmes.com/projects/boxdemo/Show-BoxDemo.ps1](https://www.leeholmes.com/projects/boxdemo/Show-BoxDemo.ps1)

And if you’re curious:

iex(iwr [http://www.leeholmes.com/projects/boxdemo/Show-BoxDemo.ps1](https://www.leeholmes.com/projects/boxdemo/Show-BoxDemo.ps1))
