Set-PSRegistry
--------------

### Synopsis
Sets/Updates registry entries locally and remotely using .NET methods.

---

### Description

Sets/Updates registry entries locally and remotely using .NET methods. If the registry path to key doesn't exists it will be created.

---

### Examples
> EXAMPLE 1

```PowerShell
Set-PSRegistry -RegistryPath 'HKLM\SYSTEM\CurrentControlSet\Services\NTDS\Diagnostics' -Type REG_DWORD -Key "16 LDAP Interface Events" -Value 2 -ComputerName AD1
```
> EXAMPLE 2

```PowerShell
Set-PSRegistry -RegistryPath 'HKLM\SYSTEM\CurrentControlSet\Services\NTDS\Diagnostics' -Type REG_SZ -Key "LDAP Interface Events" -Value 'test' -ComputerName AD1
```
> EXAMPLE 3

```PowerShell
Set-PSRegistry -RegistryPath "HKCU:\\Tests" -Key "LimitBlankPass1wordUse" -Value "0" -Type REG_DWORD
```
> EXAMPLE 4

```PowerShell
Set-PSRegistry -RegistryPath "HKCU:\\Tests\MoreTests\Tests1" -Key "LimitBlankPass1wordUse" -Value "0" -Type REG_DWORD
```
Setting default value

```PowerShell
$ValueData = [byte[]] @(
    0, 1, 0, 0, 9, 0, 0, 0, 128, 0, 0, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3,
    0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3,
    0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3,
    0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3, 0, 3,
    0, 3, 0, 0, 0, 5, 0, 10, 0, 14, 0, 3, 0, 5, 0, 6, 0, 6, 0, 4, 0, 4, 0
)
Set-PSRegistry -RegistryPath "HKEY_CURRENT_USER\Tests" -Key '' -Value $ValueData -Type 'NONE'
```

---

### Parameters
#### **ComputerName**
The computer to run the command on. Defaults to local computer.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **RegistryPath**
Registry Path to Update

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Type**
Registry type to use. Options are:  REG_SZ, REG_EXPAND_SZ, REG_BINARY, REG_DWORD, REG_MULTI_SZ, REG_QWORD, string, expandstring, binary, dword, multistring, qword
Valid Values:

* REG_SZ
* REG_NONE
* None
* REG_EXPAND_SZ
* REG_BINARY
* REG_DWORD
* REG_MULTI_SZ
* REG_QWORD
* string
* binary
* dword
* qword
* multistring
* expandstring

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |3       |false        |

#### **Key**
Registry key to set. If the path to registry key doesn't exists it will be created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Value**
Registry value to set.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |5       |false        |

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
Set-PSRegistry [[-ComputerName] <String[]>] [-RegistryPath] <String> [-Type] <String> [[-Key] <String>] [-Value] <Object> [-Suppress] [-WhatIf] [-Confirm] [<CommonParameters>]
```
