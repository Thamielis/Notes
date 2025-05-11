Start-VBRZip
------------

### Synopsis
Performs VeeamZIP on the selected VM.

---

### Description

This cmdlet performs VeeamZIP backup of the selected VM.

VeeamZIP is a quick backup procedure always producing a full backup. The VeeamZIP task runs once the time it is created and does not appear in the jobs list. The result backup file is stored in the specified folder and does not appear automatically in the backups list. Run the Import-VBRBackup cmdlet to start managing the backup file with Veeam Backup & Replication.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRCredentials](Get-VBRCredentials)

* [Find-VBRViEntity](Find-VBRViEntity)

* [Find-VBRHvEntity](Find-VBRHvEntity)

---

### Examples
> Example 1. Performing VeeamZIP Backup to Backup Repository

$vm = Find-VBRViEntity -Name "Fileserver01"
$rep = Get-VBRBackupRepository -Name "Reports"
Start-VBRZip -BackupRepository $rep -Entity $vm -RunAsync
This example shows how to perform VeeamZIP backup to a backup repository.
Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $vm variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Save the result to the $rep variable.
3. Run the Start-VBRZip cmdlet. Set the $rep variable as the BackupRepository parameter value. Set the $vm variable as the Entity parameter value. Provide the RunAsync parameter.
> Example 2. Performing VeeamZIP Backup to Shared Folder

$vm = Find-VBRViEntity -Name "Tech"
$netcreds = Get-VBRCredentials -Name "Shared"
Start-VBRZip -Folder "D:\Repository\VeeamZIP" -Entity $vm -Compression 4 -DisableQuiesce -NetworkCredentials $netcreds -RunAsync
This example shows how to perform VeeamZIP backup to a shared folder. The cmdlet starts VeeamZIP with the following parameters:
- Path to the folder where the backups will be stored is D:\Repository\VeeamZIP.
- The compression level is set to 4 (Dedupe-friendly).
- The VMware quiescence is disabled.
- The cmdlet will use Shared credentials for authenticating with the shared folder.
- The RunAsync parameter is set to bring the process to the background.
Perform the following steps:
1. Run the Find-VBRViEntity cmdlet. Specify the Name parameter value. Save the result to the $vm variable.
2. Run the Get-VBRCredentials cmdlet. Specify the Name parameter value. Save the result to the $netcreds variable.
3. Run the Start-VBRZip cmdlet. Specify the following settings:
- Specify the Folder parameter value.
- Set the $vm variable as the Entity parameter value.
- Set the 4 number as the Compression parameter value.
- Provide the ShowAllVersions parameter.
- Set the $netcreds variable as the NetworkCredentials parameter value.
- Provide the RunAsync parameter.

---

### Parameters
#### **AutoDelete**
Specifies the retention settings for the created VeeamZIP file: Never, Tonight, TomorrowNight, In3days, In1Week, In2Weeks, In1Month, In3Months, In6Months, In1Year, In2Years, In3Years, In5Years, In7Years.
Note: Use this parameter if the RetentionPeriodType and RetentionNumber parameters are not specified.
Valid Values:

* Never
* Tonight
* TomorrowNight
* In3days
* In1Week
* In2Weeks
* In1Month
* In3Months
* In6Months
* In1Year
* In2Years
* In3Years
* In5Years
* In7Years

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[EFreeBackupRetention]`|false   |named   |False        |

#### **BackupRepository**
Specifies the backup repository where you want to save the backup file. If none is specified, the default repository will be used.
Note: The cmdlet will not run if you do not specify either the BackupRepository or the Folder parameters.

|Type                 |Required|Position|PipelineInput|
|---------------------|--------|--------|-------------|
|`[CBackupRepository]`|false   |named   |False        |

#### **Compression**
Specifies then integer number corresponding to the desired compression level:
* 0 = None. Consider disabling compression to achieve better deduplication ratios on deduplicating storage appliances at the cost of reduced backup performance.
* 4 = Dedupe-friendly. This is the recommended setting for using with deduplicating storage devices and caching WAN accelerators. This setting is used by default.
* 5 = Optimal (recommended). Optimal compression provides for the best compression to performance ratio, and lowest backup proxy CPU usage.
* 6 = High. High compression provides additional 10% compression ratio over Optimal, at the cost of 8x higher CPU usage.
* 9 = Extreme. Extreme compression provides additional 3% compression ratio over High, at the cost of 2x higher CPU usage.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **DisableQuiesce**
Defines that the cmdlet will back up VM without using the quiescence mechanisms.
If you provide this parameter, you will be able to create a crash-consistent backup of the target VM. Otherwise, the applications that run on the target VM will be quiesced to provide transactionally consistent backup.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **EncryptionKey**
Specifies the encryption key you want to use to encrypt the created VeeamZIP file.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[PSCryptoKey]`|false   |named   |False        |

#### **Entity**
Specifies the array of VMs for which you want to create a VeeamZIP file.

|Type       |Required|Position|PipelineInput                 |
|-----------|--------|--------|------------------------------|
|`[IItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Folder**
Specifies the full path to the folder on the server where you want to store the created backup file.
If omitted, the created backup file will be saved to the C:\backup folder on the Veeam Backup server.
Note: The cmdlet will not run if you do not specify either the BackupRepository or the Folder parameters.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will perform backup even if the geographic location of VMs and the target backup repository location do not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **KMSServer**
Specifies the KMS server you want to use to encrypt the data.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRKMSServer]`|false   |named   |False        |

#### **NetworkCredentials**
Specifies the credentials you want to use for authenticating with the shared folder.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **RetentionNumber**
For the RetentionPeriodType option.
Specifies the period of time to keep the VeeamZIP backups. After this period finishes, Veeam Backup & Replication will remove data.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **RetentionPeriodType**
Specifies the type of the retention policy. You can set the type to the following periods:
* Days: use this option if you want Veeam Backup & Replication to apply retention policy daily.
* Months: use this option if you want Veeam Backup & Replication to apply retention policy monthly.
* Years: use this option if you want Veeam Backup & Replication to apply retention policy yearly.
Use the RetentionNumber to specify the number of days, months or years.
Note: Use this parameter if the AutoDelete parameter is not specified.
Valid Values:

* Days
* Months
* Years

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[VBRRetentionPeriodType]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Common.IItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRZip [-AutoDelete {Never | Tonight | TomorrowNight | In3days | In1Week | In2Weeks | In1Month | In3Months | In6Months | In1Year | In2Years | In3Years | In5Years | In7Years}] [-BackupRepository 
```
```PowerShell
<CBackupRepository>] [-Compression <Int32>] [-DisableQuiesce] [-EncryptionKey <PSCryptoKey>] -Entity <IItem[]> [-Force] [-KMSServer <VBRKMSServer>] [-RetentionNumber <Int32>] [-RetentionPeriodType {Days | 
```
```PowerShell
Months | Years}] [-RunAsync] [<CommonParameters>]
```
```PowerShell
Start-VBRZip [-AutoDelete {Never | Tonight | TomorrowNight | In3days | In1Week | In2Weeks | In1Month | In3Months | In6Months | In1Year | In2Years | In3Years | In5Years | In7Years}] [-Compression <Int32>] 
```
```PowerShell
[-DisableQuiesce] [-EncryptionKey <PSCryptoKey>] -Entity <IItem[]> [-Folder <String>] [-Force] [-KMSServer <VBRKMSServer>] [-NetworkCredentials <CCredentials>] [-RetentionNumber <Int32>] [-RetentionPeriodType 
```
```PowerShell
{Days | Months | Years}] [-RunAsync] [<CommonParameters>]
```
