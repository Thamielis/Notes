Start-VBRWindowsFileRestore
---------------------------

### Synopsis
Starts Windows VM guest OS file restore session.

---

### Description

This cmdlet starts a restore session of Windows VM guest OS files.
The cmdlet mounts disks of a machine from the backup or replica to the mount server. After that you can perform the following actions:
1. Run the Get-VBRWindowsGuestItem cmdlet to get details on the files and folders that are available for restore.
2. Run the Start-VBRWindowsGuestItemRestore cmdlet to restore the necessary files and folders.
After you restore the necessary files, you must stop the restore session. After you stop the session, Veeam Backup & Replication will unmount disks from the mount server. Run the Stop-VBRWindowsFileRestore cmdlet to stop the restore session.

---

### Examples
> Example 1

$backup = Get-VBRBackup -Name "WinSrv25"
$restorepoint = Get-VBRRestorePoint -Backup $backup -Name "Production VM"
$session = Start-VBRWindowsFileRestore -RestorePoint $restorepoint[1]
This example shows how to start a restore session for Windows guest OS files of the WinSrv25 machine.

Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Specify the Name parameter value. Save the result to the $restorepoint variable.
The Get-VBRRestorePoint cmdlet will return an array of restore points. Mind the ordinal number of the necessary restore point (in our example, it is the second restore session in the array).
3. Run the Start-VBRWindowsFileRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Save the result to the $session variable.
> Example 2

Get-VBRBackup -Name "WinSrv25" | Get-VBRRestorePoint | Sort-Object -Property CreationTime -Descending | Select-Object -First 1 | Start-VBRWindowsFileRestore
This example shows how to start a restore session for Windows guest OS files of the WinSrv25 machine. The cmdlet will use the latest restore point to start restore of Windows guest OS files.

Perform the following steps:
1. Run the Get-VBRBackup cmdlet. Specify the Name parameter value.
2. Pipe the cmdlet output to the Get-VBRRestorePoint cmdlet.
3. Pipe the cmdlet output to the Sort-Object cmdlet. Set the CreationTime value for the Property parameter. Provide the Descending parameter.
4. Pipe the cmdlet output to the Select-Object cmdlet. Set the 1 number as the First parameter value.
5. Pipe the cmdlet output to the Start-VBRWindowsFileRestore cmdlet.

---

### Parameters
#### **Credentials**
Specifies the credentials to authenticate with the backup share folder.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **Folder**
Specifies a folder on the mount server. The cmdlet will place the machine disks under this folder.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[CViFolderItem]`|false   |3       |False        |

#### **Host**
Specifies the mount server to which machine disks will be mounted.
Note: This parameter works only if you start a restore session of machine disks located on storage that use the Direct SAN access transport mode.
If you start a restore session of machine disks located on storage that use the other transport mode methods, the cmdlet will mount machine disks to the source storage.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[CHost]`|false   |1       |False        |

#### **Reason**
Specifies the string with the reason for performing file restore.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **ResourcePool**
Specifies a resource pool. The cmdlet will register the mount server to this resource pool.

|Type                   |Required|Position|PipelineInput|
|-----------------------|--------|--------|-------------|
|`[CViResourcePoolItem]`|false   |2       |False        |

#### **RestorePoint**
Specifies a restore point to start a restore session. You will be able to use the session to perform operations with machine guest OS files.

|Type    |Required|Position|PipelineInput                 |
|--------|--------|--------|------------------------------|
|`[COib]`|true    |0       |True (ByPropertyName, ByValue)|

---

### Inputs
Veeam.Backup.Core.COib

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRWindowsFileRestore [-RestorePoint] <COib> [[-Host] <CHost>] [[-ResourcePool] <CViResourcePoolItem>] [[-Folder] <CViFolderItem>] [-Credentials <CCredentials>] [-Reason <String>] [<CommonParameters>]
```
