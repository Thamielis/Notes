Convert-VBRNASBackupSANFormat
-----------------------------

### Synopsis
Converts backups created for SMB or NFS file shares residing on an enterprise NAS system into the format of a NAS filer share on the same storage system.

---

### Description

The cmdlet converts backups created for SMB or NFS file shares residing on an enterprise NAS system into the format of a NAS filer share. Use this cmdlet as the first step when replacing simple SMB or NFS shares with the NAS filer share residing on the same storage system. To locate the original file share, specify the name of the backup created for it and either the name of the file share or SAN entity (for example, storage system volume) where the file share resides. Note that running the Convert-VBRNASBackupSANFormat cmdlet is a single step in the procedure of converting backups from SMB or NFS shares to NAS filer shares. You can also convert backups created with backup copy jobs to continue the old backup chain.  For more information, see Converting Backups from SMB or NFS Shares to NAS Filer Shares in the Veeam Backup & Replication User Guide.

---

### Related Links
* [Get-VBRUnstructuredBackup](Get-VBRUnstructuredBackup)

* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

---

### Examples
> Example 1. Converting SMB or NFS File Shares by Backups that Protect Them

$nasBackup = Get-VBRUnstructuredBackup -Name "Daily SMB1 Backup"
$nasServer = Get-VBRUnstructuredServer -Name "\\WinSRV2020\Documents"
Convert-VBRNASBackupSANFormat -Backup $nasBackup -Server $nasServer
The example shows how to convert the "Daily SMB1 Backup" file shares that reside on an enterprise NAS system into SAN file shares on the same storage. The cmdlet will find the backup by the backup name.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Specify the Name parameter value. Save the result to the $nasBackup variable.
2. Run the Sync-VBRUnstructuredBackupState cmdlet. Specify the Name parameter value. Save the result to the $nasServer variable.
3. Run the Convert-VBRNASBackupSANFormat cmdlet. Specify the following parameters:
- Set the $nasBackup variable as the Backup parameter value.
- Set the $nasServer variable as the Server parameter value.
> Example 2. Converting SMB or NFS File Shares by Enterprise NAS System on Which They Reside

$nasbackup = Get-VBRUnstructuredBackup -Name "File Backup Job 1"
$netapp = Get-NetAppHost -Name "pdc-ontap-1"
$netapp_filer = Get-VBRUnstructuredServer -SANEntity $netapp
Convert-VBRNASBackupSANFormat -Backup $nasbackup -Server $netapp_filer
The example shows how to convert the "File Backup Job 1" file shares that reside on an enterprise NAS system into a NAS filer share on the same storage. The cmdlet will find the backup on the NAS filer by the backup name.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Specify the Name parameter value. Save the result to the $nasbackup variable.
2. Run the Get-NetAppHost cmdlet. Specify the Name parameter value. Save the result to the $netapp variable.
3. Run the Get-VBRUnstructuredServer cmdlet. Set the $netapp variable as the SANEntity parameter value. Save the result to the $netapp_filer variable.
4. Run the Convert-VBRNASBackupSANFormat cmdlet. Set the $nasBackup variable as the Backup parameter value. Set the $netapp_filer variable as the Server parameter value.

---

### Parameters
#### **Backup**
Specifies a file share backup. The cmdlet will convert an array of these backups from SMB or NFS format into SAN format. Accepts the VBRNASBackup object. To get this object, run the Get-VBRUnstructuredBackup cmdlet.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[VBRNASBackup]`|true    |named   |True (ByPropertyName, ByValue)|

#### **SANEntity**
Specifies the enterprise NAS system or its volume where the file shares reside. The cmdlet will convert backups protecting an array of file shares residing on this NAS system. Accepts the VBRSANEntity[] object.  To create this object, run the Get-NetAppHost, Get-ThinkSystemHost, Get-VBRIsilonHost or Get-VBRNutanixHost cmdlet.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VBRSANEntity[]]`|true    |named   |False        |

#### **Server**
Specifies the file share server. The cmdlet will convert backups protecting an array of these file share servers. Accepts the VBRNASServer[] object. To get this object, run the Get-VBRUnstructuredServer cmdlet.

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
Convert-VBRNASBackupSANFormat -Backup <VBRNASBackup> -SANEntity <VBRSANEntity[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Convert-VBRNASBackupSANFormat -Backup <VBRNASBackup> -Server <VBRNASServer[]> [-Confirm] [-WhatIf] [<CommonParameters>]
```
