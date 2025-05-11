Convert-VBRNASBackupStorageFormat
---------------------------------

### Synopsis
Converts format of baskets used for storing backups created with file share backup and file share backup copy jobs.

---

### Description

The cmdlet converts format of baskets used for storing backups created with file share backup and file share backup copy jobs. File share backups can be stored either in baskets containing up to 16 standard blob files each up to 64 MB in size, or in single file baskets containing one file up to 1 GB in size. To provide better performance, it is recommended to convert backups that are stored on HPE StoreOnce storage appliances and Dell Data Domain storage systems into the single file basket format.

NOTE:
- If the backups created by the backup job are stored not only in the backup repository, but also in the archive repository, all of them will be converted when running this cmdlet.
- Archive backups stored on S3 repositories cannot be converted into the single file basket format. If you try to convert such backups, the cmdlet will return a warning about that.

---

### Related Links
* [Get-VBRUnstructuredBackupJob](Get-VBRUnstructuredBackupJob)

* [Get-VBRUnstructuredBackupCopyJob](Get-VBRUnstructuredBackupCopyJob)

---

### Examples
> Example 1. Converting File Share Backup into Single File Basket Format

$job = Get-VBRUnstructuredBackupJob -Name 'Daily NAS backup to StoreOnce'
Convert-VBRNASBackupStorageFormat -Job $job -BasketType SingleFileBasket
This example shows how to convert backups created by a file share backup job into the single file basket format.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupJob cmdlet. Specify the Name parameter value. Save the result to the $job variable.
2. Run the Convert-VBRNASBackupStorageFormat cmdlet. Specify the following settings:
- Set the $job variable as the Job parameter value.
- Specify the SingleFileBasket value for the BasketType parameter value.
> Example 2. Converting File Share Backup Copy into Classic Basket Format

$copy_job = Get-VBRUnstructuredBackupCopyJob -Name 'Daily NAS backup to StoreOnce'
Convert-VBRNASBackupStorageFormat -Job $copy_job -BasketType Classic
This example shows how to convert backups created by a file share backup job into the classic basket format.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackupCopyJob cmdlet. Specify the Name parameter value. Save the result to the $copy_job variable.
2. Run the Convert-VBRNASBackupStorageFormat cmdlet. Specify the following settings:
- Set the $copy_job variable as the Job parameter value.
- Specify the Classic value for the BasketType parameter value.

---

### Parameters
#### **BasketType**
Specifies a basket type into which file share backups will be converted. You can specify either of the following values:
* Automatic: use this option to automatically convert backups into the recommended format based on the type of the storage specified in file share backup jobs or file share backup copy jobs.
* SingleFileBasket: use this option to convert backups into single file baskets containing one file up to 1 GB in size.
* Classic: use this option to convert backups into classic containing up to 16 standard blob files each up to 64 MB in size.
If you do not specify this parameter, the cmdlet will use the Automatic setting for conversion by default.
Valid Values:

* Automatic
* SingleFileBasket
* Classic

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[VBRBasketType]`|false   |named   |False        |

#### **Job**
Specifies an array of file share backup jobs or file share backup copy jobs. The cmdlet will convert backups created by these jobs into the specified format. Accepts the CBackupJob[] object. To get this object, run the Get-VBRUnstructuredBackupJob or Get-VBRUnstructuredBackupCopyJob cmdlet.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[CBackupJob[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackupJob[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Convert-VBRNASBackupStorageFormat [-BasketType {Automatic | SingleFileBasket | Classic}] -Job <CBackupJob[]> [-RunAsync] [<CommonParameters>]
```
