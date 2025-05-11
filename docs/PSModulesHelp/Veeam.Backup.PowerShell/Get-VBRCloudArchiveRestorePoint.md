Get-VBRCloudArchiveRestorePoint
-------------------------------

### Synopsis
Returns restore points of tenant backups located in the archive tier.

---

### Description

This cmdlet returns restore points of tenant backups located in the archive tier.
The cloud provider need to run this cmdlet when a tenant wants to restore backups that are stored in the archive extent of the scale-out backup repository. Since the tenant is not able to restore data on his side, he need to contact the cloud provider and specify an Id of the restore point for backups that he wants to restore.

---

### Related Links
* [Get-VBRCloudTenant](Get-VBRCloudTenant)

---

### Examples
> Getting Restore Point of Tenant Backup Stored in Archive Tier

$tenant = Get-VBRCloudTenant -Name "ABC Company"
Get-VBRCloudArchiveRestorePoint -Tenant $tenant -Id "3e57a915-2755-4297-be14-deddb8564ca9"
This example shows how to get the 3e57a915-2755-4297-be14-deddb8564ca9 restore point of the ABC Company tenant.
Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
2. Run the Get-VBRCloudArchiveRestorePoint cmdlet. Set the $tenant variable as the Tenant parameter value. Specify the Id parameter value.

---

### Parameters
#### **Id**
Specifies a restore point ID of tenant backups that you want to restore.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |named   |False        |

#### **Tenant**
Specifies a tenant whose data you want to restore.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRCloudTenant]`|true    |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudTenant

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCloudArchiveRestorePoint [-Id <Guid>] -Tenant <VBRCloudTenant> [<CommonParameters>]
```
