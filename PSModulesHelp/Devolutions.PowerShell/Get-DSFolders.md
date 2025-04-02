Get-DSFolders
-------------

### Synopsis
Gets all folders for a given vault.

---

### Description

Gets all folders for a given vaults and include all subfolders if 'IncludeSubFolders' flag is present.

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> Get-DSFolders -VaultId '00000000-0000-0000-0000-000000000000' -IncludeSubFolders
Return all folders and subfolders in default vault
```

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **IncludeSubFolders**
Used to select if subfolders should be included

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **VaultID**
Folder's ID

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* [Management.Automation.PSObject[]](https://learn.microsoft.com/en-us/dotnet/api/System.Management.Automation.PSObject[])

* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[System.Management.Automation.PSObject, System.Management.Automation, Version=3.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35]]

---

### Notes
For more information, type "Get-Help Get-DSFolders -detailed". For technical information, type "Get-Help Get-DSFolders -full".

---

### Syntax
```PowerShell
Get-DSFolders -VaultID <Guid> [[-IncludeSubFolders]] [-AsLegacyResponse] [<CommonParameters>]
```
