Add-NcLunMapReportingNodes
--------------------------

### Synopsis
Add nodes to the list reporting the LUN map.

---

### Description

Add nodes to the list reporting the LUN map. If no specific action is provided, adds all the nodes in the current failover  group for the LUN.

---

### Related Links
* [Remove-NcLunMapReportingNodes](Remove-NcLunMapReportingNodes)

* [Get-NcLunMap](Get-NcLunMap)

---

### Examples
> Example 1

Add-NcLunMapReportingNodes /vol/san_vol/lun0 ig0 -Nodes aparajir-vsim2
Adds the node aparajir-vsim2 (and it's HA partner, if configured) as a reporting node for lun0 housed in san_vol

Path                                           Size   SizeUsed Protocol     Online Mapped  Thin  Vserver               
----                                           ----   -------- --------     ------ ------  ----  -------               
/vol/san_vol/lun0                           39.2 MB          0 windows       True   True  False  pstk_san              

C:\PS> (Get-NcLunMap /vol/san_vol/lun0).ReportingNodes
aparajir-vsim2

> Example 2

Add-NcLunMapReportingNodes /vol/san_vol/lun0 ig0 -DestinationAggregate cifs_aggr
Adds the node containing the aggregate cifs_aggr as reporting nodes for this lun.

Path                                           Size   SizeUsed Protocol     Online Mapped  Thin  Vserver               
----                                           ----   -------- --------     ------ ------  ----  -------               
/vol/san_vol/lun0                           39.2 MB          0 windows       True   True  False  pstk_san              

C:\PS> (Get-NcLunMap /vol/san_vol/lun0).ReportingNodes
aparajir-vsim1
aparajir-vsim2

> Example 3

Add-NcLunMapReportingNodes /vol/san_vol/lun0 ig0
Adds the owner node of lun0 as reporting node

Path                                           Size   SizeUsed Protocol     Online Mapped  Thin  Vserver               
----                                           ----   -------- --------     ------ ------  ----  -------               
/vol/san_vol/lun0                           39.2 MB          0 windows       True   True  False  pstk_san

---

### Parameters
#### **Path**
The path of the LUN.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **InitiatorGroup**
The initiator group the LUN is mapped to.

|Type      |Required|Position|PipelineInput        |Aliases                      |
|----------|--------|--------|---------------------|-----------------------------|
|`[String]`|true    |2       |true (ByPropertyName)|InitiatorGroupName<br/>igroup|

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

#### **Nodes**
The name of one or more nodes. When specified, add the specific nodes and HA partners to the map.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **DestinationAggregate**
The name of an aggregate. When specified, adds the nodes appropriate for the aggregate

|Type      |Required|Position|PipelineInput|Aliases                     |
|----------|--------|--------|-------------|----------------------------|
|`[String]`|false   |named   |false        |DestAggr<br/>DestinationAggr|

#### **DestinationVolume**
The name of a volume. When specified, addds teh nodes appropriate for the volume

|Type      |Required|Position|PipelineInput|Aliases                   |
|----------|--------|--------|-------------|--------------------------|
|`[String]`|false   |named   |false        |DestVol<br/>DestinationVol|

#### **All**
When specified and true, report the LUN from all eligible nodes.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunInfo

---

### Notes
The optional parameters are mutually exclusive. One execution of the cmdlet can use at most one of the optional parameters.

Category: lun
API: lun-map-add-reporting-nodes
Family: vserver

---

### Syntax
```PowerShell
Add-NcLunMapReportingNodes [-Path] <String> [-InitiatorGroup] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcLunMapReportingNodes [-Path] <String> [-InitiatorGroup] <String> [-Nodes <String[]>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcLunMapReportingNodes [-Path] <String> [-InitiatorGroup] <String> [-DestinationAggregate <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcLunMapReportingNodes [-Path] <String> [-InitiatorGroup] <String> [-DestinationVolume <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Add-NcLunMapReportingNodes [-Path] <String> [-InitiatorGroup] <String> [-All <Boolean>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
