Start-VBRDownloadBackup
-----------------------

### Synopsis
Downloads backup files from the capacity tier to the performance tier.

---

### Description

This cmdlet downloads backup files from the capacity tier to the performance tier. You can download either all backup files or only the backup files from the latest backup chain.
IMPORTANT! This cmdlet is available starting from the Veeam Backup & Replication version 10a (build number 10.0.1.4854).

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

---

### Examples
> Example 1. Downloading Backup Files from Latest Backup Chain to Performance Tier

$backups = Get-VBRBackup -Name "Report09"
Start-VBRDownloadBackup -Backup $backups -RunAsync
This example shows how to download the Report09 backup files from the latest backup chain to the performance tier.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backups variable.
2. Run the Start-VBRDownloadBackup cmdlet. Set the $backups variable as the Backup parameter value. Provide the RunAsync parameter.
> Example 2. Downloading all Backup Files to Performance Tier

$backups = Get-VBRBackup -Name "Report06"
Start-VBRDownloadBackup -Backup $backups -AllBackup -RunAsync
This example shows how to download all Report06 backup files to the performance tier.
Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backups variable.
2. Run the Start-VBRDownloadBackup cmdlet. Specify the following settings:
- Set the $backups variable as the Backup parameter value.
- Provide the AllBackup parameter.
- Provide the RunAsync parameter.

---

### Parameters
#### **AllBackup**
Defines that the cmdlet will download all backup files from capacity tier to the performance tier.
Note: If you do not provide this parameter, the cmdlet will download the backup files from the latest backup chain.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Backup**
Specifies an array of backups which files you want to download to the performance tier. The cmdlet will either download backup files from the latest backup chain or all backup files that are located on the capacity tier.
Default: Downloads backup files from the latest backup chain.
Note: If the backup files from the latest backup chain are already downloaded to the performance tier, the cmdlet will download all backup files from the capacity tier.

|Type         |Required|Position|PipelineInput                 |
|-------------|--------|--------|------------------------------|
|`[CBackup[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Force**
Defines that the cmdlet will start to download the backup files from the latest backup chain and will not prompt any notifications.
Note:
If the performance tier already contains the backup files from the latest backup chain, the cmdlet will not download any backup files from the capacity tier.
If you provide the AllBackup parameter, the cmdlet will download all backup files from the capacity tier to the performance tier.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackup[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRDownloadBackup [-AllBackup] -Backup <CBackup[]> [-Force] [-RunAsync] [<CommonParameters>]
```
