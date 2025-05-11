Get-VBRPublicCloudRestorePoint
------------------------------

### Synopsis
This cmdlet is for internal use only.

---

### Description

WARNING! This cmdlet is for internal use only.

---

### Examples
> Example 1

---

### Parameters
#### **Backup**

|Type                      |Required|Position|PipelineInput                 |
|--------------------------|--------|--------|------------------------------|
|`[VBRPublicCloudBackup[]]`|false   |named   |True (ByPropertyName, ByValue)|

#### **BackupType**

Valid Values:

* AzureIaas
* AWSEC2
* GCE

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VBRPublicCloudBackupType]`|true    |named   |False        |

#### **Id**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Guid[]]`|true    |named   |False        |

#### **Name**

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRPublicCloudBackup[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Get-VBRPublicCloudRestorePoint [-Backup <VBRPublicCloudBackup[]>] [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRPublicCloudRestorePoint -BackupType {AzureIaas | AWSEC2 | GCE} [-Name <String[]>] [<CommonParameters>]
```
```PowerShell
Get-VBRPublicCloudRestorePoint -Id <Guid[]> [<CommonParameters>]
```
