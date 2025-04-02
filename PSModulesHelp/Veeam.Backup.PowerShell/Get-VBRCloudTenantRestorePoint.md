Get-VBRCloudTenantRestorePoint
------------------------------

### Synopsis
Returns restore points of non-encrypted backups for AD tenants and tenants managed by the Service Provider.

---

### Description

This cmdlet returns restore points of non-encrypted backups for AD tenants and tenants managed by the Service Provider. You can get the following types of restore points:
- All restore points.
- Restore points by their ID.
- Restore points by a VM name.
- Restore points for specific backups.

---

### Examples
> Getting Restore Points of Non-Encrypted Backups for AD Tenants and Tenants Managed by Service Provider

```PowerShell
Get-VBRCloudTenantRestorePoint
This command returns all the restore points of non-encrypted backups for AD tenants and tenants managed by the Service Provider.
```

---

### Parameters
#### **Backup**
Specifies the array of non-encrypted tenant backups. The cmdlet will return restore points of these backups.

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRCloudTenantBackup[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Id**
Specifies an array of the backup IDs. The cmdlet will return backups with these IDs.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Guid[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **Name**
Specifies an array of the VM names. The cmdlet will return restore points for these VMs.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
System.Guid[]

System.String[]

Veeam.Backup.PowerShell.Infos.VBRCloudTenantBackup[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRCloudTenantRestorePoint [-Backup <VBRCloudTenantBackup[]>] [-Id <Guid[]>] [-Name <String[]>] [<CommonParameters>]
```
