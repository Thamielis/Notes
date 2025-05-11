Get-NcVolSpace
--------------

### Synopsis
Get a list of volumes and a breakup of their used space.

---

### Description

Get a list of volumes and a breakup of their used space. This information parameter is available when the volume is online.

---

### Examples
> Example 1

Get-NcVolSpace -Vserver beam01
Get the volume space for all of the volumes on beam01.

Volume                       TotalUsed     UserData    SnapshotReserve     FilesystemMetadata Vserver
------                       ---------     --------    ---------------     ------------------ -------
beam01_rootvol                   52 MB        20 KB              51 MB                 280 KB beam01
luns                             25 GB        76 KB              25 GB                 844 KB beam01
luns_clone                       25 GB        76 KB              25 GB                 844 KB beam01

> Example 2

$query = Get-NcVolSpace -Template
$query.SnapshotReservePercent = "5"
Get-NcVolSpace -Query $query
Get all of the volume space information for volumes with the default snapshot reserve percent.

Volume                       TotalUsed     UserData    SnapshotReserve     FilesystemMetadata Vserver
------                       ---------     --------    ---------------     ------------------ -------
beam01_rootvol                   52 MB        20 KB              51 MB                 280 KB beam01
luns                             25 GB        40 KB              25 GB                 860 KB beam01
luns_clone                       25 GB        40 KB              25 GB                 860 KB beam01
dummy_root_vol                   52 MB        20 KB              51 MB                 280 KB dummy
vol1                              4 MB        28 KB               4 MB                 104 KB dummy
vol0                             80 GB         9 GB              71 GB                  86 MB sfp-cmode-02-01
vol0                             79 GB         8 GB              71 GB                  86 MB sfp-cmode-02-02

---

### Parameters
#### **Name**
The name of one or more volumes to for which the space usage is requested.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Volume |

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **Attributes**
For improved scalability in large clusters, provide a SpaceInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcVolSpace -Template" to get the initially empty SpaceInfo object.  If not specified, all data is returned for each object.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[SpaceInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty SpaceInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SpaceInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcVolSpace -Template" to get the initially empty SpaceInfo object.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[SpaceInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.SpaceInfo

---

### Notes
Category: volume
API: volume-space-get-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcVolSpace [[-Name] <String[]>] [-Vserver <String[]>] [-Attributes <SpaceInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVolSpace -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVolSpace -Query <SpaceInfo> [-Attributes <SpaceInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
