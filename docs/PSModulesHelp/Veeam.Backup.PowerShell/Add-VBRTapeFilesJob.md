Add-VBRTapeFilesJob
-------------------

### Synopsis
Creates a new files to tape copy job.

---

### Description

This cmdlet creates a new job copying files from Veeam Backup & Replication to tape. The tape job looks for changes in the specified files that have been made from the moment of the last tape job run. Please note that when you create a copy job, you need to run it manually.

Run Start-VBRJob to start the created job.

---

### Examples
> Example 1

```PowerShell
Add-VBRTapeFilesJob -Name "Contacts Copy Job" -Server $server -Path "D:\Users\UserInfo\Contacts.xls"  -MediaPool $full -MediaPoolIncremental $increment
This command creates a new files to tape copy job named "Contacts Copy Job". The source server containing the files to be copied is obtained with Get-VBRServer and assigned to the $server variable. The target media pools for full backups and incremental backups are obtained with Get-VBRTapeMediaPool and assigned to $full and $increment variables beforehand accordingly. The source file path is D:\Users\UserInfo\Contacts.xls.
```
> Example 2

```PowerShell
Add-VBRTapeFilesJob -Name "Agreements Copy Job" -Server $server -Path "D:\Agreements\Signed" -MediaPool $full -MediaPoolIncremental $increment -Description "Agreements File Copy Job" -Credentials $Administrator -Masks *.pdf
This command creates a new files to tape copy job named "Agreements Copy Job" copying .pdf files from the "Signed" folder. The source server containing the files to be copied is obtained with Get-VBRServer and assigned to the $server variable. The target media pools for full backups and incremental backups are obtained with Get-VBRTapeMediaPool and assigned to $full and $increment variables beforehand accordingly. The source file path is D:\Agreements\Signed. The mask for selecting files to copy is ".pdf".
```

---

### Parameters
#### **Credentials**
Specifies the credentials you want to use for authenticating with the source server.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **Description**
Specifies the description for the new files to tape copy job.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **IgnoreCase**
Used to specify search conditions for -Path paramater. If set, the search by name will be non case sensitive.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Masks**
Used to specify search conditions for -Path paramater. Specifies masks to select files in folders.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **MediaPool**
Specifies the target media pool that will be used for full backups.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[CTapeMediaPool]`|true    |named   |False        |

#### **MediaPoolIncremental**
Specifies the target media pool that will be used for incremental backups.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[CTapeMediaPool]`|false   |named   |False        |

#### **Name**
Specifies the name you want to assign to the new files to tape copy job. You can input string up to 255 symbols.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **Path**
Specifies the path to the folder(s) you need to copy. Use -Masks and -IgnoreCase parameters to select particular files. You can specify multiple names separated by commas.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Server**
Specifies the source server where the files you need are located.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |named   |False        |

---

### Inputs
System.String[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Add-VBRTapeFilesJob [-Credentials <CCredentials>] [-Description <String>] [-IgnoreCase] [-Masks <String>] -MediaPool <CTapeMediaPool> [-MediaPoolIncremental <CTapeMediaPool>] [-Name <String>] -Path <String[]> 
```
```PowerShell
-Server <CHost> [<CommonParameters>]
```
