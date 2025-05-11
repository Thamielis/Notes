Set-NcVol
---------

### Synopsis
Set the specified volume online, offline, or restricted.

---

### Description

Set the specified volume online, offline, or restricted.

Online: Bring the specified volume online. This command takes effect immediately.  If there are CIFS shares associated with the volume, they are enabled.

Offline: Take the specified volume offline, making it unavailable for user-level data access. The operation takes effect before the API returns except in maintenance mode, when the current root volume may not be taken offline.  A volume marked to become the root cannot be taken offline.  Taking a flexible volume offline does not affect its containing aggregate in any way. A number of operations being performed on the given volume (or its containing aggregate) can prevent this operation from succeeding, either at all or for various lengths of time.  If such operations are found, the system waits up to one second for them to finish.  If they don't, the command is aborted. A check is also made for files on the volume opened by internal ONTAP processes.  The command is aborted if any are found.

Restricted: Restrict the specified volume, making it unavailable for user-level data access.

When run with the InfiniteVolume switch, the cmdlet runs asynchronously.  A job is returned.  The status of the job can be tracked using the Job cmdlets.

---

### Related Links
* [Get-NcVol](Get-NcVol)

---

### Examples
> Example 1

Set-NcVol vol2 -Online
Set volume 'vol2' online.

Name State  TotalSize Used Available Dedupe Aggregate Vserver
---- -----  --------- ---- --------- ------ --------- -------
vol2 online   10.0 GB   5%    9.5 GB False  aggr1     vserver1

> Example 2

Set-NcVol vol2 -Restricted
Set volume 'vol2' restricted.

Set volume Restricted
Are you sure you want to set volume vol2 to Restricted?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

Name State      TotalSize Used Available Dedupe Aggregate Vserver
---- -----      --------- ---- --------- ------ --------- -------
vol2 restricted   10.0 GB                       aggr1     vserver1

> Example 3

Set-NcVol vol2 -Offline
Set volume 'vol2' offline.

Set volume Offline
Are you sure you want to set volume vol2 to Offline?
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

Name State   TotalSize Used Available Dedupe Aggregate Vserver
---- -----   --------- ---- --------- ------ --------- -------
vol2 offline   10.0 GB                       aggr1     vserver1

---

### Parameters
#### **Name**
Name of an existing volume.
Online: If a volume is specified, it must be currently offline, or restricted.  If the volume is inconsistent, but has not lost data, it is advisable to run WAFL_check or wafliron (or do a 'snapmirror initialize' in case of a replica volume) prior to bringing an inconsistent volume online.  Bringing an inconsistent volume online increases the risk of further file system corruption.  If the volume is inconsistent and has experienced possible loss of data, it cannot be brought online unless WAFL_check or wafliron (or 'snapmirror initialize') has been run on the volume.
Offline: If a volume contains CIFS shares, users should be warned before taking the volume offline.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Online**
Set the volume online.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[Switch]`|false   |named   |false        |on<br/>onl|

#### **Offline**
Set the volume offline.

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[Switch]`|false   |named   |false        |off<br/>ofl|

#### **Restricted**
Set the volume restricted.

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[Switch]`|false   |named   |false        |restrict<br/>res|

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

#### **InfiniteVolume**
Specify the InfiniteVolume parameter to indicate the volume is an Infinite Volume.  If a VolumeAttributes object is piped to this cmdlet, the InfiniteVolume switch will be automatically set.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[Switch]`|true    |named   |true (ByPropertyName)|IsInfiniteVolume|

#### **FlexGroupVolume**

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[Switch]`|true    |named   |true (ByPropertyName)|IsFlexGroupVolume|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.VolumeAttributes

---

### Notes
Category: volume
API: volume-online, volume-offline, volume-restrict, volume-online-async, volume-offline-async, volume-restrict-async
Family: vserver

---

### Syntax
```PowerShell
Set-NcVol [-Name] <String> [-Online] [-Offline] [-Restricted] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcVol [-Name] <String> [-Online] [-Offline] [-Restricted] -InfiniteVolume [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcVol [-Name] <String> [-Online] [-Offline] [-Restricted] -FlexGroupVolume [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
