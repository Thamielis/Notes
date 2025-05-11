Disable-VBRCloudSubTenant
-------------------------

### Synopsis
Disables cloud subtenant accounts.

---

### Description

This cmdlet disables a cloud subtenant account. When you disable a subtenant account, the subtenant cannot use their account resources. You can disable cloud subtenant accounts of the following types:
- Simple cloud subtenant accounts
- vCD Cloud subtenant accounts
Run Enable-VBRCloudSubTenant to enable a disabled account.

---

### Related Links
* [Get-VBRCloudSubTenant](Get-VBRCloudSubTenant)

---

### Examples
> Example - Disabling Cloud Subtenant

$subtenant = Get-VBRCloudSubTenant -Name "Alpha"
Disable-VBRCloudSubTenant -SubTenant $subtenant
This example shows how to disable a cloud subtenant.

Perform the following steps:
1. Run the Get-VBRCloudSubTenant cmdlet. Specify the Name parameter value. Save the result to the $subtenant variable.
2. Run the Disable-VBRCloudSubTenant cmdlet. Set the $subtenant variable as the SubTenant parameter value.

---

### Parameters
#### **SubTenant**
Specifies the array of cloud subtenants you want to disable. The subtenants can have different parents. Accepts the VBRCloudSubTenant[] object. To get this object, run the Get-VBRCloudSubTenant cmdlet.

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
Disable-VBRCloudSubTenant -SubTenant <IVBRCloudSubTenant[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
