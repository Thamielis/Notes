Test-PSOneScript
----------------

### Synopsis
Parses a PowerShell Script (*.ps1, *.psm1, *.psd1)

---

### Description

Invokes the simple PSParser and returns tokens and syntax errors

---

### Related Links
* [https://powershell.one/powershell-internals/parsing-and-tokenization/simple-tokenizer
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.4/Test-PSOneScript.ps1](https://powershell.one/powershell-internals/parsing-and-tokenization/simple-tokenizer
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.4/Test-PSOneScript.ps1)

* [https://powershell.one/powershell-internals/parsing-and-tokenization/simple-tokenizer
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.4/Test-PSOneScript.ps1](https://powershell.one/powershell-internals/parsing-and-tokenization/simple-tokenizer
https://github.com/TobiasPSP/Modules.PSOneTools/blob/master/PSOneTools/1.4/Test-PSOneScript.ps1)

---

### Examples
> EXAMPLE 1

```PowerShell
Test-PSOneScript -Path c:\test.ps1
Parses the content of c:\test.ps1 and returns tokens and syntax errors
```
> EXAMPLE 2

```PowerShell
Get-ChildItem -Path $home -Recurse -Include *.ps1,*.psm1,*.psd1 -File |
   Test-PSOneScript |
   Out-GridView
parses all PowerShell files found anywhere in your user profile
```
> EXAMPLE 3

```PowerShell
Get-ChildItem -Path $home -Recurse -Include *.ps1,*.psm1,*.psd1 -File |
   Test-PSOneScript |
   Where-Object Errors
parses all PowerShell files found anywhere in your user profile
and returns only those files that contain syntax errors
```

---

### Parameters
#### **Path**
Path to PowerShell script file
can be a string or any object that has a "Path" 
or "FullName" property:

|Type      |Required|Position|PipelineInput |Aliases |
|----------|--------|--------|--------------|--------|
|`[String]`|true    |named   |true (ByValue)|FullName|

#### **Code**
PowerShell Code as String
you can also submit a ScriptBlock which will automatically be converted
to a string. ScriptBlocks by default cannot contain syntax errors because
they are parsed already.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[String]`|true    |named   |true (ByValue)|

---

### Syntax
```PowerShell
Test-PSOneScript -Path <String> [<CommonParameters>]
```
```PowerShell
Test-PSOneScript -Code <String> [<CommonParameters>]
```
