Enable-VBRCloudGatewayPool
--------------------------

### Synopsis
Enables disabled cloud gateway pools.

---

### Description

This cmdlet enables cloud gateway pools that have been disabled.

---

### Related Links
* [Get-VBRCloudGatewayPool](Get-VBRCloudGatewayPool)

---

### Examples
> Example - Enabling Cloud Gateway Pool

$pool = Get-VBRCloudGatewayPool -Name "New Cloud Pool"
Enable-VBRCloudGatewayPool -CloudGatewayPool $pool
This example shows how to enable a cloud gateway pool.

Perform the following steps:
1. Run the Get-VBRCloudGatewayPool cmdlet. Specify the Name parameter value. Save the result to the $pool variable.
2. Run the Enable-VBRCloudGatewayPool cmdlet. Set the $pool variable as the CloudGatewayPool parameter value.

---

### Parameters
#### **CloudGatewayPool**
Specifies an array of cloud gateway pools you want to enable. Accepts the VBRCloudGatewayPool[] object. To get this object, run the Get-VBRCloudGatewayPool cmdlet.

|Type                     |Required|Position|PipelineInput |
|-------------------------|--------|--------|--------------|
|`[VBRCloudGatewayPool[]]`|true    |named   |True (ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRCloudGatewayPool[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Enable-VBRCloudGatewayPool -CloudGatewayPool <VBRCloudGatewayPool[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
