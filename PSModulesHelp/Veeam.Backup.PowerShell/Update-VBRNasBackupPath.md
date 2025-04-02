Update-VBRNasBackupPath
-----------------------

### Synopsis
Updates the file path to the source file share.

---

### Description

This cmdlet updates the file path to the source file share.

---

### Related Links
* [Get-VBRNASBackup](Get-VBRNASBackup)

* [Get-VBRNASServer](Get-VBRNASServer)

* [Get-NetAppHost](Get-NetAppHost)

---

### Examples
> Example 1. Updating Path to Existing Source File Share Protected by a File Share Backup Job

$nasbackup = Get-VBRNASBackup -Name "File Backup Job 1"
$sourceserver = Get-VBRNASServer -Backup $nasbackup
$targetserver = Get-VBRNASServer -Name "\\WinSRV2049\Documents"
Update-VBRNasBackupPath -Backup $nasbackup -SourceNASServer $sourceserver -TargetNASServer $targetserver
This example shows how to update the path to the existing source SMB or NFS file share or root server protected by a file share backup job.

Perform the following steps:
1. Run the Get-VBRNASBackup cmdlet. Specify the Name parameter value. Save the result to the $nasbackup variable.
2. Run the Get-VBRNASServer cmdlet. Set the $nasbackup variable as the Backup parameter value. Save the result to the $sourceserver variable.
3. Run the Get-VBRNASServer cmdlet. Specify the Name parameter value. Save the result to the $targetserver variable.
4. Run the Update-VBRNasBackupPath cmdlet. Specify the following settings:
- Set the $nasbackup variable as the Backup parameter value.
- Set the $sourceserver variable as the SourceNASServer parameter value.
- Set the $targetserver variable as the TargetNASServer parameter value.
> Example 2. Updating Name of Root File Share Server

$nasbackup = Get-VBRNASBackup -Name "File Backup Job 1"
$targetserver = Get-VBRNASServer -Name "\\WinSRV2049\Reports"
Update-VBRNasBackupPath -Backup $nasbackup -SourceRootNASServerName "\\WinSRV2049\Root" -TargetRootNASServer $targetserver
This example shows how to update the name of the root server to the name that does not exist in the Veeam Backup & Replication database. Perform the following steps:
1. Run the Get-VBRNASBackup cmdlet. Specify the Name parameter value. Save the result to the $nasbackup variable.
2. Run the Get-VBRNASServer cmdlet. Specify the Name parameter value. Save the result to the $targetserver variable.
3. Run the Update-VBRNasBackupPath cmdlet. Specify the following settings:
- Set the $nasbackup variable as the Backup parameter value.
- Specify the SourceRootNASServerName parameter value.
- Set the $targetserver variable as the TargetNASServer parameter value.
> Example 3. Updating SAN Host

$nasbackup = Get-VBRNASBackup -Name "File Backup Job 1"
$sourcenetapp = Get-NetAppHost -Name "pdc-ontap-1"
$targetnetapp = Get-NetAppHost -Name "pdc-ontap-3"
Update-VBRNasBackupPath -Backup $nasbackup -SourceSANEntity $sourcenetapp -TargetSANEntity $targetnetapp
This example shows how to update the SAN host. Perform the following steps:
1. Run the Get-VBRNASBackup cmdlet. Specify the Name parameter value. Save the result to the $nasbackup variable.
2. Run the Get-NetAppHost cmdlet. Specify the Name parameter value. Save the result to the $sourcenetapp variable.
3. Run the Get-NetAppHost cmdlet. Specify the Name parameter value. Save the result to the $targetnetapp variable.
4. Run the Update-VBRNasBackupPath cmdlet. Specify the following settings:
- Set the $nasbackup variable as the Backup parameter value.
- Set the $sourcenetapp variable as the SourceSANEntity parameter value.
- Set the $targetnetapp variable as the TargetSANEntity parameter value.
> Example 4. Updating SAN Host Name

$nasbackup = Get-VBRNASBackup -Name "File Backup Job 1"
$targetnetapp = Get-NetAppHost -Name "pdc-ontap-3"
Update-VBRNasBackupPath -Backup $nasbackup -SourceSANHostName "pdc-ontap-5" -TargetSANHost $targetnetapp
This example shows how to update the name of the SAN host. The cmdlet will change the SAN hpst name from pdc-ontap-3 to pdc-ontap-5.

Perform the following steps:
1. Run the Get-VBRNASBackup cmdlet. Specify the Name parameter value. Save the result to the $nasbackup variable.
2. Run the Get-NetAppHost cmdlet. Specify the Name parameter value. Save the result to the $targetnetapp variable.
3. Run the Update-VBRNasBackupPath cmdlet. Specify the following settings:
- Set the $nasbackup variable as the Backup parameter value.
- Specify the SourceSANHostName parameter value.
- Set the $targetnetapp variable as the TargetSANHost parameter value.

---

### Parameters
#### **Backup**
Specifies a file share backup. The cmdlet will update the path to the source file share for this backup. Accepts the VBRNASBackup object. To get this object, run the Get-VBRNASBackup cmdlet.

|Type            |Required|Position|PipelineInput                 |
|----------------|--------|--------|------------------------------|
|`[VBRNASBackup]`|true    |named   |True (ByPropertyName, ByValue)|

#### **SourceNASServer**
Specifies the file share server. The cmdlet will update this path/file share/server name to a new one. Accepts the VBRNASServer object. To get this object, run the Get-VBRNASServer cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRNASServer]`|true    |named   |False        |

#### **SourceRootNASServerName**
Specifies the name of the source file share server.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **SourceSANEntity**
Specifies the enterprise NAS system or its volume where the file shares reside. The cmdlet will update the path to this NAS system to a new path. Accepts the VBRSANEntity object. To create this object, run the Get-NetAppHost cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRSANEntity]`|true    |named   |False        |

#### **SourceSANHostName**
Specifies the name of the SAN host object to be changed in the backup.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **TargetNASServer**
Specifies the file share server. The cmdlet will update the file share path/name/server name to this one. Accepts the VBRNASServer object. To get this object, run the Get-VBRNASServer cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRNASServer]`|true    |named   |False        |

#### **TargetRootNASServer**
Specifies the file share server. The cmdlet will update the root server name to this one. Accepts the VBRNASServer object. To get this object, run the Get-VBRNASServer cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRNASServer]`|true    |named   |False        |

#### **TargetSANEntity**
Specifies the enterprise NAS system or its volume where the file share will reside. The cmdlet will use this NAS system entity as a new one when updating the backup information. Accepts the VBRSANEntity object. To create this object, run the Get-NetAppHost cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRSANEntity]`|true    |named   |False        |

#### **TargetSANHost**
Specifies the enterprise NAS system or its volume where the file share will reside. The cmdlet will use this NAS system entity as a new one when updating the backup information. Accepts the VBRSANEntity object. To create this object, run the Get-NetAppHost cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRSANEntity]`|true    |named   |False        |

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
Update-VBRNasBackupPath -Backup <VBRNASBackup> -SourceNASServer <VBRNASServer> -TargetNASServer <VBRNASServer> [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Update-VBRNasBackupPath -Backup <VBRNASBackup> -SourceRootNASServerName <String> -TargetRootNASServer <VBRNASServer> [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Update-VBRNasBackupPath -Backup <VBRNASBackup> -SourceSANEntity <VBRSANEntity> -TargetSANEntity <VBRSANEntity> [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Update-VBRNasBackupPath -Backup <VBRNASBackup> -SourceSANHostName <String> -TargetSANHost <VBRSANEntity> [-Confirm] [-WhatIf] [<CommonParameters>]
```
