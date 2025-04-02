Get-DSPamFolder
---------------

### Synopsis
Get pam folders

---

### Description

Get pam folders with three alternatives ways: all of them with the optional inclusion of the root folder, a single one by its ID, or the root folder.

---

### Related Links
* [New-DSPamFolder](New-DSPamFolder)

* [Remove-DSPamFolder](Remove-DSPamFolder)

* [Update-DSPamFolder](Update-DSPamFolder)

---

### Parameters
#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FolderID**
Id of the pam folder to get.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|true    |named   |false        |

#### **IncludeFolder**
Root folder will be included with all the others.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Root**
Root folder will be fetched.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs
None

---

### Outputs
* Devolutions.Server.Pam.Dto.PamFolder[]

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.Server.Pam.Dto.PamFolder, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.Server.Pam.Dto.PamFolder, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help Get-DSPamFolder -detailed". For technical information, type "Get-Help Get-DSPamFolder -full".

---

### Syntax
```PowerShell
Get-DSPamFolder -FolderID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Get-DSPamFolder [-IncludeFolder] [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Get-DSPamFolder -Root [-AsLegacyResponse] [<CommonParameters>]
```
