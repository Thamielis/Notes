Set-PSMDCmdletBinding
---------------------

### Synopsis
Adds cmdletbinding attributes in bulk

---

### Description

Searches the specified file(s) for functions that ...
- Do not have a cmdlet binding attribute
- Do have a param block
and inserts a cmdletbinding attribute for them.

Will not change files where functions already have this attribute. Will also update internal functions.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ChildItem .\functions\*\*.ps1 | Set-PSMDCmdletBinding
Updates all commands in the module to have a cmdletbinding attribute.
```

---

### Parameters
#### **FullName**
The file to process

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|true    |1       |true (ByValue, ByPropertyName)|

#### **DisableCache**
By default, this command caches the results of its execution in the PSFramework result cache.
This information can then be retrieved for the last command to do so by running Get-PSFResultCache.
Setting this switch disables the caching of data in the cache.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them
#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

---

### Syntax
```PowerShell
Set-PSMDCmdletBinding [-FullName] <String[]> [-DisableCache] [-WhatIf] [-Confirm] [<CommonParameters>]
```
