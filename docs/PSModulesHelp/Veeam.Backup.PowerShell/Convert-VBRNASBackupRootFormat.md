Convert-VBRNASBackupRootFormat
------------------------------

### Synopsis
Converts backups created by one file share backup job for separate non-root shared folders residing on the same server into the backup created for the server single root folder.

---

### Description

The cmdlet converts backups created by one file share backup job for separate non-root shared folders residing on the same server into the backup created for the server single root folder with all the non-root shared folders of the same type under it.

When converting the backups, you can specify a single root folder added to the backup infrastructure via one protocol (for example, SMB or NFS). If the initial backup protects shared folders accessed by different protocols (for example, the file share backup job has both SMB and NFS shared folders residing on the same server as a source), you should run the Convert-VBRNASBackupRootFormat cmdlet for each of the protocols. Later on, you can add these separate root folders (for SMB and NFS shares) as sources to get the converted file share backup job.

Note: Running the cmdlet is a single step in the procedure of converting backups from protecting multiple non-root shared folders to protecting single root folders. For more information, see Converting Backups from Non-Root to Root Shared Folders in the Veeam Backup & Replication User Guide.

Parameters

---

### Related Links
* [Get-VBRUnstructuredBackup](Get-VBRUnstructuredBackup)

* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

---

### Examples
> Converting Backup Source from NonRoot to Root Folder

$nasBackup = Get-VBRUnstructuredBackup -Name "Daily SMB1 Backup"
$nasServer = Get-VBRUnstructuredServer -Name "\\WinSRV2020"
Convert-VBRNASBackupRootFormat -Backup $nasBackup -Server $nasServer
The example shows how to convert a backup to replace the file share source: instead of separate non-root shared folders residing on the same server and protected by the same backup, the backup will protect the root folder in which these non-root shared folders are located.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Specify the Name parameter value. Save the result to the $nasBackup variable.
2. Run the Get-VBRUnstructuredServer cmdlet. Specify the Name parameter value. Save the result to the $nasServer variable.
3. Run the Convert-VBRNASBackupRootFormat cmdlet. Specify the following parameters:
- Set the $nasBackup variable as the Backup parameter value.
- Set the $nasServer variable as the Server parameter value.

---

### Parameters
#### **Backup**
Specifies a file share backup. The cmdlet will convert this backup to replace the file share source: instead of separate non-root shared folders residing on the same server and protected by the same backup, the backup will protect the root folder in which these non-root shared folders are located.
Accepts the VBRNASBackup object.  To get this object, run the Get-VBRUnstructuredBackup cmdlet.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[VBRNASBackup]`|true    |named   |True (ByPropertyName, ByValue)|

#### **Server**
Specifies the file share server. The cmdlet will convert backups to have this server as the root shared folder protected by the backup.
Accepts the VBRNASServer[] object.  To get this object, run the Get-VBRUnstructuredServer cmdlet.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRNASServer[]]`|true    |named   |False        |

#### **Confirm**
-Confirm is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-Confirm is used to -Confirm each operation.

If you pass ```-Confirm:$false``` you will not be prompted.

If the command sets a ```[ConfirmImpact("Medium")]``` which is lower than ```$confirmImpactPreference```, you will not be prompted unless -Confirm is passed.

#### **WhatIf**
-WhatIf is an automatic variable that is created when a command has ```[CmdletBinding(SupportsShouldProcess)]```.
-WhatIf is used to see what would happen, or return operations without executing them

---

### Inputs
Veeam.Backup.PowerShell.Infos.VBRNASBackup

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Convert-VBRNASBackupRootFormat -Backup <VBRNASBackup> -Server <VBRNASServer[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
