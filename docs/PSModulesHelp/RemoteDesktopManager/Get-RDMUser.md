Get-RDMUser
-----------

### Synopsis
Retrieve the list of available users.

---

### Description

Retrieve the list of available users for the current selected data source.

---

### Related Links
* [Set-RDMUser](Set-RDMUser)

* [Set-RDMUserProperty](Set-RDMUserProperty)

* [New-RDMUser](New-RDMUser)

* [Remove-RDMUser](Remove-RDMUser)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMUser
Retrieves the list of available user.
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMUser; $list[0]
Retrieves the list of available users and displays the first item.
```
> EXAMPLE 3

```PowerShell
PS C:\> $list = Get-RDMUser; $list[1].Description = "New Description";Set-RDMUser $list[1]
Retrieves the list of available users, modify the name of the second user, update the user.
```

---

### Parameters
#### **CaseSensitive**
Case sensitive

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **Name**
User name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
System.String

User name

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSUserInfo[]

---

### Notes
For more information, type "Get-Help Get-RDMUser -detailed". For technical information, type "Get-Help Get-RDMUser -full".

---

### Syntax
```PowerShell
Get-RDMUser [[-CaseSensitive]] [[-Name] <String>] [<CommonParameters>]
```
