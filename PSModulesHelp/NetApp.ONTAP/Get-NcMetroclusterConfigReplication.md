Get-NcMetroclusterConfigReplication
-----------------------------------

### Synopsis
Get information regarding the cluster-wide storage associated with cross-cluster replication of MetroCluster configuration data.

---

### Description

Get information regarding the cluster-wide storage associated with cross-cluster replication of MetroCluster configuration data.

In ONTAP 8.3, MetroCluster cannot be enabled simultaneously with Async Vserver DR. For this reason this command will return an error if Async Vserver DR is currently enabled on the cluster.

---

### Related Links
* [Set-NcMetroclusterConfigReplication](Set-NcMetroclusterConfigReplication)

---

### Examples
> Example 1

```PowerShell
Get-NcMetroclusterConfigReplication
Get the cluster-wide storage associated with replication of configuration data.

AbandonedVolumes              : 
CurrentVolume                 : MDV_CRS_1371fa22ca1211e396c0123478563412_A
DisallowedAggregates          : 
NcController                  : 10.63.10.33
UseMirroredAggregate          : True
UseMirroredAggregateSpecified : True

```

---

### Parameters
#### **Attributes**
For improved scalability in large clusters, provide a MetroclusterCrStorageInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcMetroclusterConfigReplication -Template" to get the initially empty MetroclusterCrStorageInfo object.  If not specified, all data is returned for each object.

|Type                         |Required|Position|PipelineInput|
|-----------------------------|--------|--------|-------------|
|`[MetroclusterCrStorageInfo]`|false   |named   |false        |

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
API: metrocluster-config-replication-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcMetroclusterConfigReplication [-Attributes <MetroclusterCrStorageInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
