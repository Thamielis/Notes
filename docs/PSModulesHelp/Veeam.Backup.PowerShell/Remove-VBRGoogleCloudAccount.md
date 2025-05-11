Remove-VBRGoogleCloudAccount
----------------------------

### Synopsis
Removes Google Cloud credentials records from Veeam Backup & Replication.

---

### Description

This cmdlet removes Google Cloud credentials records from Veeam Backup & Replication.

---

### Related Links
* [Get-VBRGoogleCloudAccount](Get-VBRGoogleCloudAccount)

---

### Examples
> Removing Google Cloud Credentials Record

$creds = Get-VBRGoogleCloudAccount -AccessKey "ABCDEFGHIGKLMNOP"
Remove-VBRGoogleCloudAccount -Account $creds
This example shows how to remove a Google Cloud credentials record.
Perform the following steps:
1. Run the Get-VBRGoogleCloudAccount cmdlet. Specify the AccessKey parameter value. Save the result to the $creds variable.
2. Run the Remove-VBRGoogleCloudAccount cmdlet. Set the $creds variable as the Account parameter value.

---

### Parameters
#### **Account**
Specifies Google Cloud credentials records that you want to remove.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[VBRGoogleCloudAccount]`|true    |named   |True (ByPropertyName, ByValue)|

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
Veeam.Backup.PowerShell.Infos.VBRGoogleCloudAccount

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Remove-VBRGoogleCloudAccount -Account <VBRGoogleCloudAccount> [-Confirm] [-WhatIf] [<CommonParameters>]
```
