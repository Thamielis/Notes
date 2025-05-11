Get-RDMRole
-----------

### Synopsis
Retrieve the list of available roles.

---

### Description

Retrieve the list of available roles for the current selected data source..

---

### Related Links
* [Set-RDMRole](Set-RDMRole)

* [New-RDMRole](New-RDMRole)

* [Set-RDMRoleProperty](Set-RDMRoleProperty)

* [Remove-RDMRole](Remove-RDMRole)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMRole
Retrieves the list of available role.
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMRole; $list[0]
Retrieves the list of available roles and displays the first item.
```
> EXAMPLE 3

```PowerShell
PS C:\> $list = Get-RDMRole; $list[1].Name = "New Name";Set-RDMRole $list[1]
Retrieves the list of available roles, modify the name of the second role, update the role.
```

---

### Parameters
#### **CaseSensitive**
Case sensitive

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **Name**
Role name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
System.String

Role name

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSRoleInfo[]

---

### Notes
For more information, type "Get-Help Get-RDMRole -detailed". For technical information, type "Get-Help Get-RDMRole -full".

---

### Syntax
```PowerShell
Get-RDMRole [[-CaseSensitive]] [[-Name] <String>] [<CommonParameters>]
```
