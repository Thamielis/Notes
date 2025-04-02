Find-TypesNeeded
----------------

### Synopsis
Finds if specific types are needed among the required types.

---

### Description

This function checks if any of the specified types in $TypesNeeded are among the required types in $TypesRequired. Returns $true if any type is found, otherwise $false.

---

### Examples
> EXAMPLE 1

```PowerShell
Find-TypesNeeded -TypesRequired @('System.String', 'System.Int32') -TypesNeeded @('System.Int32')
Checks if 'System.Int32' is among the required types 'System.String' and 'System.Int32'.
```
> EXAMPLE 2

```PowerShell
Find-TypesNeeded -TypesRequired @('System.Management.Automation.PSCredential', 'System.Net.IPAddress') -TypesNeeded @('System.Net.IPAddress')
Checks if 'System.Net.IPAddress' is needed among the required types 'System.Management.Automation.PSCredential' and 'System.Net.IPAddress'.
```

---

### Parameters
#### **TypesRequired**
Specifies an array of types that are required.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |1       |false        |

#### **TypesNeeded**
Specifies an array of types to check if they are needed.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Array]`|false   |2       |false        |

---

### Syntax
```PowerShell
Find-TypesNeeded [[-TypesRequired] <Array>] [[-TypesNeeded] <Array>] [<CommonParameters>]
```
