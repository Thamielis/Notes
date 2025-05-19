Show-PSMDSyntax
---------------

### Synopsis
Validate or show parameter set details with colored output

---

### Description

Analyze a function and it's parameters

The cmdlet / function is capable of validating a string input with function name and parameters

---

### Examples
> EXAMPLE 1

```PowerShell
Show-PSMDSyntax -CommandText "New-Item -Path 'c:\temp\newfile.txt'"
This will validate all the parameters that have been passed to the Import-D365Bacpac cmdlet.
All supplied parameters that matches a parameter will be marked with an asterisk.
```
> EXAMPLE 2

```PowerShell
Show-PSMDSyntax -CommandText "New-Item" -Mode "ShowParameters"
This will display all the parameter sets and their individual parameters.
```

---

### Parameters
#### **CommandText**
The string that you want to analyze
If there is parameter value present, you have to use the opposite quote strategy to encapsulate the string correctly
E.g. for double quotes
-CommandText 'New-Item -Path "c:\temp\newfile.txt"'
E.g. for single quotes
-CommandText "New-Item -Path 'c:\temp\newfile.txt'"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Mode**
The operation mode of the cmdlet / function
Valid options are:
* Validate
* ShowParameters
Valid Values:

* Validate
* ShowParameters

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Legend**
Include a legend explaining the color mapping

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
Author: Mötz Jensen (@Splaxi)
Twitter: https://twitter.com/splaxi
Original github project: https://github.com/d365collaborative/d365fo.tools

---

### Syntax
```PowerShell
Show-PSMDSyntax [-CommandText] <String> [[-Mode] <String>] [-Legend] [<CommonParameters>]
```
