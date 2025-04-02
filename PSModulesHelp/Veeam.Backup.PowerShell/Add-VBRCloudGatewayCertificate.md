Add-VBRCloudGatewayCertificate
------------------------------

### Synopsis
Assigns a TLS certificate to the service provider.

---

### Description

This cmdlet assigns a TLS certificate to the service provider. You can only use the TLS certificate imported from the certificate store.

---

### Related Links
* [Get-VBRCloudGatewayCertificate](Get-VBRCloudGatewayCertificate)

---

### Examples
> Example - Assigning TLS Certificate to Service Provider

$certificate = Get-VBRCloudGatewayCertificate -FromStore | Where FriendlyName -eq "Omega Company"
Add-VBRCloudGatewayCertificate -Certificate $certificate
This example shows how to get a certificate from the certificate store and assign it to the service provider.

Perform the following steps:
1. Run the Get-VBRCloudGatewayCertificate cmdlet. Provide the FromStore parameter value. Pipe the cmdlet output to the Where command to filter certificates by the FriendlyName parameter. Save the result to the $certificate variable.
2. Run the Add-VBRCloudGatewayCertificate cmdlet. Set the $certificate variable as the Certificate parameter value.

---

### Parameters
#### **Certificate**
Specifies the certificate you want to use. Accepts the VBRCloudCertificate object. To get this object, run the Get-VBRCloudGatewayCertificate cmdlet.

|Type                   |Required|Position|PipelineInput                 |
|-----------------------|--------|--------|------------------------------|
|`[VBRCloudCertificate]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRCloudCertificate

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRCloudGatewayCertificate -Certificate <VBRCloudCertificate> [-Confirm] [-WhatIf] [<CommonParameters>]
```
