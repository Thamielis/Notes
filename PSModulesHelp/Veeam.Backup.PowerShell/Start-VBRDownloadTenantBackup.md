Start-VBRDownloadTenantBackup
-----------------------------

### Synopsis
Downloads tenant backups from capacity tier to performance tier.

---

### Description

This cmdlet downloads tenant backups from capacity tier to performance tier.

---

### Related Links
* [Get-VBRCloudTenant](Get-VBRCloudTenant)

---

### Examples
> Example 1. Downloading Tenant Backup Files

$tenant = Get-VBRCloudTenant -Name "ABC Company"
Start-VBRDownloadTenantBackup -CloudTenant $tenant
This example shows how to download the ABC Company tenant backup files.
Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
2. Run the Start-VBRDownloadTenantBackup cmdlet. Set the $tenant variable as the CloudTenant parameter value.
> Example 2. Downloading all Tenant Backup Files

$tenant = Get-VBRCloudTenant -Name "ABC Company"
Start-VBRDownloadTenantBackup -CloudTenant $tenant -FullBackupChain
This example shows how to download the ABC Company tenant backup files from both active and inactive backup chains.
Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
2. Run the Start-VBRDownloadTenantBackup cmdlet. Set the $tenant variable as the CloudTenant parameter value. Provide the FullBackupChain parameter.

---

### Parameters
#### **CloudTenant**
Specifies an array of cloud tenants. The cmdlet will download tenant backups from capacity tier to performance tier.

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[IVBRCloudTenant[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **FullBackupChain**
Defines that the cmdlet will download tenant backup files from both active and inactive backup chain.
If you do not specify this parameter, the cmdlet will download only tenant backups that belong to an active backup chain.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.IVBRCloudTenant[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRDownloadTenantBackup -CloudTenant <IVBRCloudTenant[]> [-FullBackupChain] [<CommonParameters>]
```
