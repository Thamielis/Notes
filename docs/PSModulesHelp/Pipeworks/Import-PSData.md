Import-PSData
-------------

### Synopsis
Imports PSData sections

---

### Description

Imports files or strings containing PSData sections, and converts nested hashtables into nested PSObjects.

---

### Related Links
* [Export-PSData](Export-PSData)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Web -Url http://www.youtube.com/watch?v=xPRC3EDR_GU -AsMicrodata -ItemType http://schema.org/VideoObject | 
    Export-PSData $home\PipeworksQuickstart.video.psd1
Import-PSData $home\PipeworksQuickstart.video.psd1
```
> EXAMPLE 2

```PowerShell
@{a="b";c=@{d="E"}} | 
    Import-PSData | 
    Select-Object -ExpandProperty c | 
    Select-Object -ExpandProperty D
```

---

### Parameters
#### **FilePath**
A file containing PSData

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|Fullname|

#### **DataString**
A string in data language mode.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |true (ByValue, ByPropertyName)|

#### **CompressedString**
A compressed string

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |true (ByValue, ByPropertyName)|

#### **Hashtable**
A hashtable

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[Hashtable]`|true    |named   |true (ByValue, ByPropertyName)|

#### **AllowCommand**
Any commands allowed in the file, string, or compressedstring

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Import-PSData [-FilePath] <String> [-AllowCommand <String[]>] [<CommonParameters>]
```
```PowerShell
Import-PSData -DataString <String> [<CommonParameters>]
```
```PowerShell
Import-PSData -CompressedString <String> [-AllowCommand <String[]>] [<CommonParameters>]
```
```PowerShell
Import-PSData -Hashtable <Hashtable> [-AllowCommand <String[]>] [<CommonParameters>]
```
