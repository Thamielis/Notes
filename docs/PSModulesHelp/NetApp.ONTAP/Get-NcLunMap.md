Get-NcLunMap
------------

### Synopsis
List LUN map details.

---

### Description

List LUN map details.

---

### Related Links
* [Get-NcLun](Get-NcLun)

* [Add-NcLunMap](Add-NcLunMap)

* [Remove-NcLunMap](Remove-NcLunMap)

---

### Examples
> Example 1

```PowerShell
Get-NcLunMap /vol/VMSet6/*
List the map info for all LUNs with the specified name pattern.

NcController       : cerebus
InitiatorGroup     : HyperV121
InitiatorGroupUuid : 0bc7726b-ad70-11e0-9983-123478563412
LunId              : 7
LunUuid            : bf1d823e-b6f9-11e0-9983-123478563412
Path               : /vol/VMSet6/Powershell1dot6
Vserver            : Lionetti01

NcController       : cerebus
InitiatorGroup     : HyperV122
InitiatorGroupUuid : 243b3c8b-ad71-11e0-9983-123478563412
LunId              : 7
LunUuid            : bf16fb39-b6f9-11e0-9983-123478563412
Path               : /vol/VMSet6/SCOMSCVMM2012
Vserver            : Lionetti01

NcController       : cerebus
InitiatorGroup     : HyperV122
InitiatorGroupUuid : 243b3c8b-ad71-11e0-9983-123478563412
LunId              : 8
LunUuid            : b09e3c6f-b705-11e0-9983-123478563412
Path               : /vol/VMSet6/SCOMSCVMM2012Data
Vserver            : Lionetti01

```

---

### Parameters
#### **Path**
The name of one or more LUNs to query for map info.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases     |
|------------|--------|--------|---------------------|------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Lun<br/>Name|

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Attributes**
For improved scalability in large clusters, provide a LunMapInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcLunMap -Template" to get the initially empty LunMapInfo object.  If not specified, all data is returned for each object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[LunMapInfo]`|false   |named   |false        |

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
Specify to get an empty LunMapInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a LunMapInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcLunMap -Template" to get the initially empty LunMapInfo object.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[LunMapInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunMapInfo

---

### Notes
Category: lun
API: lun-map-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcLunMap [[-Path] <String[]>] [-Vserver <String[]>] [-VserverContext <String>] [-Attributes <LunMapInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLunMap [-VserverContext <String>] -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLunMap [-VserverContext <String>] -Query <LunMapInfo> [-Attributes <LunMapInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
