Remove-VBRCloudSubTenant
------------------------

### Synopsis
Removes cloud subtenant accounts.

---

### Description

This cmdlet removes a selected cloud subtenant account from Veeam Backup & Replication. You can remove subtenant accounts of the following types:
- Simple cloud subtenant accounts
- vCD Cloud subtenant accounts
When you remove a subtenant, all backups stored on the cloud repository on this subtenant are removed permanently. The service provider cannot undo this operation. The resources associated with this subtenant account becomes available for use by the service provider.

---

### Related Links
* [Get-VBRCloudSubTenant](Get-VBRCloudSubTenant)

---

### Examples
> Example - Removing Cloud Subtenant

$subtenant = Get-VBRCloudSubTenant -Name "Alpha"
Remove-VBRCloudSubTenant -SubTenant $subtenant
This example shows how to remove a cloud subtenant.

Perform the following steps:
1. Run the Get-VBRCloudSubTenant cmdlet. Specify the Name parameter value. Save the result to the $subtenant variable.
2. Run the Remove-VBRCloudSubTenant cmdlet. Set the $subtenant variable as the SubTenant parameter value.

---

### Parameters
#### **SubTenant**
Specifies the array of cloud subtenants you want to remove. The subtenants can have different parents. Accepts the VBRCloudSubTenant[] object. To get this object, run the Get-VBRCloudSubTenant cmdlet.

|Type                    |Required|Position|PipelineInput                 |
|------------------------|--------|--------|------------------------------|
|`[IVBRCloudSubTenant[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.IVBRCloudSubTenant[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRCloudSubTenant -SubTenant <IVBRCloudSubTenant[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
