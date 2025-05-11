Get-NcMetroclusterAggregateEligibilityCheck
-------------------------------------------

### Synopsis
Get information regarding the eligibility of aggregates to host configuration replication volumes.

---

### Description

Get information regarding the eligibility of aggregates to host configuration replication volumes used for the replication of MetroCluster configuration data.

---

### Related Links
* [Get-NcMetroclusterCheck](Get-NcMetroclusterCheck)

* [Get-NcMetroclusterAggregateCheck](Get-NcMetroclusterAggregateCheck)

* [Get-NcMetroclusterConfigReplicationCheck](Get-NcMetroclusterConfigReplicationCheck)

* [Get-NcMetroclusterNodeCheck](Get-NcMetroclusterNodeCheck)

* [Invoke-NcMetroclusterCheck](Invoke-NcMetroclusterCheck)

---

### Examples
> Example 1

Get-NcMetroclusterAggregateEligibilityCheck
Get the results of the aggregates ability to host configuration replication volumes.

Aggregate                  IsEligible   ConfigReplicationVolumes
---------                  ----------   ------------------------
aggr0_mcc1                 False
aggr0_mcc2
aggr1_mcc1                 True         {MDV_CRS_1371fa22ca1211e396c0123478563412_B}
aggr1_mcc2
aggr2_mcc1                 True         {MDV_CRS_1371fa22ca1211e396c0123478563412_A}
aggr2_mcc2

> Example 2

Get-NcMetroclusterAggregateEligibilityCheck -Query @{IsEligible=$true}
Get the aggregates that are able to host addition configuration replication volumes.

Aggregate                  IsEligible   ConfigReplicationVolumes
---------                  ----------   ------------------------
aggr1_mcc1                 True         {MDV_CRS_1371fa22ca1211e396c0123478563412_B}
aggr2_mcc1                 True         {MDV_CRS_1371fa22ca1211e396c0123478563412_A}

---

### Parameters
#### **Aggregate**
One or more names of the aggregates that were checked.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a MetroclusterCheckAggregateEligibilityInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcMetroclusterAggregateEligibilityCheck -Template" to get the initially empty MetroclusterCheckAggregateEligibilityInfo object.  If not specified, all data is returned for each object.

|Type                                         |Required|Position|PipelineInput|
|---------------------------------------------|--------|--------|-------------|
|`[MetroclusterCheckAggregateEligibilityInfo]`|false   |named   |false        |

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
Specify to get an empty MetroclusterCheckAggregateEligibilityInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a MetroclusterCheckAggregateEligibilityInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcMetroclusterAggregateEligibilityCheck -Template" to get the initially empty MetroclusterCheckAggregateEligibilityInfo object.

|Type                                         |Required|Position|PipelineInput|
|---------------------------------------------|--------|--------|-------------|
|`[MetroclusterCheckAggregateEligibilityInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Metrocluster.MetroclusterCheckAggregateEligibilityInfo

---

### Notes
Category: metrocluster
API: metrocluster-check-aggregate-eligibility-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcMetroclusterAggregateEligibilityCheck [[-Aggregate] <String[]>] [-Attributes <MetroclusterCheckAggregateEligibilityInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterAggregateEligibilityCheck -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterAggregateEligibilityCheck -Query <MetroclusterCheckAggregateEligibilityInfo> [-Attributes <MetroclusterCheckAggregateEligibilityInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
