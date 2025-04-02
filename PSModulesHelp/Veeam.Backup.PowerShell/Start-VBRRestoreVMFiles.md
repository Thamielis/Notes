Start-VBRRestoreVMFiles
-----------------------

### Synopsis
Restores VM configuration files.

---

### Description

This cmdlet allows you to restore configuration file (.vmx) or virtual disks (.vmdk) of a selected VM.

NOTE: Run the Start-VBRWindowsFileRestore cmdlet to restore Windows VM guest OS files.

---

### Examples
> Example 1

$point = Get-VBRBackup -Name "MSExchange Backup" | Get-VBRRestorePoint -Name "MSExchange02" | Sort-Object CreationTime -Descending | Select -First 1
$server = Get-VBRServer -Name "Server007"
Start-VBRRestoreVMFiles -RestorePoint $point -Server $server -Path "C:\BackupFiles"
This example shows how to restore all VM guest OS files and save them on the Server007 host to the C:\BackupFiles folder.

Perform the following steps:
1. Get the restore point of the VM that you want to restore:
- Run the Get-VBRBackup cmdlet. Specify the Name parameter value.
- Pipe the cmdlet output to the Get-VBRRestorePoint cmdlet. Specify the Name parameter value.
- Pipe the cmdlet output to the Sort-Object cmdlet and specify the CreationTime parameter value.
- Pipe the cmdlet output to the Select cmdlet. Specify the First parameter value.
- Save the result to the $restorepoint variable.
2. Run the Get-VBRServer cmdlet. Specify the Name parameter value.
3. Run the Start-VBRRestoreVMFiles cmdlet. Set the $point variable as the RestorePoint parameter value. Set the $server variable as the Server parameter value. Specify the Path parameter value.

---

### Parameters
#### **Files**
Specifies the files you want to restore.
By default, all files from the VM will be restored.

|Type              |Required|Position|PipelineInput        |
|------------------|--------|--------|---------------------|
|`[COIBFileInfo[]]`|false   |named   |True (ByPropertyName)|

#### **Force**
Defines that the cmdlet will restore VM configuration files even if the location of the repository where VM backups reside and the target host location do not match.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Path**
Specifies the string with the path to the folder where restored files should be saved.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |False        |

#### **Reason**
Specifies the string with the reason for performing the VM guest OS file restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **RestorePoint**
Specifies the VM restore point to which you want to restore.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |0       |True (ByPropertyName, ByValue)|

#### **RunAsync**
Indicates that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Server**
Specifies the host to which the VM guest files should be restored.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|true    |1       |False        |

---

### Inputs
Veeam.Backup.Core.COib

Veeam.Backup.Core.COIBFileInfo[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRRestoreVMFiles [-RestorePoint] <COib> [-Server] <CHost> [-Path] <String> [-Files <COIBFileInfo[]>] [-Force] [-Reason <String>] [-RunAsync] [<CommonParameters>]
```
