Publish-VBRArchiveRestorePoint
------------------------------

### Synopsis
Retrieves data from archive storage.

---

### Description

This cmdlet retrieves the backup files from the archive storage to the capacity extent of the scale-out backup repository. This is necessary for restore from archived backups.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

---

### Examples
> Example 1. Retrieving Backup Files from Amazon S3 Glacier Archive Extent

$backup = Get-VBRBackup -Name "JOB_2"
$rp = Get-VBRRestorePoint -Backup $backup
Publish-VBRArchiveRestorePoint -RestorePoint $rp[0] -AvailabilityPeriodDays 3 -AmazonS3GlacierRetrievalPolicy Standard
This example shows how to retrieve backup files from the Amazon S3 Glacier archive extent of the scale-out backup repository.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value.  Save the result to the $rp variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the first restore point in the array).
3. Run the Publish-VBRArchiveRestorePoint cmdlet. Specify the following settings:
- Set the $rp variable as the RestorePoint parameter value.
- Specify the AvailabilityPeriodDays parameter value.
- Set the Standard option for the AmazonS3GlacierRetrievalPolicy parameter.
> Example 2. Retrieving Data from Amazon S3 Glacier Archive Storage for Multiple Restore Points

Get-VBRRestorePoint
$RPIds = @('fdea6323-e018-44ef-abf3-346e0453134b', 'c57cc164-773f-494a-8fb5-aa960cba0f2d', '3898ab90-4419-4bea-b1a2-b13b93170ad3' )
foreach ($restorePointId in $RPIds)
{
   $restorepoint = Get-VBRRestorePoint -Id $restorePointId
   Publish-VBRArchiveRestorePoint -RestorePoint $restorepoint -AvailabilityPeriodDays 5 -AmazonS3GlacierRetrievalPolicy Standard -RunAsync
}
This example shows how to retrieve several restore points from the Amazon S3 Glacier archive storage with the following settings:
- Data retrieval will take from 3-5 hours.
- The retrieved archive backup files will be available for 5 days.
Perform the following steps:
1. Get a list of all restore points. Run the Get-VBRRestorePoint cmdlet. The cmdlet will return an array of restore points of tenant backups located in the archive tier. Select the necessary restore points from an array of restore points.
2. Define an array of restore points. Specify the necessary restore point IDs. Save the result to the $RPIds variable.
3. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
4. Run the foreach statement.
a. Set the $restorePointId as a variable and the $RPIds as a collection. With each iteration, the foreach statement will set the $restorePointId variable to the next value in the $RPIds collection.
b. Specify the Get-VBRRestorePoint and Publish-VBRArchiveRestorePoint cmdlets. With each iteration, the foreach statement will execute these cmdlets.

---

### Parameters
#### **AmazonS3GlacierRetrievalPolicy**
Defines the method of data retrieval for Amazon S3 Glacier object storage. You can retrieve data using one of the following methods:
* Expedited
* Standard
* Bulk
Valid Values:

* Expedited
* StandardAccelerated
* Standard
* Bulk

|Type                                 |Required|Position|PipelineInput|
|-------------------------------------|--------|--------|-------------|
|`[VBRAmazonS3GlacierRetrievalPolicy]`|true    |named   |False        |

#### **AvailabilityPeriodDays**
Specifies a period (in days) during which the retrieved archive backup files will be available.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|true    |named   |False        |

#### **AzureArchiveRetrievalPolicy**
Defines the method of data retrieval for Azure Archive storage. You can retrieve data using one of the following methods:
* StandardPriority
* HHighPriority
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
For the EnableExpirationNotification parameter. Specifies the moment when the user receives the notification about upcoming expiration of the retrieved archive backup files availability.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RestorePoint**
Specifies the restore point for which you want to execute publish.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[COib]`|true    |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **S3GlacierCompatibleRetrievalPolicy**
Defines the method of data retrieval for S3 compatible object storage with with data archiving. You can retrieve data using one of the following methods:
* Expedited
* Standard
* Bulk
Valid Values:

* Expedited
* Standard
* Bulk

|Type                                     |Required|Position|PipelineInput|
|-----------------------------------------|--------|--------|-------------|
|`[VBRS3GlacierCompatibleRetrievalPolicy]`|true    |named   |False        |

---

### Inputs
None

---

### Outputs
* Veeam.Backup.PowerShell.Infos.VBRPublishedBackupSession

---

### Notes

---

### Syntax
```PowerShell
Publish-VBRArchiveRestorePoint -AmazonS3GlacierRetrievalPolicy {Expedited | StandardAccelerated | Standard | Bulk} -AvailabilityPeriodDays <UInt32> [-EnableExpirationNotification] [-ExpirationHoursThreshold 
```
```PowerShell
<Int32>] -RestorePoint <COib> [-RunAsync] [<CommonParameters>]
```
```PowerShell
Publish-VBRArchiveRestorePoint -AvailabilityPeriodDays <UInt32> -AzureArchiveRetrievalPolicy {StandardPriority | HighPriority} [-EnableExpirationNotification] [-ExpirationHoursThreshold <Int32>] -RestorePoint 
```
```PowerShell
<COib> [-RunAsync] [<CommonParameters>]
```
```PowerShell
Publish-VBRArchiveRestorePoint -AvailabilityPeriodDays <UInt32> [-EnableExpirationNotification] [-ExpirationHoursThreshold <Int32>] -RestorePoint <COib> [-RunAsync] -S3GlacierCompatibleRetrievalPolicy 
```
```PowerShell
{Expedited | Standard | Bulk} [<CommonParameters>]
```
