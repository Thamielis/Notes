Get-NcAggr
----------

### Synopsis
Gets the aggregates for the current controller.

---

### Description

Gets the aggregates for the current controller.

---

### Related Links
* [New-NcAggr](New-NcAggr)

---

### Examples
> Example 1

Get-NcAggr
Get all aggregates.

Name                      State       TotalSize  Used  Available Disks RaidType        RaidSize  Volumes
----                      -----       ---------  ----  --------- ----- --------        --------  -------
aggr0                     online       119.5 GB   95%     5.6 GB   3   raid_dp,normal     16           1
aggr0_fas3070cluster01... online       119.5 GB   95%     5.6 GB   3   raid_dp,normal     16           1
aggr1                     online       717.1 GB    3%   696.9 GB   8   raid_dp,normal     16           4

> Example 2

Get-NcAggr aggr1 | select State, TotalSize, Used | ft -AutoSize
Get aggregate 'aggr1' and display a subset of its attributes.

State     TotalSize Used
-----     --------- ----
online 769958141952    3

> Example 3

Get-NcAggr -Attributes space,volumecount | select Name, TotalSize, Used, Volumes | ft -AutoSize
Restrict the amount of data transmitted by using the Attributes field.

Name                           TotalSize Used Volumes
----                           --------- ---- -------
aggr0                       128326377472   95       1
aggr0_fas3070cluster01_02_0 128326377472   95       1
aggr1                       769958141952    3       4

> Example 4

$a = Get-NcAggr -Template
Initialize-NcObjectProperty $a AggrSpaceAttributes
$a.AggrSpaceAttributes.PercentUsedCapacity = ">85"
Get-NcAggr -Query $a | select Name, Used | ft -AutoSize
Using an advanced query, discover which aggregates are more than 85% full.

Name                        Used
----                        ----
aggr0                         95
aggr0_fas3070cluster01_02_0   95

---

### Parameters
#### **Name**
The name of one or more aggregates to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases           |
|------------|--------|--------|---------------------|------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Aggr<br/>Aggregate|

#### **Attributes**
For improved scalability in large clusters, provide an AggrAttributes object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcAggr -Template" to get the initially empty AggrAttributes object.  If not specified, all data is returned for each object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[AggrAttributes]`|false   |named   |false        |

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
Specify to get an empty AggrAttributes object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Fill**
Specify when using the Template parameter to recursively fill in all object types.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Query**
For advanced queries, provide an AggrAttributes object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcAggr -Template" to get the initially empty AggrAttributes object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[AggrAttributes]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Aggr.AggrAttributes

---

### Notes
Category: aggr
API: aggr-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcAggr [[-Name] <String[]>] [-Attributes <AggrAttributes>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAggr -Template [-Fill] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcAggr -Query <AggrAttributes> [-Attributes <AggrAttributes>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
