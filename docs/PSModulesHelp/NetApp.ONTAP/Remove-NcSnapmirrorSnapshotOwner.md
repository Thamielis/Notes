Remove-NcSnapmirrorSnapshotOwner
--------------------------------

### Synopsis
Delete an owner used to preserve a Snapshot copy for a SnapMirror mirror-to-vault cascade configuration.

---

### Description

Delete an owner used to preserve a Snapshot copy for a SnapMirror mirror-to-vault cascade configuration.

---

### Related Links
* [Get-NcSnapmirrorSnapshotOwner](Get-NcSnapmirrorSnapshotOwner)

* [Add-NcSnapmirrorSnapshotOwner](Add-NcSnapmirrorSnapshotOwner)

---

### Examples
> Example 1

```PowerShell
Remove-NcSnapmirrorSnapshotOwner -Vserver beam01 -Volume luns -Snapshot snapmirror.f57fc6fe-81e3-11e2-86af-123478563412_2147485092.2013-02-28_204559
Remove the default owner from the given snapshot.
```

---

### Parameters
#### **Vserver**
Vserver name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Volume**
Volume name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Snapshot**
Snapshot name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **Owner**
Owner to be removed from the Snapshot copy. If no owner name is provided, the system will look for and remove the internal default name for the owner. A specified owner of '*' removes all owners from the Snapshot copy.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* 

---

### Notes
Category: snapmirror
API: snapmirror-snapshot-owner-destroy
Family: vserver

---

### Syntax
```PowerShell
Remove-NcSnapmirrorSnapshotOwner [-Vserver] <String> [-Volume] <String> [-Snapshot] <String> [-Owner <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
