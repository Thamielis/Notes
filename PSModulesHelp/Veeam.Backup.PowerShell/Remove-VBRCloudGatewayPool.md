Remove-VBRCloudGatewayPool
--------------------------

### Synopsis
Removes cloud gateway pools.

---

### Description

This cmdlet removes selected cloud gateway pools from the backup infrastructure. When you remove the cloud gateway pool, the cloud gateways are not removed from your cloud infrastructure. They will show up as the cloud gateways.

---

### Related Links
* [Get-VBRCloudGatewayPool](Get-VBRCloudGatewayPool)

---

### Examples
> Example - Removing Cloud Gateway Pool

$pool = Get-VBRCloudGatewayPool -Name "New Cloud Pool"
Remove-VBRCloudGatewayPool -CloudGatewayPool $pool
This example shows how to remove a cloud gateway pool.

Perform the following steps:
1. Run the Get-VBRCloudGatewayPool cmdlet. Specify the Name parameter value. Save the result to the $pool variable.
2. Run the Remove-VBRCloudGatewayPool cmdlet. Set the $pool variable as the CloudGatewayPool parameter value.

---

### Parameters
#### **CloudGatewayPool**
Specifies an array of cloud gateways pools that you want to remove. Accepts the VBRCloudGatewayPool[] object. To get this object, run the Get-VBRCloudGatewayPool cmdlet.

|Type                     |Required|Position|PipelineInput |
|-------------------------|--------|--------|--------------|
|`[VBRCloudGatewayPool[]]`|true    |named   |True (ByValue)|

#### **Force**
Defines that the cmdlet will remove cloud gateway pools without warning even if there are tenants assigned to that cloud gateway pool.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

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
Remove-VBRCloudGatewayPool -CloudGatewayPool <VBRCloudGatewayPool[]> [-Force] [-Confirm] [-WhatIf] [<CommonParameters>]
```
