Update-VBRUnstructuredBackupPath
--------------------------------

### Synopsis
Updates the data source for file backups and object storage backups.

---

### Description

This cmdlet updates the data source for file backups and object storage backups.
IMPORTANT: Consider the following:
- To correctly update the source file share path for a file backup job that has a configured secondary target, refer to the Updating Source File Share Path for Backup Jobs with Secondary Target section in the Veeam Backup & Replication User Guide.
- To update the data source for object storage backups, the target data source must have the same path as the original data source. For example, if your original data source is "AWS 01" object storage with the "bucket01/Files/reports" location, and you want to change to target data source "AWS 02", it must also have the "bucket01/Files/reports" location. If you want to change the data source and location, run the New-VBRObjectStorageBackupJobObject cmdlet.

---

### Related Links
* [Get-VBRUnstructuredBackup](Get-VBRUnstructuredBackup)

* [Get-VBRUnstructuredServer](Get-VBRUnstructuredServer)

---

### Examples
> Example 1. Updating Path to Existing Source File Share Protected by a File Share Backup Job

$nasbackup = Get-VBRUnstructuredBackup -Name "File Backup Job 1"        
$sourceserver = Get-VBRUnstructuredServer -Backup $nasbackup        
$targetserver = Get-VBRUnstructuredServer -Name "\\WinSRV2049\Documents"        
Update-VBRUnstructuredBackupPath -Backup $nasbackup -SourceUnstructuredServer $sourceserver -TargetUnstructuredServer $targetserver
This example shows how to update the path to the \WinSRV2049\Documents file share protected by a file share backup job.
Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Specify the Name parameter value. Save the result to the $nasbackup variable.
2. Run the Get-VBRUnstructuredServer cmdlet. Set the $nasbackup variable as the Backup parameter value. Save the result to the $sourceserver variable.
3. Run the Get-VBRUnstructuredServer cmdlet. Specify the Name parameter value. Save the result to the $targetserver variable.
4. Run the Update-VBRUnstructuredBackupPath cmdlet. Specify the following settings:
- Set the $nasbackup variable as the Backup parameter value.
- Set the $sourceserver variable as the SourceUnstructuredServer parameter value.

- Set the $targetserver variable as the TargetUnstructuredServer parameter value.
> Example 2. Updating Data Source for Object Storage Backups

$backup = Get-VBRUnstructuredBackup -Name 'update path OS'      
$source = Get-VBRUnstructuredServer -Name '1st minio share'     
$target = Get-VBRUnstructuredServer -Name "2nd minio share"     
Update-VBRUnstructuredBackupPath -Backup $backup -SourceUnstructuredServer $source -TargetUnstructuredServer $target
This example shows how to update the data source for object storage backups. The cmdlet will change the data source from AWS01to AWS02.

Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Specify the Name parameter value. Save the result to the $backup variable.
2. Run the Get-VBRUnstructuredServer cmdlet. Specify the Name parameter value. Save the result to the $source variable.
3. Run the Get-VBRUnstructuredServer cmdlet. Specify the Name parameter value. Save the result to the $target variable.
4. Run the Update-VBRUnstructuredBackupPath cmdlet. Specify the following settings:
- Set the $backup variable as the Backup parameter value.
- Set the $source variable as the SourceUnstructuredServer parameter value.
- Set the $target variable as the TargetUnstructuredServer parameter value.
> Example 3. Updating Name of Root File Share Server

$nasbackup = Get-VBRUnstructuredBackup -Name "File Backup Job 1"        
$targetserver = Get-VBRUnstructuredServer -Name "\\WinSRV2049\Reports"      
Update-VBRUnstructuredBackupPath -Backup $nasbackup -SourceRootNASServerName "\\WinSRV2049\Root" -TargetRootNASServer $targetserver
This example shows how to update the name of the root server to the name that does not exist in the Veeam Backup & Replication database.
Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Specify the Name parameter value. Save the result to the $nasbackup variable.
2. Run the Get-VBRUnstructuredServer cmdlet. Specify the Name parameter value. Save the result to the $targetserver variable.
3. Run the Update-VBRUnstructuredBackupPath cmdlet. Specify the following settings:
- Set the $nasbackup variable as the Backup parameter value.
- Specify the SourceRootNASServerName parameter value.
- Set the $targetserver variable as the TargetNASServer parameter value.
> Example 4. Updating SAN Host

