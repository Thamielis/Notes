New-RDMSecurityGroup
--------------------

### Synopsis
Create a new security group instance.

---

### Description

Create a security group instance. The instance has not yet been saved. Assign the result to a variable then call "Set-RDMSecurityGroup $s" to save the security group.

---

### Related Links
* [Get-RDMSecurityGroup](Get-RDMSecurityGroup)

* [Set-RDMSecurityGroup](Set-RDMSecurityGroup)

* [Set-RDMSecurityGroupProperty](Set-RDMSecurityGroupProperty)

* [New-RDMSecurityGroup](New-RDMSecurityGroup)

* [Remove-RDMSecurityGroup](Remove-RDMSecurityGroup)

---

### Examples
> EXAMPLE

```PowerShell
PS C:\> $securityGroup = New-RDMSecurityGroup -Name "New SecurityGroup" ;Set-RDMSecurityGroup $securityGroup
Create & save new security group.
```

---

### Parameters
#### **Description**
Security group description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Name**
New security group name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |1       |false        |

#### **SetSecurityGroup**
Save the new security group.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |1       |false        |

---

### Inputs
None

---

### Outputs
* RemoteDesktopManager.PowerShellModule.PSOutputObject.PSSecurityGroupInfo

---

### Notes
For more information, type "Get-Help New-RDMSecurityGroup -detailed". For technical information, type "Get-Help New-RDMSecurityGroup -full".

---

### Syntax
```PowerShell
New-RDMSecurityGroup [-Name] <String> [[-Description] <String>] [[-SetSecurityGroup]] [<CommonParameters>]
```
