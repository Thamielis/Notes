Get-ComputerSMBSharePermissions
-------------------------------

### Synopsis
Retrieves SMB share permissions for specified computers and shares.

---

### Description

This function retrieves SMB share permissions for the specified computers and shares. It provides the option to translate the permissions into a more readable format.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ComputerSMBSharePermissions -ComputerName "Server1" -ShareName "Share1" -Translated
Retrieves SMB share permissions for Server1 and Share1 in a translated format.
```
> EXAMPLE 2

```PowerShell
Get-ComputerSMBSharePermissions -ComputerName "Server1", "Server2" -ShareName "Share1", "Share2"
Retrieves SMB share permissions for multiple servers and shares.
```

---

### Parameters
#### **ComputerName**
Specifies the names of the computers to retrieve SMB share permissions from.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **ShareName**
Specifies the names of the shares to retrieve permissions for.

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[String[]]`|true    |2       |false        |Name   |

#### **Translated**
Indicates whether to translate the permissions into a more readable format.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-ComputerSMBSharePermissions [[-ComputerName] <String[]>] [-ShareName] <String[]> [-Translated] [<CommonParameters>]
```
