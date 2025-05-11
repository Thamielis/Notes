ConvertFrom-InlinePowerShell
----------------------------

### Synopsis
Converts PowerShell inlined within HTML to ASP.NET

---

### Description

Converts PowerShell inlined within HTML to ASP.NET.

PowerShell can be embedded with <| |> or <psh></psh> or <?psh  ?>

---

### Related Links
* [ConvertTo-ModuleService](ConvertTo-ModuleService)

* [ConvertTo-CommandService](ConvertTo-CommandService)

---

### Examples
> EXAMPLE 1

<| 'hello world' |></h1>"

---

### Parameters
#### **FileName**
The filename

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |named   |true (ByPropertyName)|Fullname|

#### **PowerShellAndHtml**
A mix of HTML and PowerShell.  PowerShell can be embedded with <| |> or <psh></psh> or <?psh  ?>
|LinesForInput 20

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **MasterPage**
If set, the page generated will include this page as the ASP.NET master page

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **CodeFile**
If set, will use a code file for the generated ASP.NET page.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Inherit**
If set, will inherit the page from a class name

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **RunScriptMethod**
The method that will be used to run scripts in ASP.NET.  If nothing is specified, runScript

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
ConvertFrom-InlinePowerShell [-MasterPage <String>] [-CodeFile <String>] [-Inherit <String>] [-RunScriptMethod <String>] [<CommonParameters>]
```
```PowerShell
ConvertFrom-InlinePowerShell -FileName <String> [-MasterPage <String>] [-CodeFile <String>] [-Inherit <String>] [-RunScriptMethod <String>] [<CommonParameters>]
```
```PowerShell
ConvertFrom-InlinePowerShell [-PowerShellAndHtml] <String> [-MasterPage <String>] [-CodeFile <String>] [-Inherit <String>] [-RunScriptMethod <String>] [<CommonParameters>]
```
