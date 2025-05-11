Remove-VBRDefaultGateway
------------------------

### Synopsis
Removes default cloud gateways.

---

### Description

This cmdlet removes a selected cloud default gateway.

---

### Related Links
* [Get-VBRDefaultGatewayConfiguration](Get-VBRDefaultGatewayConfiguration)

---

### Examples
> Example - Removing Default Gateway [Using Pipeline]

$configuration = Get-VBRDefaultGatewayConfiguration 
$configuration.DefaultGateway | Remove-VBRDefaultGateway
This example shows how to remove a default gateway.

Perform the following steps:
1. Run the Get-VBRDefaultGatewayConfiguration cmdlet. Save it to $configuration variable.
2. Get the default gateway using the DefaultGateway property of the $configuration variable. Pipe the result to the Remove-VBRDefaultGateway cmdlet.

---

### Parameters
#### **Gateway**
Specifies the default cloud gateway you want to remove. Accepts the VBRDefaultGateway object.  To get this object, run the Get-VBRDefaultGatewayConfiguration cmdlet.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[VBRDefaultGateway]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRDefaultGateway

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRDefaultGateway -Gateway <VBRDefaultGateway> [-Confirm] [-WhatIf] [<CommonParameters>]
```
