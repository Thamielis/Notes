Set-NcMetroclusterConfigReplication
-----------------------------------

### Synopsis
Modify information regarding the cluster-wide storage associated with cross-cluster replication of MetroCluster configuration data.

---

### Description

Modify information regarding the cluster-wide storage associated with cross-cluster replication of MetroCluster configuration data.

in ONTAP 8.3, MetroCluster cannot be enabled simultaneously with Async Vserver DR. This cmdlet will return an error if Async Vserver DR is currently enabled on the cluster.

---

### Related Links
* [Get-NcMetroclusterConfigReplication](Get-NcMetroclusterConfigReplication)

---

### Examples
> Example 1

```PowerShell
Set-NcMetroclusterConfigReplication -DisallowedAggregate aggr1_mcc1
Modify the cluster-wide storage associated with cross-cluster replication of MetroCluster configuration data.

AbandonedVolumes              : 
CurrentVolume                 : MDV_CRS_1371fa22ca1211e396c0123478563412_A
DisallowedAggregates          : {aggr1_mcc1}
NcController                  : 10.63.10.33
UseMirroredAggregate          : True
UseMirroredAggregateSpecified : True

```
> Example 2

```PowerShell
Set-NcMetroclusterConfigReplication -DisallowedAggregate @("")
Remove all disallowed aggregates from the cluster-wide storage associated with cross-cluster replication of MetroCluster configuration data.

AbandonedVolumes              : 
CurrentVolume                 : MDV_CRS_1371fa22ca1211e396c0123478563412_A
DisallowedAggregates          : 
NcController                  : 10.63.10.33
UseMirroredAggregate          : True
UseMirroredAggregateSpecified : True

```

---

### Parameters
#### **DisallowedAggregate**
List of aggregates that are disallowed for use by the metrocluster configuration replication.

|Type        |Required|Position|PipelineInput        |Aliases             |
|------------|--------|--------|---------------------|--------------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|DisallowedAggregates|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Metrocluster.MetroclusterCrStorageInfo

---

### Notes
Category: metrocluster
API: metrocluster-config-replication-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcMetroclusterConfigReplication [-DisallowedAggregate] <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
