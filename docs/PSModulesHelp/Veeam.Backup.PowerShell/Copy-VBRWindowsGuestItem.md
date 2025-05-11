Copy-VBRWindowsGuestItem
------------------------

### Synopsis
Copies Microsoft Windows guest OS files to the target host.

---

### Description

This cmdlet copies Microsoft Windows guest OS files to the target host.

---

### Related Links
* [Get-VBRBackup](Get-VBRBackup)

* [Get-VBRRestorePoint](Get-VBRRestorePoint)

* [Start-VBRWindowsFileRestore](Start-VBRWindowsFileRestore)

* [Get-VBRWindowsGuestItem](Get-VBRWindowsGuestItem)

---

### Examples
> Copying Microsoft Windows Guest OS Files to Target Folder

$backup = Get-VBRBackup -Name "WinSrv25"
$restorepoint = Get-VBRRestorePoint -Backup $backup -Name "Production VM"
$session = Start-VBRWindowsFileRestore -RestorePoint $restorepoint
$items = Get-VBRWindowsGuestItem -FileRestore $session -Name "Reports"
Copy-VBRWindowsGuestItem -Item $items -TargetFolder "D:\Copies" -FileRestore $session -KeepPermissionsAndOwnership
This example shows how to copy files from the backup of the WinSrv25 Windows machine to the "D:\Copies" folder.
The cmdlet will keep all custom permissions and ownership of the copied files.
Perform the following steps:
1. Get the restore session.
a. Run the Get-VBRBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
b. Run the Get-VBRRestorePoint cmdlet. Set the $backup variable as the Backup parameter value. Specify the Name parameter value. Save the result to the $restorepoint variable.
c. Run the Start-VBRWindowsFileRestore cmdlet. Set the $restorepoint variable as the RestorePoint parameter value. Save the result to the $session variable.
2. Run the Get-VBRWindowsGuestItem cmdlet. Specify the $session variable as the FileRestore parameter value. Specify the Name parameter value. Save the result to the $items variable.
3. Run the Copy-VBRWindowsGuestItem cmdlet. Specify the following settings:
- Set the $items variable as the Item parameter value.
- Specify the TargetFolder parameter value.
- Set the $session variable as the FileRestore parameter value.
- Provide the KeepPermissionsAndOwnership parameter.

---

### Parameters
#### **FileRestore**
Specifies a restore session of Microsoft Windows guest OS files. The cmdlet will use this session to restore guest OS files.
Note: The restore session must be started within the current PowerShell session.
This parameter is required if the Session parameter is not specified.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[FileRestore]`|false   |named   |False        |

#### **GuestCredentials**
Specifies the credentials of the target machine.
Note: If you do not specify credentials, the cmdlet will try to use the credentials from the current PowerShell session.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[CCredentials]`|false   |named   |False        |

#### **Item**
Specifies an array of Microsoft Windows guest OS files.
The cmdlet will copy these files.

|Type              |Required|Position|PipelineInput                 |
|------------------|--------|--------|------------------------------|
|`[VBRFLRFsItem[]]`|true    |named   |True (ByPropertyName, ByValue)|

#### **KeepPermissionsAndOwnership**
Defines that the cmdlet will keep custom permissions and the ownership of the copied guest OS files.
If you do not provide this parameter, the cmdlet will restore guest OS files with default permissions and ownership.
Default: False.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **RunAsync**
Defines that the command returns immediately without waiting for the task to complete.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Session**
Specifies a restore session of Microsoft Windows guest OS files. The cmdlet will use this session to copy guest OS files.
This parameter is required if the FileRestore parameter is not specified.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CRestoreSession]`|false   |named   |False        |

#### **ShareCredentials**
For copying guest OS files to a shared folder.
Specifies credentials that you want to use to authenticate with the target shared folder to which you copy guest OS files.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[PSCredential]`|false   |named   |False        |

#### **TargetFolder**
Specifies a folder in the target machine.
The cmdlet will copy the guest OS files to this folder.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRFLRFsItem[]

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Copy-VBRWindowsGuestItem [-FileRestore <FileRestore>] [-GuestCredentials <CCredentials>] -Item <VBRFLRFsItem[]> [-KeepPermissionsAndOwnership] [-RunAsync] [-Session <CRestoreSession>] [-ShareCredentials 
```
```PowerShell
<PSCredential>] -TargetFolder <String> [<CommonParameters>]
```
