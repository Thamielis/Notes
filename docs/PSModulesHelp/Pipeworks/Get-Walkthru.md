Get-Walkthru
------------

### Synopsis
Gets information from a file as a walkthru

---

### Description

Parses walkthru steps from a walkthru file.  
Walkthru files contain step-by-step examples for using PowerShell.

---

### Related Links
* [Write-WalkthruHTML](Write-WalkthruHTML)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Walkthru -Text {
# Walkthrus are just scripts with comments that start at column 0.
# Step 1:
Get-Process        

#Step 2:
Get-Command
}
```

---

### Parameters
#### **Command**
The command used to generate walkthrus

|Type           |Required|Position|PipelineInput |
|---------------|--------|--------|--------------|
|`[CommandInfo]`|true    |named   |true (ByValue)|

#### **Module**
The module containing walkthrus

|Type            |Required|Position|PipelineInput |
|----------------|--------|--------|--------------|
|`[PSModuleInfo]`|true    |named   |true (ByValue)|

#### **File**
The file used to generate walkthrus

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |named   |true (ByPropertyName)|Fullname|

#### **Text**
The text used to generate walkthrus

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **ScriptBlock**
The script block used to generate a walkthru

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|true    |named   |false        |

---

### Outputs
* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Get-Walkthru -File <String> [<CommonParameters>]
```
```PowerShell
Get-Walkthru -Command <CommandInfo> [<CommonParameters>]
```
```PowerShell
Get-Walkthru -Module <PSModuleInfo> [<CommonParameters>]
```
```PowerShell
Get-Walkthru -Text <String> [<CommonParameters>]
```
```PowerShell
Get-Walkthru -ScriptBlock <ScriptBlock> [<CommonParameters>]
```
