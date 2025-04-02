Get-ModulesAvailability
-----------------------

### Synopsis
Checks the availability of a specified module and imports it if available.

---

### Description

This function checks if a specified module is available. If the module is not loaded, it attempts to import it. Returns $true if the module is successfully loaded, otherwise $false.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ModulesAvailability -Name "AzureRM"
Checks if the "AzureRM" module is available and imports it if not already loaded.
```
> EXAMPLE 2

```PowerShell
Get-ModulesAvailability -Name "ActiveDirectory"
Checks the availability of the "ActiveDirectory" module and imports it if necessary.
```

---

### Parameters
#### **Name**
Specifies the name of the module to check and potentially import.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Syntax
```PowerShell
Get-ModulesAvailability [[-Name] <String>] [<CommonParameters>]
```
