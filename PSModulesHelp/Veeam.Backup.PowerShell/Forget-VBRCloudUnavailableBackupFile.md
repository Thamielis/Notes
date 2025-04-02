Forget-VBRCloudUnavailableBackupFile
------------------------------------

### Synopsis
Removes backup files that are no longer available from a cloud repository.

---

### Description

This cmdlet removes backup files, that are no longer available, from a cloud repository.
Note: Any restore points on a repository or extent that is inaccessible, on in Maintenance mode, will be considered as unavailable. Before you remove these backup files, check the list of the files that the Get-VBRCloudUnavailableBackupFile cmdlet returns to ensure the correct files will be removed.

---

### Related Links
* [Get-VBRCloudTenant](Get-VBRCloudTenant)

* [Get-VBRCloudUnavailableBackupFile](Get-VBRCloudUnavailableBackupFile)

---

### Examples
> Removing Unavailable Backup Files from Cloud Repository

$tenant = Get-VBRCloudTenant -Name "ABC Company"
$backupfiles = Get-VBRCloudUnavailableBackupFile -CloudTenant $tenant
Forget-VBRCloudUnavailableBackupFile -BackupFiles $backupfiles
This example shows how to remove backup files that are no longer available from a cloud repository for the ABC Company cloud tenant account. The cmdlet will remove incremental files as well.
Perform the following steps:
1. Run the Get-VBRCloudTenant cmdlet. Specify the Name parameter value. Save the result to the $tenant variable.
2. Run the Get-VBRCloudUnavailableBackupFile cmdlet. Set the $tenant variable as the CloudTenant parameter value. Save the result to the $backupfiles variable.
3. Run the Forget-VBRCloudUnavailableBackupFile cmdlet. Set the $backupfiles variable as the BackupFiles parameter value.

---

### Parameters
#### **BackupFiles**
Specifies backup files that you want to remove.

|Type                               |Required|Position|PipelineInput                 |
|-----------------------------------|--------|--------|------------------------------|
|`[VBRCloudUnavailableBackupFile[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **IncludeDependentFiles**
Defines that the cmdlet will remove incremental backup files that are related to the full backup files.
If you do not provide this parameter, the cmdlet will not remove full backup files and incremental backup files that are related to these full backup files.
Note: If full backup files that you want to remove do not have incremental backup files, the cmdlet will remove these full backup files even if you do not provide the IncludeDependentFiles parameter.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Switch]`|false   |named   |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRCloudUnavailableBackupFile[]

System.Management.Automation.SwitchParameter

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Forget-VBRCloudUnavailableBackupFile -BackupFiles <VBRCloudUnavailableBackupFile[]> [-IncludeDependentFiles] [<CommonParameters>]
```
