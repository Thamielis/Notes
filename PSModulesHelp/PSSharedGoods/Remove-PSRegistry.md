Remove-PSRegistry
-----------------

### Synopsis
Remove registry keys and folders

---

### Description

Remove registry keys and folders using .NET methods

---

### Examples
> EXAMPLE 1

```PowerShell
Remove-PSRegistry -RegistryPath "HKEY_CURRENT_USER\Tests\Ok\MaybeNot" -Recursive
```
> EXAMPLE 2

```PowerShell
Remove-PSRegistry -RegistryPath "HKEY_CURRENT_USER\Tests\Ok\MaybeNot" -Key "LimitBlankPass1wordUse"
```
> EXAMPLE 3

```PowerShell
Remove-PSRegistry -RegistryPath "HKCU:\Tests\Ok"
```

---

### Parameters
#### **ComputerName**
The computer to run the command on. Defaults to local computer.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **RegistryPath**
The registry path to remove.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Key**
The registry key to remove.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Recursive**
Forces deletion of registry folder and all keys, including nested folders

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Suppress**
Suppresses the output of the command. By default the command outputs PSObject with the results of the operation.

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

### Notes
General notes

---

### Syntax
```PowerShell
Remove-PSRegistry [[-ComputerName] <String[]>] [-RegistryPath] <String> [[-Key] <String>] [-Recursive] [-Suppress] [-WhatIf] [-Confirm] [<CommonParameters>]
```
