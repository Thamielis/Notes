Add-VBRCloudArchiveBackupAvailabilityPeriod
-------------------------------------------

### Synopsis
Extends the availability of the tenant backup files located in the archive storage.

---

### Description

Extends the availability of the tenant backup files located in the archive storage.

---

### Related Links
* [Get-VBRCloudTenant](Get-VBRCloudTenant)

* [Get-VBRCloudArchiveRestorePoint](Get-VBRCloudArchiveRestorePoint)

---

### Examples
> Extending Availability of Tenant Backup Files Located in Archive Storage

$tenant = Get-VBRCloudTenant -Name "ABC Company"
$restorepoint = Get-VBRCloudArchiveRestorePoint -Tenant $tenant -Id "3e57a915-2755-4297-be14-deddb8564ca9"
Add-VBRCloudArchiveBackupAvailabilityPeriod -RestorePoint $restorepoint -AvailabilityPeriodDays 5
This example shows how to extend availability of the 3e57a915-2755-4297-be14-deddb8564ca9 restore point of the ABC Company tenant.
Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
2. Run the Get-VBRCloudArchiveRestorePoint cmdlet. Set the $tenant variable as the Tenant parameter value. Specify the Id parameter value. Save the result to the $restorepoint variable.
3. Run the Add-VBRCloudArchiveBackupAvailabilityPeriod cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Specify the AvailabilityPeriodDays parameter value.

---

### Parameters
#### **AvailabilityPeriodDays**
Specifies a period in days during which the retrieved archive backup files will be available.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|true    |named   |False        |

#### **RestorePoint**
Specifies the restore point for which you want to extend the availability.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CCommonOib]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CCommonOib

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRCloudArchiveBackupAvailabilityPeriod -AvailabilityPeriodDays <UInt32> -RestorePoint <CCommonOib> [-RunAsync] [<CommonParameters>]
```
