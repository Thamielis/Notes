Remove-VBRCloudProviderCredentials
----------------------------------

### Synopsis
Removes cloud provider credentials records from Veeam Backup & Replication.

---

### Description

This cmdlet removes cloud provider credentials records from Veeam Backup & Replication.

---

### Related Links
* [Get-VBRCloudProviderCredentials](Get-VBRCloudProviderCredentials)

---

### Examples
> Example - Removing Cloud Provider Credentials Records

$creds = Get-VBRCloudProviderCredentials -Name "Cloud credentials"
Remove-VBRCloudProviderCredentials -Credentials $creds -Confirm
This example shows how to remove cloud provider credentials records.

Perform the following steps:
1. Run the Get-VBRCloudProviderCredentials cmdlet. Specify the Name parameter value. Save the result to the $creds variable.
2. Run the Remove-VBRCloudProviderCredentials cmdlet. Set the $creds variable as the Credentials parameter value. Provide the Confirm parameter.

---

### Parameters
#### **Credentials**
Specifies cloud provider credentials records that you want to remove. Accepts the VBRCloudProviderCredentials object. To get this object, run the Get-VBRCloudProviderCredentials cmdlet.

|Type                           |Required|Position|PipelineInput |
|-------------------------------|--------|--------|--------------|
|`[VBRCloudProviderCredentials]`|true    |0       |True (ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRCloudProviderCredentials

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRCloudProviderCredentials [-Credentials] <VBRCloudProviderCredentials> [-Confirm] [-WhatIf] [<CommonParameters>]
```
