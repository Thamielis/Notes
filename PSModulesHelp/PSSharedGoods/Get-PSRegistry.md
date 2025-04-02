Get-PSRegistry
--------------

### Synopsis
Get registry key values.

---

### Description

Get registry key values.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PSRegistry -RegistryPath 'HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters' -ComputerName AD1
```
> EXAMPLE 2

```PowerShell
Get-PSRegistry -RegistryPath 'HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters'
```
> EXAMPLE 3

```PowerShell
Get-PSRegistry -RegistryPath "HKLM\SYSTEM\CurrentControlSet\Services\DFSR\Parameters" -ComputerName AD1,AD2,AD3 | ft -AutoSize
```
> EXAMPLE 4

```PowerShell
Get-PSRegistry -RegistryPath 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Directory Service'
```
> EXAMPLE 5

```PowerShell
Get-PSRegistry -RegistryPath 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Windows PowerShell' | Format-Table -AutoSize
```
> EXAMPLE 6

```PowerShell
Get-PSRegistry -RegistryPath 'HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Directory Service' -ComputerName AD1 -Advanced
```
> EXAMPLE 7

```PowerShell
Get-PSRegistry -RegistryPath "HKLM:\Software\Microsoft\Powershell\1\Shellids\Microsoft.Powershell\"
```
Get default key and it's value

```PowerShell
Get-PSRegistry -RegistryPath "HKEY_CURRENT_USER\Tests" -Key ""
```
Get default key and it's value (alternative)

```PowerShell
Get-PSRegistry -RegistryPath "HKEY_CURRENT_USER\Tests" -DefaultKey
```

---

### Parameters
#### **RegistryPath**
The registry path to get the values from.

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[String[]]`|false   |1       |false        |Path   |

#### **ComputerName**
The computer to get the values from. If not specified, the local computer is used.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **Key**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **Advanced**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DefaultKey**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ExpandEnvironmentNames**
Expand environment names in the registry value.
By default it doesn't do that. If you want to expand environment names, use this parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DoNotUnmount**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-PSRegistry [[-RegistryPath] <String[]>] [[-ComputerName] <String[]>] [[-Key] <String>] [-Advanced] [-DefaultKey] [-ExpandEnvironmentNames] [-DoNotUnmount] [<CommonParameters>]
```
