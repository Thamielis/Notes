Remove-VBRCloudSubUser
----------------------

### Synopsis
Removes cloud subuser accounts.

---

### Description

This cmdlet removes a selected cloud subuser account from Veeam Backup & Replication. You can remove the subuser accounts of the following types:
- Simple cloud tenant accounts
- vCD Cloud tenant accounts
When you remove a subuser, all backups stored on the cloud repository on this subuser are removed permanently. The parent cloud user cannot undo this operation. The resources associated with this subuser account becomes available for use by the cloud user.

---

### Related Links
* [Get-VBRCloudSubUser](Get-VBRCloudSubUser)

---

### Examples
> Example - Removing Cloud Subuser

$subuser = Get-VBRCloudSubUser -Name "Subuser 1"
Remove-VBRCloudSubUser -SubUser $subuser
This example shows how to remove a cloud subuser.

Perform the following steps:
1. Run the Get-VBRCloudSubUser cmdlet. Specify the Name parameter value. Save the result to the $subuser variable.
2. Run the Remove-VBRCloudSubUser cmdlet. Set the $subuser variable as the SubUser parameter value.

---

### Parameters
#### **SubUser**
Specifies the array of cloud subusers you want to remove. The subusers can have different parents. Accepts the VBRCloudSubUser[] object. To get this object, run the Get-VBRCloudSubUser cmdlet.

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
Remove-VBRCloudSubUser -SubUser <IVBRCloudSubUser[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
