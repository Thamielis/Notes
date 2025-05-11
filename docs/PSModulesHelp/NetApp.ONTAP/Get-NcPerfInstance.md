Get-NcPerfInstance
------------------

### Synopsis
Get a list of perf object instances.

---

### Description

Get a list of perf object instances.

---

### Related Links
* [Get-NcPerfData](Get-NcPerfData)

* [Get-NcPerfCounter](Get-NcPerfCounter)

* [Get-NcPerfObject](Get-NcPerfObject)

---

### Examples
> Example 1

Get-NcPerfInstance -Name aggregate
Get instances for the aggregate perf object.

Name                                    Uuid
----                                    ----
aggr1                                   VxeRubble-01:kernel:aggr1
aggr2                                   VxeRubble-01:kernel:aggr2
aggr0                                   VxeRubble-01:kernel:aggr0
aggr0_VxeRubble_02_0                    VxeRubble-02:kernel:aggr0_VxeRubble_...

> Example 2

Get-NcPerfInstance aggregate -FilterData node_name=VxeRubble-01
Get the instances of the aggregate performance object for the VxeRubble-01 node.

Name                                    Uuid
----                                    ----
aggr2                                   VxeRubble-01:kernel:aggr2
aggr1                                   VxeRubble-01:kernel:aggr1
aggr0                                   VxeRubble-01:kernel:aggr0

---

### Parameters
#### **Name**
Object name to get instance info for.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Object |

#### **FilterData**
A string, representing filter-data, in the format of key=value supporting multiple key-value pairs via comma separation.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Instance**
The instance(s) to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Uuid**
The instance uuid(s) to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an InstanceInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcPerfInstance -Template" to get the initially empty InstanceInfo object.  If not specified, all data is returned for each object.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[InstanceInfo]`|false   |named   |false        |

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
Specify to get an empty InstanceInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an InstanceInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcPerfInstance -Template" to get the initially empty InstanceInfo object.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[InstanceInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Perf.InstanceInfo

---

### Notes
Category: perf
API: perf-object-instance-list-info-iter
Family: cluster,vserver

---

### Syntax
```PowerShell
Get-NcPerfInstance [-Name] <String> [-FilterData <String>] [-Instance <String[]>] [-Uuid <String[]>] [-Attributes <InstanceInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcPerfInstance [-Name] <String> [-FilterData <String>] [-Instance <String[]>] [-Uuid <String[]>] -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcPerfInstance [-Name] <String> [-FilterData <String>] [-Instance <String[]>] [-Uuid <String[]>] -Query <InstanceInfo> [-Attributes <InstanceInfo>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
