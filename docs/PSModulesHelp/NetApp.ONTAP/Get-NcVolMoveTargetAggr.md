Get-NcVolMoveTargetAggr
-----------------------

### Synopsis
Scans aggregates and returns a list of compatible target aggregates for the given volume move operation.

---

### Description

Scans aggregates and returns a list of compatible target aggregates for the given volume move operation.

---

### Related Links
* [Start-NcVolMove](Start-NcVolMove)

---

### Examples
> Example 1

Get-NcVol vol1 | Get-NcVolMoveTargetAggr
Get all the aggregates that could serve as the destination for volume 'vol1'.

Name                      StorageType  Available
----                      -----------  ---------
Cerebus_03_SATA1          ATA             3.8 TB
Cerebus_03_SATA2          ATA           331.5 GB
Cerebus_03_aggr0          FCAL            5.2 GB
Cerebus_04_aggr0          FCAL            5.6 GB
Cerebus_04_aggr1          FCAL            1.0 TB
Cerebus_05_aggr0          FCAL            5.2 GB
Cerebus_05_aggr1          FCAL            1.2 TB
Cerebus_06_aggr0          FCAL            5.2 GB
Cerebus_06_aggr1          FCAL          717.0 GB

---

### Parameters
#### **Name**
The name of the volume to be moved.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Volume |

#### **Vserver**
The name of the vserver that contains the volume to be moved.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Query**
For advanced queries, provide a VolumeMoveTargetAggrInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcVolMoveTargetAggr -Template" to get the initially empty VolumeMoveTargetAggrInfo object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VolumeMoveTargetAggrInfo]`|false   |named   |false        |

#### **Attributes**
For improved scalability in large clusters, provide a VolumeMoveTargetAggrInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcVolMoveTargetAggr -Template" to get the initially empty VolumeMoveTargetAggrInfo object.  If not specified, all data is returned for each object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[VolumeMoveTargetAggrInfo]`|false   |named   |false        |

#### **DestinationTieringPolicy**
Volume Tiering Policy.
This parameter is available in ONTAP 9.2 and later.

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**
Specify to get an empty VolumeMoveTargetAggrInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Fill**
Specify when using the Template parameter to recursively fill in all object types.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.VolumeMoveTargetAggrInfo

---

### Notes
Category: volume
API: volume-move-target-aggr-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcVolMoveTargetAggr [-Name] <String> [[-Vserver] <String>] [-VserverContext <String>] [-Query <VolumeMoveTargetAggrInfo>] [-Attributes <VolumeMoveTargetAggrInfo>] 
```
```PowerShell
[-DestinationTieringPolicy <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVolMoveTargetAggr [-VserverContext <String>] -Template [-Fill] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
