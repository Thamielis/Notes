Set-VBRDefaultGatewayConfiguration
----------------------------------

### Synopsis
Modifies default gateways configuration.

---

### Description

This cmdlet modifies settings of the default gateway. To modify settings, specify new values. The cmdlet will overwrite the previous parameters with new values. The parameters that you omit will remain unchanged.

---

### Related Links
* [Get-VBRDefaultGatewayConfiguration](Get-VBRDefaultGatewayConfiguration)

---

### Examples
> Example - Enabling Routing for Selected Default Gateway Configuration

$c = Get-VBRDefaultGatewayConfiguration
Set-VBRDefaultGatewayConfiguration -Configuration $c -EnableRouting
This example shows how to enable routing for a selected default gateway configuration.
Perform the following steps:
1. Run the Get-VBRDefaultGatewayConfiguration cmdlet. Save the result to the $c variable.
2. Run the Set-VBRDefaultGatewayConfiguration cmdlet. Set the $c variable as the Configuration parameter value. Provide the EnableRouting parameter.

---

### Parameters
#### **Configuration**
Specifies the default gateway configuration that you want to modify. Accepts the VBRDefaultGatewayConfiguration object. To get this object, run the Get-VBRDefaultGatewayConfiguration cmdlet.

|Type                              |Required|Position|PipelineInput                 |
|----------------------------------|--------|--------|------------------------------|
|`[VBRDefaultGatewayConfiguration]`|true    |named   |True (ByPropertyName, ByValue)|

#### **EnableRouting**
Enables routing option for the gateway.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PassThru**
Defines that the command returns the output object to the Windows PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRDefaultGatewayConfiguration

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRDefaultGatewayConfiguration -Configuration <VBRDefaultGatewayConfiguration> [-EnableRouting] [-PassThru] [<CommonParameters>]
```
