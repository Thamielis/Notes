Enable-VBRCloudSubUser
----------------------

### Synopsis
Enables disabled cloud subuser accounts.

---

### Description

This cmdlet enables selected cloud subtenant accounts that were previously disabled. You can enable the following types of cloud subtenant accounts:
- Simple cloud subtenant accounts
- vCD Cloud subtenant accounts
Run the Disable-VBRCloudSubUser cmdlet to disable the subtenant account.

---

### Related Links
* [Get-VBRCloudSubUser](Get-VBRCloudSubUser)

---

### Examples
> Example

$subtenant = Get-VBRCloudSubTenant -Name "Alpha"
Enable-VBRCloudSubTenant -SubTenant $subtenant
This example shows how to enable a cloud subtenant.

Perform the following steps:
1. Run the Get-VBRCloudSubUser cmdlet. Specify the Name parameter value. Save the result to the $subuser variable.
2. Run the Enable-VBRCloudSubUser cmdlet. Set the $subuser variable as the SubUser parameter value.

---

### Parameters
#### **SubUser**
Specifies the array of cloud subusers you want to enable. The subusers can have different parents. Accepts the VBRCloudSubUser[] object. To get this object, run the Get-VBRCloudSubUser cmdlet.

|Type                  |Required|Position|PipelineInput                 |
|----------------------|--------|--------|------------------------------|
|`[IVBRCloudSubUser[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
Veeam.Backup.PowerShell.Infos.IVBRCloudSubUser[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Enable-VBRCloudSubUser -SubUser <IVBRCloudSubUser[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
