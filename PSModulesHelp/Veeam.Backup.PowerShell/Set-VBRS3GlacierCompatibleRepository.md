Set-VBRS3GlacierCompatibleRepository
------------------------------------

### Synopsis
Modifies settings of S3 compatible object storage with data archiving.

---

### Description

This cmdlet modifies settings of S3 compatible object storage with data archiving that is added to the backup infrastructure.
IMPORTANT!
Do NOT change the immutability settings for your S3 compatible object storage with data archiving repository, otherwise it may result in data loss in the following scenarios:
- If you provide the EnableBackupImmutability parameter to enable immutability for already configured object storage if it was not enabled beforehand.
- If you provide the EnableBackupImmutability:$False parameter to disable immutability for already configured object storage if it was enabled beforehand.

---

### Related Links
* [Get-VBRArchiveObjectStorageRepository](Get-VBRArchiveObjectStorageRepository)

* [Get-VBRServer](Get-VBRServer)

---

### Examples
> Modifying Settings for S3 Compatible Object Storage with Data Archiving

$appliance = Get-VBRServer -Name "WinSrv2049"
$repo = Get-VBRArchiveObjectStorageRepository -Name "Atlanta03"
$s3Glacier = Set-VBRS3GlacierCompatibleRepository -Repository $repo -ArchiverAppliance $appliance
This example shows how to specify the archiver appliance for the Atlanta03 S3 compatible object storage with data archiving.
Perform the following steps:
1. Run the Get-VBRServer cmdlet. Specify the Name parameter value. Save the result to the $appliance variable.
2. Run the Get-VBRArchiveObjectStorageRepository cmdlet. Specify the Name parameter value. Save the result to the $repo variable.
3. Run the Set-VBRS3GlacierCompatibleRepository cmdlet. Set the $repo variable as the Repository parameter value. Set the $appliance variable as the ArchiverAppliance parameter value. Save the result to the $s3Glacier variable.

---

### Parameters
#### **ArchiverAppliance**
Specifies the archiver appliance. The cmdlet will use it to transfer data from S3 compatible object storage to S3 compatible object storage with data archiving.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |named   |False        |

#### **Description**
Specifies a description of S3 compatible object storage with data archiving. The cmdlet will add S3 compatible object storage with this description.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **EnableBackupImmutability**
IMPORTANT!
Do NOT change the immutability settings for your S3 compatible object storage with data archiving repository, otherwise it may result in data loss.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Force**
Defines that the cmdlet will add S3 compatible object storage with data archiving without showing warnings in the PowerShell console.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Name**
Specifies a name of S3 compatible object storage with data archiving. The cmdlet will add S3 compatible object storage with this name.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Repository**
Specifies an S3 compatible object storage with data archiving that you want to modify.

|Type                                |Required|Position|PipelineInput |
|------------------------------------|--------|--------|--------------|
|`[VBRS3GlacierCompatibleRepository]`|true    |named   |True (ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRS3GlacierCompatibleRepository

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Set-VBRS3GlacierCompatibleRepository [-ArchiverAppliance <CHost>] [-Description <String>] [-EnableBackupImmutability] [-Force] [-Name <String>] -Repository <VBRS3GlacierCompatibleRepository> [<CommonParameters>]
```
