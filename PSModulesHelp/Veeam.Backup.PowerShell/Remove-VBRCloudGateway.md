Remove-VBRCloudGateway
----------------------

### Synopsis
Removes cloud gateways.

---

### Description

This cmdlet removes selected cloud gateways from Veeam Backup & Replication console. When you remove a cloud gateway, Veeam Backup & Replication unassigns the gateway role from the server, so it is no longer used as a cloud gateway. The actual server remains connected to Veeam Backup & Replication.

---

### Related Links
* [Get-VBRCloudGateway](Get-VBRCloudGateway)

---

### Examples
> Example 1. Removing Cloud Gateway [Using Variable]

$cloudgateway = Get-VBRCloudGateway -Name "Cloud gateway"
Remove-VBRCloudGateway -CloudGateway $cloudgateway
This example shows how to remove the selected cloud gateway.

Perform the following steps:
1. Run the Get-VBRCloudGateway cmdlet. Specify the Name parameter value. Save the result to the $cloudgateway variable.
2. Run the Remove-VBRCloudGateway cmdlet. Set the $cloudgateway variable as the CloudGateway parameter value.
> Example 2. Removing Cloud Gateway [Using Pipeline]

Get-VBRCloudGateway -Name "172.16.12.45" | Remove-VBRCloudGateway
This example shows how to remove the selected cloud gateway.

Perform the following steps:
1. Run the Get-VBRCloudGateway cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Remove-VBRCloudGateway cmdlet.

---

### Parameters
#### **CloudGateway**
Specifies the array of cloud gateways you want to remove. Accepts the VBRCloudGateway[] object. To get this object, run the Get-VBRCloudGateway cmdlet.

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
Remove-VBRCloudGateway -CloudGateway <VBRCloudGateway[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
