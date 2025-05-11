Convert-VBRLegacyCopyBackup
---------------------------

### Synopsis
Converts legacy backup file of legacy periodic backup copy job to the per-machine backup with separate metadata files using mapping.

---

### Description

This cmdlet converts legacy backup file of legacy periodic backup copy job to the per-machine backup with separate metadata files format using synthetic full creation based on the old backup file.
The cmdlet detaches legacy backup file from legacy periodic backup copy job and links the new backup file to the new backup copy job. After you run the cmdlet, you will have two backups: detached legacy backup file (in orphaned node) and per-machine backup with separate metadata files linked to the new backup copy job.

---

### Related Links
* [Get-VBRBackupRepository](Get-VBRBackupRepository)

* [Get-VBRJob](Get-VBRJob)

* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRLegacyBackupCopySourceJob](Get-VBRLegacyBackupCopySourceJob)

* [Disable-VBRJob](Disable-VBRJob)

* [Add-VBRBackupCopyJob](Add-VBRBackupCopyJob)

---

### Examples
> Upgrading Backup Chain Format
> Step 1. Getting Job Name and Target Repository

$LegacyJobName = "LegacyCopyJobName"
$Repo = Get-VBRBackupRepository -Name "TargetRepoName" # provide -ScaleOut parameter if it is a scale-out backup repository
At this step, get the job name and the target repository.
Perform the following steps:
1. Specify the job name. Save the result to the $LegacyJobName variable.
2. Run the Get-VBRBackupRepository cmdlet. Specify the Name parameter value. Provide the ScaleOut parameter if your target repository is a scale-out repository. Save the result to the $Repo variable.
> Step 2. Specifying Job and Repository Settings

$LegacyJob = Get-VBRJob -Name $LegacyJobName
$LegacyBackup = Get-VBRBackup -Name $LegacyJob.name
$NewJobName = ($LegacyJob.name + "_Upgraded")
At this step, specify the job and the repository settings.
Perform the following steps:
1. Run the Get-VBRJob cmdlet. Set the $LegacyJobName variable as the Name parameter value. Save the result to the $LegacyJob variable.
2. Run the Get-VBRBackup cmdlet. Set the $LegacyJob.name variable as the Name parameter value. Save the result to the $LegacyBackup variable.
3. Use the ($LegacyJob.name + "_Upgraded") command to create a name for the job that will contain upgraded backups. Save the result to the $NewJobName variable.
> Step 3. Getting Legacy Backup Copy Job Source Objects and Disabling Job

$Sources = Get-VBRLegacyBackupCopySourceJob -Job $LegacyJob
Disable-VBRJob -Job $LegacyJob
At this step, get legacy backup copy job source objects and disable the job you want to upgrade.
Perform the following steps:
1. Run the Get-VBRLegacyBackupCopySourceJob cmdlet. Set the $LegacyJob variable as the Job parameter value. Save the result to the $Sources variable.
2. Run the Disable-VBRJob cmdlet. Set the $LegacyJob variable as the Job parameter value.
> Step 4. Getting Legacy Source Backup Files and Starting Upgrade Process

$SourceJobName = $Sources.name
$SourceBackups = Get-VBRBackup -Name $SourceJobName
foreach ($SourceBackup in $SourceBackups)
{
                    if ($SourceBackup.istruepervmcontainer -eq $True)
                 {
                          write-host ("Backup "+$SourceJobName+" is already upgraded")
                 }
                    else
                    {
                          Upgrade-VBRBackup -Backup $SourceBackup -Force
                 }
             }
At this step, get legacy source backups files you want to upgrade to the per-machine backups with separate metadata files. Validate which of them are eligible for the upgrade using the foreach statement and start the upgrade process. Any existing per-machine backups with separate metadata files will be skipped.
Perform the following steps:
1. Assign the $sources.name variable as the $SourceJobName variable value.
2. Run the Get-VBRBackup cmdlet. Set the $SourceJobName variable as the Name parameter value. Save the result to the $SourceBackups variable.
3. Use the foreach statement where the $SourceBackup variable represents legacy source backup files and the $SourceBackups variable represents the collection of these files. Provide the If Else statements from the example.
> Step 5. Adding New Backup Copy Job and Converting Legacy Backup Files

$NewBackupCopyJob = Add-VBRBackupCopyJob -Name $NewJobName -Mode Immediate -BackupJob $Sources -TargetRepository $Repo -DirectOperation
Convert-VBRLegacyCopyBackup -Backup $LegacyBackup -TargetJob $NewBackupCopyJob
At this step, add new backup copy job and convert legacy backup files to the per-machine backups with separate metadata files.
Perform the following steps:
1. Run the Add-VBRBackupCopyJob cmdlet. Set the $NewJobName variable as the Name parameter value. Specify the Mode, the BackupJob and the TargetRepository parameter values. Provide the DirectOperation parameter. Save the result to the $NewBackupCopyJob variable.
2. Run the Convert-VBRLegacyCopyBackup cmdlet. Set the $LegacyBackup variable as the Backup parameter value. Set the $NewBackupCopyJob variable as the TargetJob parameter value.
> Full Script Example

```PowerShell
$LegacyJobName = "LegacyCopyJobName"
$Repo = Get-VBRBackupRepository -Name "LegacyCopyJobTargetRepoName" # provide -ScaleOut parameter if it is a scale-out backup repository
$LegacyJob = Get-VBRJob -Name $LegacyJobName
$LegacyBackup = Get-VBRBackup -Name $LegacyJob.name
$NewJobName = ($LegacyJob.name + "_Upgraded")

$Sources = Get-VBRLegacyBackupCopySourceJob -Job $LegacyJob
Disable-VBRjob -Job $LegacyJob

$SourceJobName = $Sources.name
$SourceBackups = Get-VBRBackup -Name $SourceJobName
foreach ($SourceBackup in $SourceBackups)
{
                    if ($SourceBackup.istruepervmcontainer -eq $True)
                 {
                          write-host ("Backup "+$SourceJobName+" is already upgraded")
                 }
                    else
                    {
                          Upgrade-VBRBackup -Backup $SourceBackup -Force
                 }
             }

$NewBackupCopyJob = Add-VBRBackupCopyJob -Name $NewJobName -Mode Immediate -BackupJob $Sources -TargetRepository $Repo -DirectOperation
Convert-VBRLegacyCopyBackup -Backup $LegacyBackup -TargetJob $NewBackupCopyJob
```

---

### Parameters
#### **Backup**
Specifies backup file. The cmdlet will return the backup file you want to link to the new backup copy job.

|Type       |Required|Position|PipelineInput |
|-----------|--------|--------|--------------|
|`[CBackup]`|true    |named   |True (ByValue)|

#### **Days**
Specifies an amount of days after which detached legacy backup file is deleted from the storage.
Note: Days count starts from the backup storage creation date.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **EnableTimeBasedRetention**
Defines that retention policy is applied to the source legacy backup file and its incremental backup files. The amount of retention days is specified in the Days parameter.
When determining whether the number of days is exceeded, the cmdlet compares storage creation date, the current date and retention days.
Note: If the number of retention days is exceeded for the source legacy backup file but not exceeded for any of the incremental backup files, the source legacy backup file will not be deleted.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **TargetJob**
Specifies a backup copy job to which you want to map a backup file.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[VBRBackupCopyJob]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.Core.CBackup

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Convert-VBRLegacyCopyBackup -Backup <CBackup> [-Days <Int32>] [-EnableTimeBasedRetention] [-RunAsync] -TargetJob <VBRBackupCopyJob> [<CommonParameters>]
```
