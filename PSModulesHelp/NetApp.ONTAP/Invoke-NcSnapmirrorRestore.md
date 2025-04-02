Invoke-NcSnapmirrorRestore
--------------------------

### Synopsis
Restore the contents of a selected Snapshot copy from the source volume to the active file system of the destination volume.

---

### Description

Restore the contents of a selected Snapshot copy from the source volume to the active file system of the destination volume.  The destination volume is read write after the data is restored.

The Invoke-NcSnapmirrorRestore cmdlet creates a temporary SnapMirror relationship of the type RST. For this reason the destination volume cannot be the destination volume of another SnapMirror relationship. The temporary RST relationship is deleted after the operation completes successfully.

If the destination volume is an empty data protection volume, the cmdlet performs a baseline restore. The baseline restore transfers the contents of the selected Snapshot copy from the source volume to the destination volume.

If the destination volume is read-write and has at least one Snapshot which also appears on the source volume, an incremental restore is performed.

The destination volume is made read only, if is not already read only. When the destination volume is made read only the latest snapshot on destination volume is made the exported snapshot. Note, that any data written to the destination volume since the last snapshot is lost during this operation. To save the contents of the active file system on the destination volume, stop all client access and take a snapshot before starting this operation.

During an incremental restore a common Snapshot copy is selected. The snapshot chosen as the common snapshot must be on the source and destination volumes. The contents of the common Snapshot copy on the destination volume are copied to the active file system of the destination volume. Then the contents of the Snapshot copy to be restored are transferred from the source volume to the destination volume.

Unless SourceSnapshot is specified the most recent Snapshot copy on the source volume is restored.

This cmdlet may be used to restart a failed snapmirror-restore operation. This cmdlet may be used to terminate an aborted or failed snapmirror-restore operation by specifying the CleanUpFailure switch. Terminating an aborted or failed snapmirror-restore operation deletes any residual temporary RST relationship and converts the destination volume back to read-write if the destination volume was read-write prior to initial snapmirror-restore operation while removing any data transferred or copied during the snapmirror-restore operation. 

A job will be spawned to operate on the snapmirror and the job id will be returned. The progress of the job can be tracked using the job cmdlets.

---

### Related Links
* [Get-NcSnapmirror](Get-NcSnapmirror)

---

### Examples
> Example 1

---

### Parameters
#### **Destination**
Specifies the destination endpoint of the SnapMirror relationship in the format: [cluster:]//vserver/volume.  This format may change in the future.  When specifying a destination endpoint, you must use either the destination location, or the destination cluster, destination vserver, and destination volume.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|true    |1       |true (ByPropertyName)|DestinationLocation|

#### **Source**
Specifies the source endpoint of the SnapMirror relationship in the format: [cluster:]//vserver/volume.  This format may change in the future.  When specifying a source endpoint, you must use either the source location, or the source cluster, source vserver, and source volume.

|Type      |Required|Position|PipelineInput        |Aliases       |
|----------|--------|--------|---------------------|--------------|
|`[String]`|false   |2       |true (ByPropertyName)|SourceLocation|

#### **SourceSnapshot**
The Snapshot from the source to be restored.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **MaxTransferRate**
The upper bound at which data is transferred between clusters. The default is unlimited (0) which permits the SnapMirror relationship to fully utilize the available network bandwidth.  The MaxTransferRate does not affect load-sharing mirrors and other SnapMirror relationships confined to a single cluster.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **TransferPriority**
Specifies the priority at which the transfer runs.  Possible values are: 'normal', and 'low'. The default value for this parameter is 'normal'.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Tries**
Specifies the total number of attempts to transfer data.  This value has no effect if the UnlimitedTries switch is present.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **UnlimitedTries**
If specified, defines an unlimited number of attempts to transfer data.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DisableStorageEfficiency**
The default behavior of restore is to preserve storage efficiency when possible. If specified, turn off storage efficiency for data transferred over the wire and written to the destination volume.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CleanUpFailure**
If specified, recover from an aborted or failed restore operation. If the destination volume was read-write prior to the failed or aborted restore operation, it is converted back to read-write if necessary while removing all data transferred or copied during the restore operation. Any residual temporary RST relationship is also removed from the destination Vserver.  An attempt is made to remove any residual temporary RST relationship from the source Vserver.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **RestoreFileList**
The files or LUNs of the Snapshot copy to be restored and the location to which the files or LUNs are restored in the active file system (AFS) on the destination volume.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **CreateCheckSnapshot**
If specified, a Snapshot copy is created on the destination volume.
        
The purpose of this Snapshot copy is for verifying the contents of files or LUNs restored using the Invoke-NcSnapmirrorCheck cmdlet. The name of the Snapshot copy created is of the form 'snapmirrorCHK.<destination volume Vserver UUID>.<destination volume msid>.<time_stamp>'. 
Once the Snapshot copy is no longer needed for verifying data it is the responsibility of the user to delete the Snapshot copy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UseNetworkCompression**
If true, network compression is used for transfer of data.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Passthru**
Specify to output the SnapMirror object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CgItemMappings**
Consistency Group Item Mappings
This parameter is available in ONTAP 9.3 and later.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **InformationAction**

Valid Values:

* SilentlyContinue
* Stop
* Continue
* Inquire
* Ignore
* Suspend

|Type                |Required|Position|PipelineInput|Aliases|
|--------------------|--------|--------|-------------|-------|
|`[ActionPreference]`|false   |named   |false        |infa   |

#### **InformationVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |iv     |

#### **PipelineVariable**

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |pv     |

#### **ZapiRetryCount**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **DestinationCluster**
Specifies the destination cluster of the SnapMirror relationship.  The destination vserver and destination volume must also be specified if using this parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **DestinationVserver**
Specifies the destination vserver of the SnapMirror relationship.  The destination cluster and destination volume must also be specified if using this parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **DestinationVolume**
Specifies the destination volume of the SnapMirror relationship.  The destination cluster and destination vserver must also be specified if using this parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **SourceCluster**
Specifies the source cluster of the SnapMirror relationship.  The source vserver and source volume must also be specified if using this parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SourceVserver**
Specifies the source vserver of the SnapMirror relationship.  The source cluster and source volume must also be specified if using this parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SourceVolume**
Specifies the source volume of the SnapMirror relationship.  The source cluster and source vserver must also be specified if using this parameter.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: snapmirror
API: snapmirror-restore,snapmirror-restore-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Invoke-NcSnapmirrorRestore [-Destination] <String> [[-Source] <String>] [-SourceSnapshot <String>] [-MaxTransferRate <String>] [-TransferPriority <String>] [-Tries <Int32>] [-UnlimitedTries] 
```
```PowerShell
[-DisableStorageEfficiency] [-CleanUpFailure] [-RestoreFileList <String[]>] [-CreateCheckSnapshot] [-UseNetworkCompression] [-Passthru] [-CgItemMappings <String[]>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Invoke-NcSnapmirrorRestore [-DestinationCluster <String>] -DestinationVserver <String> -DestinationVolume <String> [-SourceCluster <String>] [-SourceVserver <String>] [-SourceVolume <String>] 
```
```PowerShell
[-SourceSnapshot <String>] [-MaxTransferRate <String>] [-TransferPriority <String>] [-Tries <Int32>] [-UnlimitedTries] [-DisableStorageEfficiency] [-CleanUpFailure] [-RestoreFileList 
```
```PowerShell
<String[]>] [-CreateCheckSnapshot] [-UseNetworkCompression] [-Passthru] [-CgItemMappings <String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
