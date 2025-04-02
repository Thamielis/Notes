Start-VBRWindowsGuestItemRestore
--------------------------------

### Synopsis
Starts restore of Microsoft Windows guest OS files and folders to the original or new location.

---

### Description

This cmdlet starts to restore Microsoft Windows guest OS files and folders to the original or new location.
Note: To restore guest OS files, you need to start the restore session by running the Start-VBRWindowsFileRestore cmdlet.

---

### Examples
> Example 1

$session = Get-VBRRestoreSession -Name "Winserver_restore"
Start-VBRWindowsGuestItemRestore -Path "C:\Projects\2020\January.xlsx" -Session $session[0] -RestorePolicy Overwrite
This example shows how to restore the January.xlsx file by specifying the C:\Projects\2020\January.xlsx file path. The cmdlet will restore the file to the original WinSrv25 Windows machine.
Perform the following steps:
1. Run the Get-VBRRestoreSession cmdlet. Specify the Name parameter value. Save the result to the $session variable.
2. Run the Start-VBRWindowsGuestItemRestore cmdlet. Specify the following settings:
- Specify the Path parameter value.
- Set the $session[0] variable as the Session parameter value.
The Get-VBRRestoreSession cmdlet will return an array of active restore sessions. Mind the ordinal number of the necessary restore session (in our example, it is the first restore session in the array).
- Set the Overwrite option for the RestorePolicy parameter.

---

### Parameters
#### **ChangedItemsOnly**
Defines whether to restore changed files and folders only. Before restoring changes, you must launch Compare-VBRWindowsGuestItemsAttributes for files and folders that youplan to restore.
Note: This functionality is included in the Veeam Universal License. When using a legacy socket-based license, the Enterprise or Enterprise Plus editions of Veeam Backup & Replication are required.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **FileRestore**
Specifies a session of Microsoft Windows guest OS file restore. The cmdlet will use this session to restore guest OS files.
Note: The restore session must be started within the current PowerShell session.
This parameter is required if the Session parameter is not specified.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[FileRestore]`|false   |named   |False        |

#### **GuestCredentials**
Specifies credentials for the target machine.
Note: If you do not specify credentials, the cmdlet will try to use the credentials from the current PowerShell session.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **Item**
Specifies an array of files and folders that you want to restore. The cmdlet will restore these files and folders.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRFLRFsItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Path**
Specifies an array of file paths to files and folders that you want to restore.
Note: The parameter does not accept the mount server path.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **PermissionsOnly**
Defines whether to restore only permissions of files and folders.
Note: This functionality is included in the Veeam Universal License. When using a legacy socket-based license, the Enterprise or Enterprise Plus editions of Veeam Backup & Replication are required.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RestorePolicy**
Specifies the file restore policy:
* Keep: Use this option if you want to restore the files with the _restored postfix next to the original file.
* Overwrite: Use this option if you want to replace the original files with the restored files.
Valid Values:

* Keep
* Overwrite

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[VBRWindowsGuestItemRestorePolicy]`|true    |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Session**
Specifies a session of Microsoft Windows guest OS file restore. The cmdlet will use this session to restore guest OS files.
Note: The restore session must be started within the current PowerShell session.
This parameter is required if the FileRestore parameter is not specified.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CRestoreSession]`|false   |named   |False        |

#### **TargetDirectory**
Specifies the path to a folder on the target VM to which you want to restore files.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

#### **TargetHvVm**
For restoring files and folders from a backup of a Microsoft Hyper-V VM.
Specifies a Microsoft Hyper-V VM (target VM) to which you want to restore files and folders.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[CHvVmItem]`|false   |named   |False        |

#### **TargetVcdVm**
For restoring files and folders from a backup of a VMware Cloud Director VM.
Specifies a VMware Cloud Director VM (target VM) to which you want to restore files and folders.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[CVcdVmItem]`|false   |named   |False        |

#### **TargetViVm**
For restoring files and folders from a backup of a VMware vSphere VM.
Specifies a VMware vSphere VM (target VM) to which you want to restore files and folders.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[CViVmItem]`|false   |named   |False        |

---

### Inputs
System.String[]

Veeam.Backup.PowerShell.Infos.VBRFLRFsItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Start-VBRWindowsGuestItemRestore [-ChangedItemsOnly] [-FileRestore <FileRestore>] [-GuestCredentials <CCredentials>] -Item <VBRFLRFsItem[]> [-PermissionsOnly] -RestorePolicy {Keep | Overwrite} [-RunAsync] 
```
```PowerShell
[-Session <CRestoreSession>] [-TargetDirectory <String>] [-TargetHvVm <CHvVmItem>] [-TargetVcdVm <CVcdVmItem>] [-TargetViVm <CViVmItem>] [<CommonParameters>]
```
```PowerShell
Start-VBRWindowsGuestItemRestore [-ChangedItemsOnly] [-FileRestore <FileRestore>] [-GuestCredentials <CCredentials>] -Path <String[]> [-PermissionsOnly] -RestorePolicy {Keep | Overwrite} [-RunAsync] [-Session 
```
```PowerShell
<CRestoreSession>] [-TargetDirectory <String>] [-TargetHvVm <CHvVmItem>] [-TargetVcdVm <CVcdVmItem>] [-TargetViVm <CViVmItem>] [<CommonParameters>]
```
