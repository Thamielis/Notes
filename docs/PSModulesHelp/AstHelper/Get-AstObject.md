Get-AstObject
-------------

### Synopsis
Returns all the AST objects in a script that are of a specified type.

---

### Description

Takes the content of a script, parses it, and returns all the objects in a script that are of that type.

---

### Related Links
* [http://workingsysadmin.com](http://workingsysadmin.com)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-AstObject -ScriptPath .\MyScript.ps1 -Type CommandAst
```

---

### Parameters
#### **ScriptPath**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **Type**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **ExactType**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Management.Automation.PSObject[]](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject[])

---

### Notes
Author: Thomas Rayner (@MrThomasRayner), workingsysadmin.com

---

### Syntax
```PowerShell
Get-AstObject [-ScriptPath] <String> [-Type] <String> [-ExactType] [<CommonParameters>]
```
