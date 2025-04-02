Disable-VBRCloudGateway
-----------------------

### Synopsis
Disables cloud gateways.

---

### Description

This cmdlet disables a selected cloud gateway. Disabling a gateway temporarily suspends all operations on it. Run the Enable-VBRCloudGateway cmdlet to enable a disabled cloud gateway.

---

### Related Links
* [Get-VBRCloudGateway](Get-VBRCloudGateway)

---

### Examples
> Example 1. Disabling Cloud Gateway [Using Variable]

$cloudgateway = Get-VBRCloudGateway -Name "Cloud gateway"
Disable-VBRCloudGateway -CloudGateway $cloudgateway
This example shows how to disable the selected cloud gateway.

Perform the following steps:
1. Run the Get-VBRCloudGateway cmdlet. Specify the Name parameter value. Save the result to the $cloudgateway variable.
2. Run the Disable-VBRCloudGateway cmdlet. Set the $cloudgateway variable as the CloudGateway parameter value.
> Example 2. Disabling Cloud Gateway [Using Pipeline]

Get-VBRCloudGateway -Name "172.16.12.45" | Disable-VBRCloudGatewaya
This example shows how to disable the selected cloud gateway.

Perform the following steps:
1. Run the Get-VBRCloudGateway cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Disable-VBRCloudGateway cmdlet.

---

### Parameters
#### **CloudGateway**
Specifies the array of cloud gateways you want to disable. Accepts the VBRCloudGateway[] object. To get this object, run the Get-VBRCloudGateway cmdlet.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRCloudGateway[]]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRCloudGateway[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Disable-VBRCloudGateway -CloudGateway <VBRCloudGateway[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