$nasbackup = Get-VBRUnstructuredBackup -Name "File Backup Job 1"        
$sourcenetapp = Get-NetAppHost -Name "pdc-ontap-1"      
$targetnetapp = Get-NetAppHost -Name "pdc-ontap-3"      
Update-VBRUnstructuredBackupPath -Backup $nasbackup -SourceSANEntity $sourcenetapp -TargetSANEntity $targetnetapp
This example shows how to update the SAN host.
Perform the following steps:
1. Run the Get-VBRUnstructuredBackup cmdlet. Specify the Name parameter value. Save the result to the $nasbackup variable.
2. Run the Get-NetAppHost cmdlet. Specify the Name parameter value. Save the result to the $sourcenetapp variable.
3. Run the Get-NetAppHost cmdlet. Specify the Name parameter value. Save the result to the $targetnetapp variable.
4. Run the Update-VBRUnstructuredBackupPath cmdlet. Specify the following settings:
- Set the $nasbackup variable as the Backup parameter value.
- Set the $sourcenetapp variable as the SourceSANEntity parameter value.
- Set the $targetnetapp variable as the TargetSANEntity parameter value.

---

### Parameters
#### **Backup**
Specifies a file share backup or an object storage backup. The cmdlet will update the the data source for these backups. Accepts the VBRUnstructuredBackup object.  To get this object, run the Get-VBRUnstructuredBackup cmdlet.

|Type                     |Required|Position|PipelineInput                 |
|-------------------------|--------|--------|------------------------------|
|`[VBRUnstructuredBackup]`|true    |named   |True (ByPropertyName, ByValue)|

#### **SourceRootNASServerName**
Specifies data source of file share backup or object storage backup. The cmdlet will update this data source to a new data source.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **SourceSANEntity**
Specifies the enterprise NAS system or its volume where the file shares reside. The cmdlet will update the path to this NAS system to a new path. Accepts the VBRSANEntity[] object.  To create this object, run the Get-NetAppHost cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRSANEntity]`|true    |named   |False        |

#### **SourceSANHostName**
Specifies the name of the SAN host object to be changed in the backup.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |False        |

#### **SourceUnstructuredServer**
Specifies data source of file share backup or object storage backup. The cmdlet will update this data source to a new data source. Accepts the VBRUnstructuredServer object.  To get this object, run the Get-VBRUnstructuredServer cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRUnstructuredServer]`|true    |named   |False        |

#### **TargetRootNASServer**
Specifies the file share server. The cmdlet will update the root server name to this one.
Accepts the VBRNASServer object.  To get this object, run the Get-VBRUnstructuredServer cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRNASServer]`|true    |named   |False        |

#### **TargetSANEntity**
Specifies the enterprise NAS system or its volume where the file share will reside. The cmdlet will use this NAS system entity as a new one when updating the backup information. Accepts the VBRSANEntity object.  To create this object, run the Get-NetAppHost cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRSANEntity]`|true    |named   |False        |

#### **TargetSANHost**
Specifies the enterprise NAS system or its volume where the file share will reside. The cmdlet will use this NAS system entity as a new one when updating the backup information. Accepts the VBRSANEntity object.  To create this object, run the Get-NetAppHost cmdlet.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[VBRSANEntity]`|true    |named   |False        |

#### **TargetUnstructuredServer**
Specifies new data source of file share backup or object storage backup. The cmdlet will update this data source to this data source.
Accepts the VBRUnstructuredServer object.  To get this object, run the Get-VBRUnstructuredServer cmdlet.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[VBRUnstructuredServer]`|true    |named   |False        |

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
Veeam.Backup.PowerShell.Infos.VBRUnstructuredBackup

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
Update-VBRUnstructuredBackupPath -Backup <VBRUnstructuredBackup> -SourceRootNASServerName <String> -TargetRootNASServer <VBRNASServer> [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Update-VBRUnstructuredBackupPath -Backup <VBRUnstructuredBackup> -SourceSANEntity <VBRSANEntity> -TargetSANEntity <VBRSANEntity> [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Update-VBRUnstructuredBackupPath -Backup <VBRUnstructuredBackup> -SourceSANHostName <String> -TargetSANHost <VBRSANEntity> [-Confirm] [-WhatIf] [<CommonParameters>]
```
```PowerShell
Update-VBRUnstructuredBackupPath -Backup <VBRUnstructuredBackup> -SourceUnstructuredServer <VBRUnstructuredServer> -TargetUnstructuredServer <VBRUnstructuredServer> [-Confirm] [-WhatIf] [<CommonParameters>]
```
