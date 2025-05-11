Get-NcSnapshot
--------------

### Synopsis
Get a list of snapshot objects.

---

### Description

Get a list of snapshot objects.

---

### Related Links
* [New-NcSnapshot](New-NcSnapshot)

* [Remove-NcSnapshot](Remove-NcSnapshot)

---

### Examples
> Example 1

Get-NcSnapshot vol2
Get the snapshots from volume 'vol2'.

Name                      Volume               Vserver
----                      ------               -------
clone_vol2clone.0         vol2                 vserver1
clone_vol2clone.1         vol2                 vserver1
clone_vol2clone.2         vol2                 vserver1
clone_vol2clone.3         vol2                 vserver1
clone_vol2clone.4         vol2                 vserver1
weekly.2011-09-04_0015    vol2                 vserver1
deleteMeAgain             vol2                 vserver1
daily.2011-09-11_0010     vol2                 vserver1
weekly.2011-09-11_0015    vol2                 vserver1
daily.2011-09-12_0010     vol2                 vserver1
hourly.2011-09-12_0905    vol2                 vserver1
hourly.2011-09-12_1005    vol2                 vserver1
hourly.2011-09-12_1105    vol2                 vserver1
hourly.2011-09-12_1205    vol2                 vserver1
hourly.2011-09-12_1305    vol2                 vserver1
hourly.2011-09-12_1405    vol2                 vserver1

> Example 2

$query = Get-NcSnapshot -Template
$query.CumulativeTotalBlocks = ">" + (1mb/1kb)
Get-NcSnapshot -Query $query | select Name, Volume
Get all snapshots whose total cumulative space is greater than 1 MB.  Note that the space must be specified in the number of 1024 byte blocks.

Name                   Volume
----                   ------
weekly.2011-09-04_0015 bigvol
daily.2011-09-11_0010  bigvol
weekly.2011-09-11_0015 bigvol
daily.2011-09-12_0010  bigvol
weekly.2011-09-04_0015 vol1
daily.2011-09-11_0010  vol1
clone_vol2clone.0      vol2
clone_vol2clone.1      vol2
clone_vol2clone.2      vol2
clone_vol2clone.3      vol2
clone_vol2clone.4      vol2
weekly.2011-09-04_0015 vol2
deleteMeAgain          vol2
clone_vol2clone.4      vol2clone
weekly.2011-09-04_0015 vol2clone

> Example 3

Get-NcSnapshot -SnapName weekly* -Vserver vserver1,vserver2
List all weekly snapshots in vservers "vserver1" and "vserver2".

Name                      Volume               Vserver
----                      ------               -------
weekly.2011-09-04_0015    bigvol               vserver1
weekly.2011-09-11_0015    bigvol               vserver1
weekly.2011-09-04_0015    georgeVol1           vserver1
weekly.2011-09-11_0015    georgeVol1           vserver1
weekly.2011-09-04_0015    vol1                 vserver1
weekly.2011-09-11_0015    vol1                 vserver1
weekly.2011-09-04_0015    vol2                 vserver1
weekly.2011-09-11_0015    vol2                 vserver1
weekly.2011-09-04_0015    vol2clone            vserver1
weekly.2011-09-11_0015    vol2clone            vserver1
weekly.2011-09-04_0015    vol_test             vserver1
weekly.2011-09-11_0015    vol_test             vserver1
weekly.2011-09-04_0015    vserver1vol0         vserver1
weekly.2011-09-11_0015    vserver1vol0         vserver1
weekly.2011-09-04_0015    vserver2vol0         vserver2
weekly.2011-09-11_0015    vserver2vol0         vserver2

---

### Parameters
#### **Volume**
Restrict results to the specified volumes.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases            |
|------------|--------|--------|---------------------|-------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|TargetName<br/>Name|

#### **SnapName**
The name of one or more snapshots to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases                  |
|------------|--------|--------|---------------------|-------------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|Snapshot<br/>SnapshotName|

#### **Vserver**
Restrict results to the specified vservers.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **Attributes**
For improved scalability in large clusters, provide a SnapshotInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSnapshot -Template" to get the initially empty SnapshotInfo object.  If not specified, all data is returned for each object.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SnapshotInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty SnapshotInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SnapshotInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSnapshot -Template" to get the initially empty SnapshotInfo object.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[SnapshotInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snapshot.SnapshotInfo

---

### Notes
Category: snapshot
API: snapshot-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcSnapshot [[-Volume] <String[]>] [[-SnapName] <String[]>] [-Vserver <String[]>] [-Attributes <SnapshotInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnapshot -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcSnapshot -Query <SnapshotInfo> [-Attributes <SnapshotInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
