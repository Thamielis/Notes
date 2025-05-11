Get-FunctionFromScript
----------------------

### Synopsis
Gets the functions declared within a script block or a file

---

### Description

Gets the functions exactly as they are written within a script or file

---

### Related Links
* [http://powershellpipeworks.com/](http://powershellpipeworks.com/)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-FunctionFromScript {
    function foo() {
        "foo"
    }
    function bar() {
        "bar"
    }
}
```

---

### Parameters
#### **ScriptBlock**
The script block containing functions

|Type           |Required|Position|PipelineInput        |
|---------------|--------|--------|---------------------|
|`[ScriptBlock]`|true    |1       |true (ByPropertyName)|

#### **File**
A file containing functions

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |named   |true (ByPropertyName)|FullName|

#### **OutputMetaData**
If set, outputs the command metadatas

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [Management.Automation.ScriptBlock](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.ScriptBlock)

* [Management.Automation.PSObject](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject)

---

### Syntax
```PowerShell
Get-FunctionFromScript -File <String> [-OutputMetaData] [<CommonParameters>]
```
```PowerShell
Get-FunctionFromScript [-ScriptBlock] <ScriptBlock> [-OutputMetaData] [<CommonParameters>]
```
