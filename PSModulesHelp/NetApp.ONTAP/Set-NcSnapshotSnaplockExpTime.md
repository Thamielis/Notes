Set-NcSnapshotSnaplockExpTime
-----------------------------

### Synopsis
Modifies snaplock expiry time of a snapshot copy.

---

### Description

Modifies snaplock expiry time of a snapshot copy. Expiry time can only be extended from existing expiry time.

---

### Parameters
#### **Volume**
Specifies the name of the volume that contains snapshot copy.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Snapshot**
Specifies the name of the snapshot copy for which snaplock expiry time needs to be modified. The snapshot must have already been retained by snaplock.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |2       |true (ByPropertyName)|Name<br/>SnapName|

#### **Expirytime**
New expiry time.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[DateTime]`|true    |3       |true (ByPropertyName)|

#### **InfiniteExpiryTime**
If set to true, api will set the infinite expiry time on the specified snapshot copy.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: snapshot
API: snapshot-modify-snaplock-expiry-time
Family: vserver

---

### Syntax
```PowerShell
Set-NcSnapshotSnaplockExpTime [-Volume] <String> [-Snapshot] <String> [-Expirytime] <DateTime> [-InfiniteExpiryTime] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
