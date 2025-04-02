Update-DSRole
-------------

### Synopsis
Create a new role.

---

### Description

Create a new role and pre-validate offlineMode value, if supplied.

---

### Related Links
* [Get-DSRole](Get-DSRole)

* [New-DSRole](New-DSRole)

* [Remove-DSRole](Remove-DSRole)

---

### Examples
> EXAMPLE

PS C:\> Update-DSRole -RoleId $roleID -IsAdministrator $false -AllowDragAndDrop $false -CanAdd $false -CanEdit $false -CanDelete $false -CanImport $false -CanExport $false -DenyAddInRoot $true -OfflineMode Disabled
Remove all rights (add, delete, edit, export, import, drag and drop, add in root), admistrator status and offline access of the role whose id is $roleID.

---

### Parameters
#### **AllowDragAndDrop**
Allow the drag and drop option

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CanAdd**
Allow the user to add

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **CanDelete**
Allow the user to delete

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **CanEdit**
Allow the user to edit

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **CanExport**
Allow the user to export

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **CanImport**
Allow the user to import

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **DenyAddInRoot**
Prevent the user from adding entries in the root.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Description**
Role's description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IsAdministrator**
Give the administrative rights

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **Name**
Role's name

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|false   |named   |false        |DisplayName|

#### **OfflineMode**
Offline access permissions. Disabled < Read Only < Read/Write
Valid Values:

* Disabled
* Cache
* ReadOnly
* ReadWrite
* Unknown

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[OfflineMode]`|false   |named   |false        |

#### **RoleId**
Id of the role to be updated.

|Type    |Required|Position|PipelineInput|Aliases     |
|--------|--------|--------|-------------|------------|
|`[Guid]`|true    |named   |false        |CandidRoleId|

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help Update-DSRole -detailed". For technical information, type "Get-Help Update-DSRole -full".

---

### Syntax
```PowerShell
Update-DSRole -RoleId <Guid> [-Name <String>] [-Description <String>] [-IsAdministrator <Boolean>] [-AllowDragAndDrop <Boolean>] [-CanAdd <Boolean>] [-CanEdit <Boolean>] [-CanDelete <Boolean>] [-CanImport <Boolean>] [-CanExport <Boolean>] [-DenyAddInRoot <Boolean>] [-OfflineMode <Cache | Disabled | ReadOnly | ReadWrite>] [-AsLegacyResponse] [<CommonParameters>]
```
