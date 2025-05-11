Add-VBRBackupServerCertificate
------------------------------

### Synopsis
Assigns a self-signed TLS certificate to the Veeam Backup & Replication settings.

---

### Description

This cmdlet adds a self-signed TLS certificate to the Veeam Backup & Replication settings.
Note: With Veeam PowerShell, you cannot create a self-signed certificate or import an SSL certificate from file in the PFX format. You can only select an existing SSL certificate from the Microsoft Windows ?ertificate store. The certificate must be imported into the certificate store beforehand.

---

### Related Links
* [Get-VBRBackupServerCertificate](Get-VBRBackupServerCertificate)

---

### Examples
> Example 1. Generating Self-Signed Certificate

Add-VBRBackupServerCertificate -Name "Veeam Software AG certificate"
This command generates a self-signed certificate in Veeam Backup & Replication.
> Example 2. Importing Certificate from Certificate Store

$certificate = Get-VBRBackupServerCertificate -FromStore | Where FriendlyName -eq "ABC"
Add-VBRBackupServerCertificate -Certificate $certificate
This example shows how to get a certificate from the certificate store and import it to the Veeam Backup & Replication settings.
Perform the following steps:
1. Run the Get-VBRBackupServerCertificate cmdlet. Provide the FromStore parameter value. Pipe the cmdlet output to the Where command to find certificates with ABC in the FriendlyName property. Save the result to the $certificate variable.
2. Run the Add-VBRBackupServerCertificate cmdlet. Set the $certificate variable as the Certificate parameter value.

---

### Parameters
#### **Certificate**
Specifies the certificate you want to use.

|Type                          |Required|Position|PipelineInput                 |
|------------------------------|--------|--------|------------------------------|
|`[VBRBackupServerCertificate]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies a friendly name for the self-signed TLS certificate.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRBackupServerCertificate

System.String

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRBackupServerCertificate -Certificate <VBRBackupServerCertificate> [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Add-VBRBackupServerCertificate -Name <String> [-Confirm] [-WhatIf] [<CommonParameters>]
```
