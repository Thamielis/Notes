New-PSRegistry
--------------

### Synopsis
Provides a way to create new registry paths

---

### Description

Provides a way to create new registry paths

---

### Examples
> EXAMPLE 1

```PowerShell
New-PSRegistry -RegistryPath "HKCU:\\Tests1\CurrentControlSet\Control\Lsa" -Verbose -WhatIf
```
> EXAMPLE 2

```PowerShell
New-PSRegistry -RegistryPath "HKCU:\\Tests1\CurrentControlSet\Control\Lsa"
```

---

### Parameters
#### **ComputerName**
The computer to run the command on. Defaults to local computer.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **RegistryPath**
Registry Path to Create

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

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
New-PSRegistry [[-ComputerName] <String[]>] [-RegistryPath] <String> [-Suppress] [-WhatIf] [-Confirm] [<CommonParameters>]
```
