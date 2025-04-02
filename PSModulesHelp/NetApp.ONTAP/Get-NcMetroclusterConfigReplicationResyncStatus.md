Get-NcMetroclusterConfigReplicationResyncStatus
-----------------------------------------------

### Synopsis
Get MetroCluster configuration replication synchronization information

---

### Description

Get MetroCluster configuration replication synchronization information

---

### Related Links
* [Get-NcMetroclusterConfigReplication](Get-NcMetroclusterConfigReplication)

* [Get-NcMetroclusterConfigReplicationCheck](Get-NcMetroclusterConfigReplicationCheck)

* [Set-NcMetroclusterConfigReplication](Set-NcMetroclusterConfigReplication)

---

### Parameters
#### **Attributes**
For improved scalability in large clusters, provide a MetroclusterCheckConfigReplicationInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcMetroclusterConfigReplicationResync -Template" to get the initially empty MetroclusterCheckConfigReplicationInfo object.  If not specified, all data is returned for each object.

|Type                                             |Required|Position|PipelineInput|
|-------------------------------------------------|--------|--------|-------------|
|`[MetroclusterConfigReplicationResyncStatusInfo]`|false   |named   |false        |

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
Specify to get an empty MetroclusterCheckConfigReplicationInfo object for use in specifying desired attributes.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Metrocluster.MetroclusterCheckConfigReplicationInfo

---

### Notes
Category: metrocluster
API: metrocluster-config-replication-resync-status-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcMetroclusterConfigReplicationResyncStatus [-Attributes <MetroclusterConfigReplicationResyncStatusInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcMetroclusterConfigReplicationResyncStatus [-Controller <NcController[]>] [-Template] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
