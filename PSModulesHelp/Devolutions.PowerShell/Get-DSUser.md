Get-DSUser
----------

### Synopsis
Get one or more users

---

### Description

Get a single user, a page of users, or all users.

---

### Related Links
* [New-DSUser](New-DSUser)

* [Remove-DSUSer](Remove-DSUSer)

* [Update-DSUser](Update-DSUser)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-DSUser -All
Get all the users
```
> EXAMPLE 2

```PowerShell
PS C:\> Get-DSUser -UserID $userID
Get a specific user
```
> EXAMPLE 3

```PowerShell
PS C:\> Get-DSUser -PageNumber 1 -PageSize 10
Get the first page containing 10 users
```

---

### Parameters
#### **All**
All users will be fetched.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **AsLegacyResponse**
In versions prior to 2024.2, many DS cmdlets returned a ServerResponse object. Enabling this backward compatibility switch allows scripts developed for earlier versions to function correctly.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PageNumber**
Specify the page of users fetched. First page is fetched by default.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **PageSize**
Number of users per page. 10 users per page by default.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **UserID**

|Type    |Required|Position|PipelineInput|Aliases     |
|--------|--------|--------|-------------|------------|
|`[Guid]`|true    |named   |false        |CandidUserID|

---

### Inputs
None

---

### Outputs
* Devolutions.RemoteDesktopManager.Business.Entities.UserEntity

* Devolutions.RemoteDesktopManager.Business.Models.UserListItem[]

* RemoteDesktopManager.PowerShellModule.Private.DataServerResponse`1[[Devolutions.RemoteDesktopManager.Business.Entities.UserEntity, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

* RemoteDesktopManager.PowerShellModule.Private.MultipleDataServerResponse`1[[Devolutions.RemoteDesktopManager.Business.Models.UserListItem, RemoteDesktopManager.Business, Version=2024.2.1.0, Culture=neutral, PublicKeyToken=null]]

---

### Notes
For more information, type "Get-Help Get-DSUser -detailed". For technical information, type "Get-Help Get-DSUser -full".

---

### Syntax
```PowerShell
Get-DSUser -All [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Get-DSUser [-PageNumber <Int32>] [-PageSize <Int32>] [-AsLegacyResponse] [<CommonParameters>]
```
```PowerShell
Get-DSUser -UserID <Guid> [-AsLegacyResponse] [<CommonParameters>]
```
