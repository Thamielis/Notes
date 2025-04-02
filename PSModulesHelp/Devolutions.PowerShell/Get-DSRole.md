Get-DSRole
----------

### Synopsis
Fetch one or more existing roles.

---

### Description

Fetch one or more existing roles. Three alternative methods are possible: all roles, a single one or a page of roles.

---

### Related Links
* [New-DSRole](New-DSRole)

* [Remove-DSRole](Remove-DSRole)

* [Update-DSRole](Update-DSRole)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-DSRole -All
Get all the roles
```
> EXAMPLE 2

```PowerShell
PS C:\> Get-DSRole -RoleID $roleID
Get a specific role
```
> EXAMPLE 3

```PowerShell
PS C:\> Get-DSRole -PageNumber 1 -PageSize 10
Get the first page containing 10 roles
```

---

### Parameters
#### **All**
All roles will be fetched.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|true    |named   |false        |GetAll |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PageNumber**
Specify the page of roles fetched. First page is fetched by default.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **PageSize**
Number of roles per page. 10 roles per page by default.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **RoleID**

|Type    |Required|Position|PipelineInput|Aliases|
|--------|--------|--------|-------------|-------|
|`[Guid]`|true    |named   |false        |Id     |

---

### Inputs
None

---

### Outputs
* Devolutions.RemoteDesktopManager.Business.Entities.RoleEntity

* Devolutions.Server.ApiWrapper.Models.RoleBaseReference[]

* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.Server.ApiWrapper.Models.RoleBaseReference, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.RemoteDesktopManager.Business.Entities.RoleEntity, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help Get-DSRole -detailed". For technical information, type "Get-Help Get-DSRole -full".

---

### Syntax
```PowerShell
Get-DSRole -All [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Get-DSRole [-PageNumber <Int32>] [-PageSize <Int32>] [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Get-DSRole -RoleID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
