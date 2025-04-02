Get-NcMetroclusterCheck
-----------------------

### Synopsis
Get a list of MetroCluster check info objects.

---

### Description

Get a list of MetroCluster check info objects.

---

### Related Links
* [Get-NcMetroclusterAggregateCheck](Get-NcMetroclusterAggregateCheck)

* [Get-NcMetroclusterAggregateEligibilityCheck](Get-NcMetroclusterAggregateEligibilityCheck)

* [Get-NcMetroclusterConfigReplicationCheck](Get-NcMetroclusterConfigReplicationCheck)

* [Get-NcMetroclusterNodeCheck](Get-NcMetroclusterNodeCheck)

* [Invoke-NcMetroclusterCheck](Invoke-NcMetroclusterCheck)

---

### Examples
> Example 1

Get-NcMetroclusterCheck
Get the status of the MetroCluster checks.

Component            Result             TimestampDT
---------            ------             -----------
aggregates           ok                 4/22/2014 3:17:29 PM
config_replication   ok                 4/22/2014 3:17:29 PM
lifs                 ok                 4/22/2014 3:17:29 PM
nodes                warning            4/22/2014 3:17:29 PM

> Example 2

Get-NcMetroclusterCheck -Query @{Result="warning"}
Get the MetroCluster checks that resulted in a "warning".

Component            Result             TimestampDT
---------            ------             -----------
nodes                warning            4/22/2014 3:17:29 PM

---

### Parameters
#### **Component**
One or more names of the components that were checked.  Data ONTAP wildcards are accepted.
Possible values:
'nodes'               - Checks For Nodes In MetroCluster,
'lifs'                - Checks For LIFs in MetroCluster,
'config_replication'  - Checks For Config Replication In MetroCluster,
'aggregates'          - Checks For Aggregates In MetroCluster

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a MetroclusterCheckInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcMetroclusterCheck -Template" to get the initially empty MetroclusterCheckInfo object.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[MetroclusterCheckInfo]`|false   |named   |false        |

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
Specify to get an empty MetroclusterCheckInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a MetroclusterCheckInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcMetroclusterCheck -Template" to get the initially empty MetroclusterCheckInfo object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[MetroclusterCheckInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Metrocluster.MetroclusterCheckInfo

---

### Notes
Category: metrocluster
API: metrocluster-check-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcMetroclusterCheck [[-Component] <String[]>] [-Attributes <MetroclusterCheckInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterCheck -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterCheck -Query <MetroclusterCheckInfo> [-Attributes <MetroclusterCheckInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
