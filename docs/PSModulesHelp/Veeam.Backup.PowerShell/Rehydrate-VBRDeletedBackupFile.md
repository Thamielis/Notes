Rehydrate-VBRDeletedBackupFile
------------------------------

### Synopsis
Rehydrates a backup file deleted from the capacity tier and preserved by insider protection.

---

### Description

This cmdlet rehydrates a backup file deleted from the capacity tier and preserved by insider protection.

---

### Related Links
* [Get-VBRDeletedDehydratedBackupFile](Get-VBRDeletedDehydratedBackupFile)

---

### Examples
> Rehydrating Backup File from Capacity Tier

$backupfile = Get-VBRDeletedDehydratedBackupFile -Name "Company"
Rehydrate-VBRDeletedBackupFile -BackupFile $backupfile[0] -RunAsync
This command rehydrates a backup file named Company from the capacity tier.
Perform the following steps:
1. Run the Get-VBRDeletedDehydratedBackupFile cmdlet. Specify the Name parameter value. Save the result to the $backupfile variable.
The Get-VBRDeletedDehydratedBackupFile cmdlet will return an array of deleted backup files. Mind the ordinal number of the necessary backup file (in our example, it is the first backup file in the array).
2. Run the Rehydrate-VBRDeletedBackupFile cmdlet. Set the $backupfile[0] variable as the BackupFile parameter value. Provide the RunAsync parameter.

---

### Parameters
#### **BackupFile**
Specifies a list of deleted backup files you want to rehydrate.

|Type                                |Required|Position|PipelineInput |
|------------------------------------|--------|--------|--------------|
|`[VBRDeletedDehydratedBackupFile[]]`|true    |named   |True (ByValue)|

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRDeletedDehydratedBackupFile[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Rehydrate-VBRDeletedBackupFile -BackupFile <VBRDeletedDehydratedBackupFile[]> [-RunAsync] [<CommonParameters>]
```
