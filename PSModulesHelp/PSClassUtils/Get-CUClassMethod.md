Get-CUClassMethod
-----------------

### Synopsis
This function returns all existing constructors of a specific powershell class.

---

### Description

This function returns all existing constructors of a specific powershell class. You can pipe the result of get-cuclass. Or you can specify a file to get all the constructors present in this specified file.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-CUClassMethod
Return all the methods of the classes loaded in the current PSSession.
```
> EXAMPLE 2

Get-CUClassMethod -ClassName woop
ClassName Name    Parameter
--------- ----    ---------
woop    woop
woop    woop       {String, Number}
Return methods for the woop Class.
> EXAMPLE 3

Get-CUClassMethod -Path .\Woop.psm1
ClassName Name    Parameter
--------- ----    ---------
woop    woop
woop    woop       {String, Number}
Return methods for the woop Class present in the woop.psm1 file.
> EXAMPLE 4

Gci -recurse | Get-CUClassMethod -ClassName CuClass
ClassName Name    Parameter
--------- ----    ---------
CUClass   CUClass {RawAST}
CUClass   CUClass {Name, Property, Constructor, Method}
CUClass   CUClass {Name, Property, Constructor, Method...}
Return methods for the CUclass Class present somewhere in the c:\psclassutils folder.

---

### Parameters
#### **ClassName**
Specify the name of the class.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **MethodName**
Specify the name of a specific Method

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **InputObject**
An object, or array of object of type CuClass

|Type         |Required|Position|PipelineInput |
|-------------|--------|--------|--------------|
|`[CUClass[]]`|false   |named   |true (ByValue)|

#### **Path**
The path of a file containing PowerShell Classes. Accept values from the pipeline.

|Type          |Required|Position|PipelineInput                 |Aliases |
|--------------|--------|--------|------------------------------|--------|
|`[FileInfo[]]`|false   |named   |true (ByValue, ByPropertyName)|FullName|

#### **Raw**
The raw switch will display the raw content of the Class.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs
String

---

### Outputs
* CUClassMethod

---

### Notes
Author: StÃ©phane van Gulick
Version: 0.7.1
www.powershellDistrict.com
Report bugs or submit feature requests here:
https://github.com/Stephanevg/PowerShellClassUtils

---

### Syntax
```PowerShell
Get-CUClassMethod [-ClassName <String[]>] [-MethodName <String[]>] [-Raw] [<CommonParameters>]
```
```PowerShell
Get-CUClassMethod [-ClassName <String[]>] [-MethodName <String[]>] [-InputObject <CUClass[]>] [-Raw] [<CommonParameters>]
```
```PowerShell
Get-CUClassMethod [-ClassName <String[]>] [-MethodName <String[]>] [-Path <FileInfo[]>] [-Raw] [<CommonParameters>]
```
