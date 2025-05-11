Get-UninstallString
-------------------

### Synopsis
Gets the uninstall string for the searched for program.

---

### Description

This function returns the entire item properties for the matched program, if found in the uninstall key.
Output is limited.

---

### Related Links
* [N/A](N/A)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-UninstallString -ComputerName wrkst01 -Pattern 'Microsoft' -Credential $myCreds
Will return the uninstall string for all programs matching Microsoft in the DisplayName field
Get-UninstallString -ComputerName wrkst01,wrkst01 -Pattern 'Microsoft' -Credential $myCreds
Will return the uninstall string for all programs matching Microsoft in the DisplayName field, from
both computers queried

Get-UninstallString -Pattern 'Microsoft'
Will return the uninstall string for all programs matching Microsoft on the local machine
```

---

### Parameters
#### **Pattern**
Full or partial name of an installed program, on the local or remote computer.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **ComputerName**
Name of the remote computer(s) you wish to query. Accepts from the pipeline, and will accept an array.
If omitted, will query the local machine

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[String[]]`|false   |2       |true (ByValue)|

#### **Credential**
If omitted will attempt to authenticate as domain, or stored credentials

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |3       |false        |

---

### Inputs
Requires a string to search for

---

### Outputs
* Returns a PSCustomeObject, or an array of PSCustomObject

---

### Notes
N/A.

---

### Syntax
```PowerShell
Get-UninstallString [-Pattern] <String> [[-ComputerName] <String[]>] [[-Credential] <PSCredential>] [<CommonParameters>]
```
