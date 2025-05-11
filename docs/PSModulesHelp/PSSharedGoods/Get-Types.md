Get-Types
---------

### Synopsis
Retrieves the enum values of the specified types.

---

### Description

This function takes an array of types and returns the enum values of each type.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Types -Types [System.DayOfWeek]
Retrieves the enum values of the System.DayOfWeek type.
```
> EXAMPLE 2

```PowerShell
Get-Types -Types [System.ConsoleColor, System.EnvironmentVariableTarget]
Retrieves the enum values of the System.ConsoleColor and System.EnvironmentVariableTarget types.
```

---

### Parameters
#### **Types**
Specifies the types for which enum values need to be retrieved.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-Types [[-Types] <Object>] [<CommonParameters>]
```
