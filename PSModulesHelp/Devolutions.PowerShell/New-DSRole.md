New-DSRole
----------

### Synopsis
Create a new role.

---

### Description

Create a new role and pre-validate offlineMode value, if supplied.

---

### Related Links
* [Get-DSRole](Get-DSRole)

* [Remove-DSRole](Remove-DSRole)

* [Update-DSRole](Update-DSRole)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> New-DSRole -AuthenticationType Builtin -Name NoDeleteNoOffline -Description "Role where the user can not delete and offline mode is disabled." -CanAdd -CanEdit -AllowDragAndDrop -OfflineMode Disabled
Create a role where the user is allowed to add and edit entries. Deleting entries is not allowed.
```

---

### Parameters
#### **AllowDragAndDrop**
Allow the drag and drop option

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AuthenticationType**
Authentication type. Builtin by default.
Valid Values:

* Builtin
* LocalWindows
* SqlServer
* Domain
* Office365
* None
* Cloud
* Legacy
* AzureAD
* Application
* Okta
* PingOne

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[ServerUserType]`|false   |named   |false        |

#### **CanAdd**
Allow the user to add

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CanDelete**
Allow the user to delete

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CanEdit**
Allow the user to edit

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Description**
Role's description

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DomainName**
Domain name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **IsAdministrator**
Give the administrative rights

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Name**
Role's name

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|true    |named   |false        |DisplayName|

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

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.Private.ServerResponse

---

### Notes
For more information, type "Get-Help New-DSRole -detailed". For technical information, type "Get-Help New-DSRole -full".

---

### Syntax
```PowerShell
New-DSRole [-AuthenticationType <Builtin | Domain | AzureAD>] -Name <String> [-Description <String>] [-IsAdministrator] [-AllowDragAndDrop] [-CanAdd] [-CanEdit] [-CanDelete] [-OfflineMode <Cache | Disabled | ReadOnly | ReadWrite>] [-DomainName <String>] [-AsLegacyResponse] [<CommonParameters>]
```
