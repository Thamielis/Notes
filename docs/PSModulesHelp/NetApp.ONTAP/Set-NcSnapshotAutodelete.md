Set-NcSnapshotAutodelete
------------------------

### Synopsis
Modifies the current snapshot autodelete settings.

---

### Description

Modifies the current snapshot autodelete settings.

---

### Related Links
* [Get-NcSnapshotAutodelete](Get-NcSnapshotAutodelete)

---

### Examples
> Example 1

Set-NcSnapshotAutodelete vol2 target_free_space 20
Set the target free space on volume 'vol2' to 20%.

Name State  TotalSize Used Available Dedupe Aggregate Vserver
---- -----  --------- ---- --------- ------ --------- -------
vol2 online   11.0 GB   5%   10.4 GB False  aggr1     vserver1

> Example 2

Get-NcVol | Set-NcSnapshotAutodelete -Key target_free_space -Value 20
Set the target free space on all volumes to 20%.

Name         State  TotalSize Used Available Dedupe Aggregate Vserver
----         -----  --------- ---- --------- ------ --------- -------
bigvol       online  100.0 GB   5%   95.0 GB False  aggr2     vserver1
georgeVol1   online   20.0 MB  55%    8.8 MB False  aggr1     vserver1
vol_test     online   20.0 MB   5%   18.9 MB False  aggr2     vserver1
vol1         online   20.0 GB   5%   19.0 GB False  aggr1     vserver1
vol2         online   11.0 GB   5%   10.4 GB False  aggr1     vserver1
vol2clone    online   11.0 GB   5%   10.4 GB False  aggr1     vserver1
vserver1vol0 online   20.0 MB   5%   18.9 MB False  aggr1     vserver1

---

### Parameters
#### **Volume**
Name of the volume for which we want to change autodelete settings.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|true    |1       |true (ByPropertyName)|TargetName<br/>Name|

#### **Key**
Name of the option to be set.
Possible values: 
"state" (value: "on" | "off)
This option determines if the snapshot autodelete is currently enabled for the volume. Setting the option to "on" switches on the snapshot autodelete for the volume. Setting the option to "off" switches off the snapshot autodelete for the volume.
"commitment" (value: "try" | "disrupt" | "destroy")
This option determines the snapshots which snapshot autodelete is allowed to delete to get back space.  Setting this option to "try" only permits the snapshots which are not locked by data protection utilities (dump, mirroring, NDMPcopy) and data backing functionalities (volume, LUN and File clones) to be deleted.  Setting this option to "disrupt" only permits the snapshots which are not locked by data backing functionalities (volume, LUN and File clones) to be deleted.  Setting this option to "destroy", will destroy the data backing functionality (volume,LUN and File Clones) if the backing snapshot is deleted.
"trigger" (value: "volume" | "snap_reserve" | "space_reserve")
This option determines the condition in which snapshots should be automatically deleted. Setting this option to "volume" triggers snapshot autodelete to run when the volume is near full.  Setting this option to "snap_reseve" triggers snapshot autodelete to run when the snap reserve of the volume is near full.  Setting this option to "space_reserve" triggers snapshot autodelete to run when the space reserved in the volume is near full.
"target_free_space" (value: <number>)
This option determines when snapshot autodelete should stop deleting snapshots.  Depending on the trigger, snapshots are deleted until reaching the target free space percentage.
"delete_order" (value: newest_first | oldest_first)
This option determines if the oldest or newest snapshot is deleted first.
"defer_delete" (value: scheduled | user_created | prefix | none)
This option determines which kind of snapshots to delete in the end.  Setting this option value to "scheduled" will delete the snapshots created by the snapshot scheduler last.  Setting this option value to "user_created" will delete the snapshots not created by the snapshot scheduler last.  Setting this option value to "prefix" will delete the snapshots matching the prefix string to be deleted last.  Setting this option value to "none" will disable the above choices.
"prefix" (value: <string>)
This option can be set to provide the prefix string for the "prefix" value of the "defer_delete" option.  The prefix string length can be 15 characters long.
"destroy_list" (value: <string>)
A comma seperated list of services which can be destroyed if the snapshot backing that service is deleted.  The possible values for this option are a combination of "lun_clone,file_clone" (for LUN clone and/or file clone), "lun_clone,sfsr" (for LUN clone and/or sfsr), "vol_clone", "cifs_share", or "none".  Please note that "lun_clone", "file_clone" and "sfsr" individually are not valid values.  Only pairs "lun_clone,file_clone" and "lun_clone,sfsr" are supported.  The default value is "none".

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |2       |true (ByPropertyName)|OptionName|

#### **Value**
The value to set the named option.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|true    |3       |true (ByPropertyName)|OptionValue|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.VolumeAttributes

---

### Notes
Category: snapshot
API: snapshot-autodelete-set-option
Family: vserver

---

### Syntax
```PowerShell
Set-NcSnapshotAutodelete [-Volume] <String> [-Key] <String> [-Value] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
