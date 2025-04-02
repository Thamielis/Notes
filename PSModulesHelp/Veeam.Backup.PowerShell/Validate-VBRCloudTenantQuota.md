Validate-VBRCloudTenantQuota
----------------------------

### Synopsis
WARNING! This cmdlet is for internal use only!

---

### Description

---

### Examples
> Example 1

---

### Parameters
#### **ScaleOutBackupRepository**

|Type                           |Required|Position|PipelineInput                 |
|-------------------------------|--------|--------|------------------------------|
|`[VBRScaleOutBackupRepository]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Tenants**

|Type                 |Required|Position|PipelineInput                 |
|---------------------|--------|--------|------------------------------|
|`[IVBRCloudTenant[]]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.IVBRCloudTenant[]

Veeam.Backup.PowerShell.Infos.VBRScaleOutBackupRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Validate-VBRCloudTenantQuota -ScaleOutBackupRepository <VBRScaleOutBackupRepository> [-Tenants <IVBRCloudTenant[]>] [<CommonParameters>]
```
