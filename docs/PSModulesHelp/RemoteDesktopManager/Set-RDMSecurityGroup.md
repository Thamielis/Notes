Set-RDMSecurityGroup
--------------------

### Synopsis
Save/set the security group.

---

### Description

Save/set the SecurityGroup. SecurityGroup must be first fetch via SecurityGroup property of the Get-RDMSecurityGroup cmdlet or via the New-RDMSecurityGroup result.

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
#### **SecurityGroup**
Security group object, must be retrieved from Get-RDMSecurityGroup or created via New-RDMSecurityGroup.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[PSSecurityGroupInfo]`|true    |1       |false        |

---

### Inputs
None

---

### Outputs
* None

---

### Notes
For more information, type "Get-Help Set-RDMSecurityGroup -detailed". For technical information, type "Get-Help Set-RDMSecurityGroup -full".

---

### Syntax
```PowerShell
Set-RDMSecurityGroup [-SecurityGroup] <PSSecurityGroupInfo> [<CommonParameters>]
```
