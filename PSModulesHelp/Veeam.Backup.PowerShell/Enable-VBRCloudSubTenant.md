Enable-VBRCloudSubTenant
------------------------

### Synopsis
Enables disabled cloud subtenant accounts.

---

### Description

This cmdlet enables selected cloud subtenant accounts that were previously disabled. You can enable the following types of cloud subtenant accounts:
- Simple cloud subtenant accounts
- vCD Cloud subtenant accounts
Run the Disable-VBRCloudSubTenant cmdlet to disable the subtenant account.

---

### Related Links
* [Get-VBRCloudSubTenant](Get-VBRCloudSubTenant)

---

### Examples
> Example - Enabling Cloud Subtenant

$subtenant = Get-VBRCloudSubTenant -Name "Alpha"
Enable-VBRCloudSubTenant -SubTenant $subtenant
This example shows how to enable a cloud subtenant.

Perform the following steps:
1. Run the Get-VBRCloudSubTenant cmdlet. Specify the Name parameter value. Save the result to the $subtenant variable.
2. Run the Enable-VBRCloudSubTenant cmdlet. Set the $subtenant variable as the SubTenant parameter value.

---

### Parameters
#### **SubTenant**
Specifies the array of cloud subtenant you want to enable. The subtenants can have different parents. Accepts the VBRCloudSubTenant[] object. To get this object, run the Get-VBRCloudSubTenant cmdlet.

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
Enable-VBRCloudSubTenant -SubTenant <IVBRCloudSubTenant[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
