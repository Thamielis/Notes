Disable-VBRCloudSubUser
-----------------------

### Synopsis
Disables cloud subuser accounts.

---

### Description

This cmdlet disables a cloud subuser account. When you disable a subuser account, the subuser cannot use their account resources. You can disable the cloud subtenant accounts of the following types:
- Simple cloud tenant accounts
- vCD Cloud tenant accounts
Run the Enable-VBRCloudSubUser cmdlet to enable a disabled account.

---

### Related Links
* [Get-VBRCloudSubUser](Get-VBRCloudSubUser)

---

### Examples
> Example - Disabling Cloud Subuser

$subuser = Get-VBRCloudSubUser -Name "Subuser 1"
Disable-VBRCloudSubUser -SubUser $subuser
This example shows how to disable a cloud subuser.

Perform the following steps:
1. Run the Get-VBRCloudSubUser cmdlet. Specify the Name parameter value. Save the result to the $subuser variable.
2. Run the Disable-VBRCloudSubUser cmdlet. Set the $subuser variable as the SubUser parameter value.

---

### Parameters
#### **SubUser**
Specifies the array of cloud subusers you want to disable. The subusers can have different parents. Accepts the VBRCloudSubUser[] object. To get this object, run the Get-VBRCloudSubUser cmdlet.

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
Disable-VBRCloudSubUser -SubUser <IVBRCloudSubUser[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
