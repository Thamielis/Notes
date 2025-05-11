Get-GPOZaurrDictionary
----------------------

### Synopsis
Retrieves a dictionary of Group Policy Objects (GPOs) with their associated types and paths.

---

### Description

This function retrieves a dictionary of Group Policy Objects (GPOs) along with their associated types and paths. It iterates through the GPOs stored in the $Script:GPODitionary variable and constructs a custom object for each GPO containing its name, types, and path.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrDictionary
Retrieves the dictionary of GPOs with their types and paths using the default newline delimiter.
```
> EXAMPLE 2

```PowerShell
Get-GPOZaurrDictionary -Splitter ","
Retrieves the dictionary of GPOs with their types and paths using a comma as the delimiter.
```

---

### Parameters
#### **Splitter**
Specifies the delimiter used to separate multiple types or paths. Default value is [System.Environment]::NewLine.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-GPOZaurrDictionary [[-Splitter] <String>] [<CommonParameters>]
```
