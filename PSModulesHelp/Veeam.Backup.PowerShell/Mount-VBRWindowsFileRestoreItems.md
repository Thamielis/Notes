Mount-VBRWindowsFileRestoreItems
--------------------------------

### Synopsis
Mounts disks of VMs for which restore is launched to the Veeam Backup & Replication console.

---

### Description

This cmdlet mounts disks of VMs for which restore is launched to the Veeam Backup & Replication console. After the disks are mounted, you can use Microsoft Windows File Explorer to work with restored files and folders. By default, the disks are mounted to the C:\VeeamFLR\ folder.
Note: It is recommended that you use Microsoft Windows File Explorer only to view file content, not to restore files. For guest OS file restore, use the Start-VBRWindowsGuestItemRestore cmdlet.

---

### Examples
> Example 1

$restore = Get-VBRRestoreSession -Name "Hv_DNS", "Hv_DC"
Mount-VBRWindowsFileRestoreItems -Session $restore
This example shows how to mount disks of the Hv_DNS and Hv_DC VMs for which restore is launched.
Perform the following steps:
1. Run the Get-VBRRestoreSession cmdlet. Specify the Name parameter value. Save the result to the $restore variable.
2. Run the Mount-VBRWindowsFileRestoreItems cmdlet. Set the $restore variable as the Session parameter value.

---

### Parameters
#### **FileRestore**
Specifies a session of Microsoft Windows guest OS file restore. The cmdlet will mount disks of the VMs for which the restore sessions was launched to the Veeam Backup & Replication console.
Note: The restore session must be started within the current PowerShell session.
This parameter is required if the Session parameter is not specified.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[FileRestore]`|false   |named   |False        |

#### **Session**
Specifies a session of Microsoft Windows guest OS file restore. The cmdlet will mount disks of the VMs for which the restore sessions was launched to the Veeam Backup & Replication console.
Note: The restore session must be started within the current PowerShell session.
This parameter is required if the FileRestore parameter is not specified.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[CRestoreSession]`|false   |named   |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Mount-VBRWindowsFileRestoreItems [-FileRestore <FileRestore>] [-Session <CRestoreSession>] [<CommonParameters>]
```
