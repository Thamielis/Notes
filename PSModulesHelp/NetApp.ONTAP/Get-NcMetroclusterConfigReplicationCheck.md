Get-NcMetroclusterConfigReplicationCheck
----------------------------------------

### Synopsis
Get the results of the MetroCluster config replication checks.

---

### Description

Get the results of the MetroCluster config replication checks.

---

### Related Links
* [Get-NcMetroclusterAggregateCheck](Get-NcMetroclusterAggregateCheck)

* [Get-NcMetroclusterAggregateEligibilityCheck](Get-NcMetroclusterAggregateEligibilityCheck)

* [Get-NcMetroclusterNodeCheck](Get-NcMetroclusterNodeCheck)

* [Get-NcMetroclusterCheck](Get-NcMetroclusterCheck)

* [Invoke-NcMetroclusterCheck](Invoke-NcMetroclusterCheck)

---

### Examples
> Example 1

```PowerShell
Get-NcMetroclusterConfigReplicationCheck
Get the details of the MetroCluster config replication check.

ClusterRecoverySteps    : 
ClusterStreams          : ok
HeartbeatRecoverySteps  : 
IsEnabled               : True
IsRunning               : True
LastHeartbeatReceived   : 1398197875
LastHeartbeatSent       : 1398197880
NcController            : 10.63.10.33
RecoverySteps           : 
RemoteHeartbeat         : ok
StorageInUse            : Cluster-wide Volume: MDV_CRS_1371fa22ca1211e396c0123478563412_A
StorageNonHealthyReason : 
StorageRecoverySteps    : 
StorageStatus           : ok
VserverRecoverySteps    : 
VserverStreams          : ok
IsEnabledSpecified      : True
IsRunningSpecified      : True
LastHeartbeatReceivedDT : 4/22/2014 4:17:55 PM
LastHeartbeatSentDT     : 4/22/2014 4:18:00 PM

```

---

### Parameters
#### **Attributes**
For improved scalability in large clusters, provide a MetroclusterCheckConfigReplicationInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcMetroclusterConfigReplicationCheck -Template" to get the initially empty MetroclusterCheckConfigReplicationInfo object.  If not specified, all data is returned for each object.

|Type                                      |Required|Position|PipelineInput|
|------------------------------------------|--------|--------|-------------|
|`[MetroclusterCheckConfigReplicationInfo]`|false   |named   |false        |

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
* DataONTAP.C.Types.Metrocluster.MetroclusterCheckConfigReplicationInfo

---

### Notes
Category: metrocluster
API: metrocluster-check-config-replication-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcMetroclusterConfigReplicationCheck [-Attributes <MetroclusterCheckConfigReplicationInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
