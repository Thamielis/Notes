https://www.leeholmes.com/using-powershell-to-compare-diff-files/

> Precision Computing - Software Design and Development

# Using PowerShell to Compare / Diff Files
### Using PowerShell to Compare / Diff Files

Sat, Nov 30, 2013 3-minute read

If you’ve tried to diff files in PowerShell before, you might have seen the [Compare-Object](http://technet.microsoft.com/en-us/library/hh849941.aspx) cmdlet. The Compare-Object cmdlet lets you compare two sets of items, giving you a report on the differences between those two sets:

```
PS G:\lee\tools&gt; cd c:\temp
PS C:\temp&gt; $set1 = "A","B","C"
PS C:\temp&gt; $set2 = "C","D","E"
PS C:\temp&gt; Compare-Object $set1 $set2

InputObject SideIndicator
----------- -------------
D           =&gt;
E           =&gt;
A           &lt;=
B           &lt;=
```

From this output, we can see that “A” and “B” only show up in $set1, while “D” and “E” only show up in $set2. For *sets of objects*, this is all you need to know.

However, one common “set of objects” that people like to compare are lines in text files. When you are comparing lines in a file, you usually don’t care only about the lines that have been added or deleted. You care about *where* in the file they got added – a situation usually handled by a [special-purpose tool](https://www.bing.com/search?q=windows+diff) such as WinMerge, ExamDiff, WinDiff, or simply the Windows port of diff.exe.

Special-purpose file comparison tools have lots of tricks to compare files [efficiently and logically](https://en.wikipedia.org/wiki/Diff#Algorithm), but PowerShell does let you implement a basic file comparison through a special trick – realizing that the Get-Content cmdlet tags its output objects with the line number they came from.

```
PS C:\temp&gt; (Get-Content .\test.txt)[5] | Format-List * -Force

PSPath       : C:\temp\test.txt
PSParentPath : C:\temp
PSChildName  : test.txt
PSDrive      : C
PSProvider   : Microsoft.PowerShell.Core\FileSystem
ReadCount    : 6
Length       : 0
```

That gives the nifty one-liner:

```
PS C:\temp&gt; Compare-Object (Get-Content files.txt) (Get-Content files2.txt) |
    Sort { $_.InputObject.ReadCount }

InputObject                                                      SideIndicator
-----------                                                      -------------
-a---        11/26/2013   9:52 PM          0 files.txt       ... &lt;=
-a---        11/26/2013   9:52 PM      75702 files.txt       ... =&gt;
-a---        11/26/2013   9:52 PM          0 files2.txt      ... =&gt;
```

If you want to pretty up the output a bit and make the syntax cleaner, let me introduce Compare-File:

```powershell
############################################################################## ## ## Compare-File ## ############################################################################## <# .SYNOPSIS Compares two files, displaying differences in a manner similar to traditional console-based diff utilities. #> param( ## The first file to compare $file1, ## The second file to compare $file2, ## The pattern (if any) to use as a filter for file ## differences $pattern = ".*" ) ## Get the content from each file $content1 = Get-Content $file1 $content2 = Get-Content $file2 ## Compare the two files. Get-Content annotates output objects with ## a 'ReadCount' property that represents the line number in the file ## that the text came from. $comparedLines = Compare-Object $content1 $content2 -IncludeEqual | Sort-Object { $_.InputObject.ReadCount } $lineNumber = 0 $comparedLines | foreach { ## Keep track of the current line number, using the line ## numbers in the "after" file for reference. if($_.SideIndicator -eq "==" -or $_.SideIndicator -eq "=>") { $lineNumber = $_.InputObject.ReadCount } ## If the text matches the pattern, output a custom object ## that displays text like this: ## ## Line Operation Text ## ---- --------- ---- ## 59 added New text added ## if($_.InputObject -match $pattern) { if($_.SideIndicator -ne "==") { if($_.SideIndicator -eq "=>") { $lineOperation = "added" } elseif($_.SideIndicator -eq "<=") { $lineOperation = "deleted" } [PSCustomObject] @{ Line = $lineNumber Operation =< span style="color: "> $lineOperation Text = $_.InputObject } } } }
```
