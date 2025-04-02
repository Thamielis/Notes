Test-NcSnapshotMulti
--------------------

### Synopsis

---

### Description

This is a companion cmdlet of New-NcSnapshotMulti which validates the snapshot creation operation on the specified volumes without actually creating any snapshot.  This API is intended to be issued before New-NcSnapshotMulti to find out all the errors that may be found during the snapshot create. Its main purpose is to enable the New-NcSnapshotMulti caller to reduce the likelihood of failure, thereby attempting to avoid the cleanup overhead (of deleting any newly created snapshots) during failure processing.  However, this validation API does not guarantee that New-NcSnapshotMulti will actually work.  Something could change between the two calls to cause the actual snapshot creations to fail.

---

### Related Links
* [New-NcSnapshotMulti](New-NcSnapshotMulti)

---

### Examples
> Example 1

```PowerShell
Test-NcSnapshotMulti vol1,vol2 snap1
Check to see if "New-NcSnapshotMulti vol1,vol2 snap1" could be expected to work.

NcController   : 10.61.172.155
Errno          : 13020
Name           : vol1
Reason         : Snapshot already exists.
ErrnoSpecified : True

NcController   : 10.61.172.155
Errno          : 13020
Name           : vol2
Reason         : Snapshot already exists.
ErrnoSpecified : True

```

---

### Parameters
#### **Volumes**
Names of the volumes across which the snapshot creation is to be validated.

|Type        |Required|Position|PipelineInput        |Aliases        |
|------------|--------|--------|---------------------|---------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|Name<br/>Volume|

#### **SnapName**
Name of the snapshot to be created.  The maximum string length is 256 characters.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Snapshot.VolumeError

---

### Notes
Category: snapshot
API: snapshot-multicreate-validate
Family: vserver

---

### Syntax
```PowerShell
Test-NcSnapshotMulti [-Volumes] <String[]> [-SnapName] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
