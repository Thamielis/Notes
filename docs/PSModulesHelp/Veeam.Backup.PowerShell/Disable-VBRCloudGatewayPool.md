Disable-VBRCloudGatewayPool
---------------------------

### Synopsis
Disables cloud gateway pools.

---

### Description

This cmdlet disables selected cloud gateway pools. Disabling a cloud gateway pool temporarily suspends all operations on it. Run the Enable-VBRCloudGatewayPool cmdlet to enable the disabled cloud gateway pools.

---

### Related Links
* [Get-VBRCloudGatewayPool](Get-VBRCloudGatewayPool)

---

### Examples
> Example - Disabling Cloud Gateway Pool

$pool = Get-VBRCloudGatewayPool -Name "New Cloud Pool"
Disable-VBRCloudGatewayPool -CloudGatewayPool $pool
This example shows how to disable a cloud gateway pool.

Perform the following steps:
1. Run the Get-VBRCloudGatewayPool cmdlet. Specify the Name parameter value. Save the result to the $pool variable.
2. Run the Disable-VBRCloudGatewayPool cmdlet. Set the $pool variable as the CloudGatewayPool parameter value.

---

### Parameters
#### **CloudGatewayPool**
Specifies an array of cloud gateway pools that you want to disable. Accepts the VBRCloudGatewayPool[] object. To get this object, run the Get-VBRCloudGatewayPool cmdlet.

|Type                     |Required|Position|PipelineInput |
|-------------------------|--------|--------|--------------|
|`[VBRCloudGatewayPool[]]`|true    |named   |True (ByValue)|

#### **Force**
Defines that the cmdlet will not show the notification about the active sessions of tenants

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
Disable-VBRCloudGatewayPool -CloudGatewayPool <VBRCloudGatewayPool[]> [-Force] [-Confirm] [-WhatIf] [<CommonParameters>]
```
