Get-VBRCloudUnavailableBackupFile
---------------------------------

### Synopsis
Returns a list of backup files that are no longer available in the cloud repository.

---

### Description

This cmdlet returns a list of backup files that are no longer available in the cloud repository.

---

### Related Links
* [Get-VBRCloudTenant](Get-VBRCloudTenant)

---

### Examples
> Getting Unavailable Backup Files for Cloud Tenant Account

$tenant = Get-VBRCloudTenant -Name "ABC Company"
$backupfiles = Get-VBRCloudUnavailableBackupFile -CloudTenant $tenant
This example shows how to get a list of backup files that are no longer available in the cloud repository for the ABC Company cloud tenant account.
Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
2. Run the Get-VBRCloudUnavailableBackupFile cmdlet. Set the $tenant variable as the CloudTenant parameter value. Save the result to the $backupfiles variable.

---

### Parameters
#### **CloudTenant**
Specifies a cloud tenant account for which you want to get backup files that are no longer available in the cloud repository.

|Type               |Required|Position|PipelineInput                 |
|-------------------|--------|--------|------------------------------|
|`[IVBRCloudTenant]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.IVBRCloudTenant

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCloudUnavailableBackupFile -CloudTenant <IVBRCloudTenant> [<CommonParameters>]
```
