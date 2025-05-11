Get-NcVolFootprint
------------------

### Synopsis
Get a list of volumes and their data and metadata footprints in their parent aggregate.

---

### Description

Get a list of volumes and their data and metadata footprints in their parent aggregate. The term footprint is used to refer to space that is considered used in an aggregate due to data in a specific volume.

---

### Examples
> Example 1

Get-NcVolFootprint -Vserver beam01
Get the volume footprint of all the volumes on the given Vserver.

Volume                      TotalFootprint    VolumeBlocksFootprint       FlexvolMetadataFootprint Vserver
------                      --------------    ---------------------       ------------------------ -------
beam01_rootvol                        1 GB                     2 MB                           9 MB beam01
luns                                196 MB                     5 MB                          40 MB beam01
luns_clone                           86 MB                     4 MB                          40 MB beam01

> Example 2

$query = Get-NcVolFootprint -Template
$query.TotalFootprint = ">500GB"
Get-NcVolFootprint -Query $query
Get the footprint of volumes with a total footprint greater than 500GB.

Volume                      TotalFootprint    VolumeBlocksFootprint       FlexvolMetadataFootprint Vserver
------                      --------------    ---------------------       ------------------------ -------
vol0                                  1 TB                     7 GB                           8 GB sfp-cmode-02-01
vol0                                  1 TB                     6 GB                           8 GB sfp-cmode-02-02

---

### Parameters
#### **Name**
The name of one or more volumes for which the space usage is requested..  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Volume |

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **Attributes**
For improved scalability in large clusters, provide a FootprintInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcVolFootprint -Template" to get the initially empty FootprintInfo object.  If not specified, all data is returned for each object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[FootprintInfo]`|false   |named   |false        |

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
Specify to get an empty FootprintInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a FootprintInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcVolFootprint -Template" to get the initially empty FootprintInfo object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[FootprintInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.FootprintInfo

---

### Notes
Category: volume
API: volume-footprint-get-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcVolFootprint [[-Name] <String[]>] [-Vserver <String[]>] [-Attributes <FootprintInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVolFootprint -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVolFootprint -Query <FootprintInfo> [-Attributes <FootprintInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
