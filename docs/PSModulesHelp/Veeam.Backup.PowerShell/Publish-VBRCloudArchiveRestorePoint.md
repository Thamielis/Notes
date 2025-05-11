Publish-VBRCloudArchiveRestorePoint
-----------------------------------

### Synopsis
Retrieves tenant data from archive storage.

---

### Description

This cmdlet retrieves tenant data from archive storage and places them in the capacity tier of scale-out backup repository.

---

### Related Links
* [Get-VBRCloudTenant](Get-VBRCloudTenant)

* [Get-VBRCloudArchiveRestorePoint](Get-VBRCloudArchiveRestorePoint)

---

### Examples
> Example 1. Retrieving Tenant Data from Amazon S3 Glacier Archive Storage

$tenant = Get-VBRCloudTenant -Name "ABC Company"
$restorepoint = Get-VBRCloudArchiveRestorePoint -Tenant $tenant -Id "3e57a915-2755-4297-be14-deddb8564ca9"
Publish-VBRCloudArchiveRestorePoint -RestorePoint $restorepoint -AvailabilityPeriodDays 14 -AmazonS3GlacierRetrievalPolicy Standard -RunAsync
This example shows how to retrieve the ABC Company tenant data from Amazon S3 Glacier archive storage with the following settings:
- Data retrieval will take from 3-5 hours.
- The retrieved archive backup files will be available for 14 days.
Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
2. Run the Get-VBRCloudArchiveRestorePoint cmdlet. Set the $tenant variable as the Tenant parameter value. Specify the Id parameter value. Save the result to the $restorepoint variable.
3. Run the Publish-VBRCloudArchiveRestorePoint cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Specify the AvailabilityPeriodDays parameter value.
- Specify the AmazonS3GlacierRetrievalPolicy parameter value.
- Provide the RunAsync parameter.
> Example 2. Retrieving Tenant Data from Azure Archive Storage

$tenant = Get-VBRCloudTenant -Name "ABC Company"
$restorepoint = Get-VBRCloudArchiveRestorePoint -Tenant $tenant -Id "3e57a915-2755-4297-be14-deddb8564ca9"
Publish-VBRCloudArchiveRestorePoint -RestorePoint $restorepoint -AvailabilityPeriodDays 7 -AzureArchiveRetrievalPolicy StandardPriority -RunAsync
This example shows how to retrieve the ABC Company tenant data from Azure Archive storage with the following settings:
- Data retrieval will take about an hour.
- The retrieved archive backup files will be available for 7 days.
Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
2. Run the Get-VBRCloudArchiveRestorePoint cmdlet. Set the $tenant variable as the Tenant parameter value. Specify the Id parameter value. Save the result to the $restorepoint variable. 3. Run the Publish-VBRCloudArchiveRestorePoint cmdlet. Specify the following settings:
- Set the $restorepoint variable as the RestorePoint parameter value.
- Specify the AvailabilityPeriodDays parameter value.
- Specify the AzureArchiveRetrievalPolicy parameter value.
- Provide the RunAsync parameter.

---

### Parameters
#### **AmazonS3GlacierRetrievalPolicy**
data retrieval for Amazon S3 Glacier object storage. You can retrieve data using one of the following method:
* Expedited: Use this method to retrieve archived data within 1-5 minutes. Note that this is the most expensive method.
* Standard: Use this method to retrieve archived data within 3-5 hours.
* Bulk: Use this method to retrieve archived data within 5-12 hours.
Valid Values:

* Expedited
* StandardAccelerated
* Standard
* Bulk

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRAmazonS3GlacierRetrievalPolicy]`|true    |named   |False        |

#### **AvailabilityPeriodDays**
Specifies a period in days during which the retrieved archive backup files will be available.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|true    |named   |False        |

#### **AzureArchiveRetrievalPolicy**
Defines the method of data retrieval for Azure Archive storage. You can retrieve data using one of the following method:
* StandardPriority: Use this method to retrieve archived data within 15 hours.
* HighPriority: Use this method to retrieve archived data within an hour. Note that this is the most expensive method.
Valid Values:

* StandardPriority
* HighPriority

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[VBRAzureArchiveRetrievalPolicy]`|true    |named   |False        |

#### **EnableExpirationNotification**
Enables sending of notification about upcoming expiration of the retrieved archive backup files availability.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ExpirationHoursThreshold**
For the EnableExpirationNotification parameter.
Specifies the moment when the user receives the notification about upcoming expiration of the retrieved archive backup files availability.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RestorePoint**
Specifies a restore point of tenant backups which you want to retrieve.

|Type          |Required|Position|PipelineInput                 |
|--------------|--------|--------|------------------------------|
|`[CCommonOib]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **S3GlacierCompatibleRetrievalPolicy**
Defines the method of data retrieval for S3 compatible object storage with data archiving. You can retrieve data using one of the following method:
* Expedited: Use this method to retrieve archived data within 1-5 minutes. Note that this is the most expensive method.
* Standard: Use this method to retrieve archived data within 3-5 hours.
* Bulk: Use this method to retrieve archived data within 5-12 hours.
Valid Values:

* Expedited
* Standard
* Bulk

|Type                                     |Required|Position|PipelineInput|
|-----------------------------------------|--------|--------|-------------|
|`[VBRS3GlacierCompatibleRetrievalPolicy]`|true    |named   |False        |

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
Publish-VBRCloudArchiveRestorePoint -AmazonS3GlacierRetrievalPolicy {Expedited | StandardAccelerated | Standard | Bulk} -AvailabilityPeriodDays <UInt32> [-EnableExpirationNotification] 
```
```PowerShell
[-ExpirationHoursThreshold <Int32>] -RestorePoint <CCommonOib> [-RunAsync] [<CommonParameters>]
```
```PowerShell
Publish-VBRCloudArchiveRestorePoint -AvailabilityPeriodDays <UInt32> -AzureArchiveRetrievalPolicy {StandardPriority | HighPriority} [-EnableExpirationNotification] [-ExpirationHoursThreshold <Int32>] 
```
```PowerShell
-RestorePoint <CCommonOib> [-RunAsync] [<CommonParameters>]
```
```PowerShell
Publish-VBRCloudArchiveRestorePoint -AvailabilityPeriodDays <UInt32> [-EnableExpirationNotification] [-ExpirationHoursThreshold <Int32>] -RestorePoint <CCommonOib> [-RunAsync] 
```
```PowerShell
-S3GlacierCompatibleRetrievalPolicy {Expedited | Standard | Bulk} [<CommonParameters>]
```
