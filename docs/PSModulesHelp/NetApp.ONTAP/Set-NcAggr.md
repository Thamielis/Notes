Set-NcAggr
----------

### Synopsis
Set the specified aggregate online, offline, or restricted.

---

### Description

Set the specified aggregate online, offline, or restricted.

Online: Bring the specified aggregate online.  This command takes effect immediately.  All volumes on the aggregate are brought to whatever state they were in before the aggregate was restricted or taken offline. If there are CIFS shares associated with the any of the aggregate's volumes that were also onlined, they are enabled.

Offline: Take the specified aggregate offline.  The operation takes effect before the API returns.  Except in maintenance mode, the current root aggregate may not be taken offline.  An aggregate marked to become the root aggregate cannot be taken offline.  An aggregate containing one or more flexible volumes cannot be taken offline; its contained volumes must first be destroyed.  A number of operations being performed on the given aggregate can prevent this operation from succeeding, either at all or for various lengths of time.  If such operations are found, the system waits up to one second for them to finish.  If they don't, the command is aborted. A check is also made for files in the aggregate opened by  internal ONTAP processes.  The command is aborted if any are found.

Restricted: Restrict the specified aggregate.  An aggregate with one or more flexible volumes cannot be restricted; all of its contained volumes must first be destroyed.

---

### Related Links
* [Get-NcAggr](Get-NcAggr)

---

### Examples
> Example 1

Set-NcAggr aggr2 -Restricted
Set aggregate 'aggr2' to Restricted.

Name  State      TotalSize Used Available Disks RaidType       RaidSize Volumes
----  -----      --------- ---- --------- ----- --------       -------- -------
aggr2 restricted         0              0   5   raid_dp,normal    16          0

---

### Parameters
#### **Name**
Name of an existing aggregate.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Online**
Set the aggregate online.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[Switch]`|true    |named   |false        |on<br/>onl|

#### **Plex**
Name of a particular plex to online or offline. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Force**
If specified, ignore two conditions which would normally prevent the aggregate from coming online:
1. It has only 1 plex that is offline and not up-to-date.
2. It is an unmirrored or CFO aggregate that has been switched over to its DR partner as part of an MCC configuration. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Offline**
Set the aggregate offline.

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[Switch]`|true    |named   |false        |off<br/>ofl|

#### **UnmountVolumes**
Offline: This option specifies that all of the volumes hosted by the given aggregate are to be unmounted before the offline operation is executed.  By default, the system will reject any attempt to offline an aggregate that hosts one or more online volumes.
Restricted: This option specifies that all of the volumes hosted by the given aggregate are to be unmounted before the restrict operation is executed.  By default, the system will reject any attempt to restrict an aggregate that hosts one or more online volumes. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |named   |false        |Unmount|

#### **Restricted**
Set the aggregate restricted. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput|Aliases         |
|----------|--------|--------|-------------|----------------|
|`[Switch]`|true    |named   |false        |restrict<br/>res|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Aggr.AggrAttributes

---

### Notes
Category: aggr
API: aggr-online, aggr-offline, aggr-restrict
Family: cluster

---

### Syntax
```PowerShell
Set-NcAggr [-Name] <String> -Online [-Plex <String>] [-Force] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcAggr [-Name] <String> -Offline [-UnmountVolumes] [-Plex <String>] [-Force] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcAggr [-Name] <String> -Restricted [-UnmountVolumes] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
