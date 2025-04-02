Get-RDMSecurityGroup
--------------------

### Synopsis
Retrieve the list of available security groups.

---

### Description

Retrieve the list of available security groups for the current selected data source. Security group list contains a column "Session" that can be directly manipulated then updated. (see Set-RDMSessionCommand for more detail).

---

### Related Links
* [Get-RDMSecurityGroup](Get-RDMSecurityGroup)

* [Set-RDMSecurityGroup](Set-RDMSecurityGroup)

* [Set-RDMSecurityGroupProperty](Set-RDMSecurityGroupProperty)

* [New-RDMSecurityGroup](New-RDMSecurityGroup)

* [Remove-RDMSecurityGroup](Remove-RDMSecurityGroup)

---

### Examples
> EXAMPLE 1

```PowerShell
PS C:\> Get-RDMSecurityGroup
Retrieves the list of available security groups.
```
> EXAMPLE 2

```PowerShell
PS C:\> $list = Get-RDMSecurityGroup; $list[0]
Retrieves the list of available security groups and displays the first item.
```
> EXAMPLE 3

```PowerShell
PS C:\> $list = Get-RDMSecurityGroup; $list[1].Name = "New Name";Set-RDMSecurityGroup $list[1]
Retrieves the list of available security groups, modify the name of the second security group, update the security group.
```

---

### Parameters
#### **CaseSensitive**
Case sensitive

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

#### **Name**
Security group name

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

---

### Inputs
System.String

Security group name

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSSecurityGroupInfo[]

---

### Notes
For more information, type "Get-Help Get-RDMSecurityGroup -detailed". For technical information, type "Get-Help Get-RDMSecurityGroup -full".

---

### Syntax
```PowerShell
Get-RDMSecurityGroup [[-CaseSensitive]] [[-Name] <String>] [<CommonParameters>]
```
