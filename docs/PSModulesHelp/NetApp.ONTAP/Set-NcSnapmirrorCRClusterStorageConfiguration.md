Set-NcSnapmirrorCRClusterStorageConfiguration
---------------------------------------------

### Synopsis
Modifies  information regarding the configuration of the cluster-wide storage associated with cross-cluster replication of Async Vserver DR configuration data.

---

### Description

Modifies  information regarding the configuration of the cluster-wide storage associated with cross-cluster replication of Async Vserver DR configuration data. 

If input is not provided for a particular value, then the item is not modified in the storage configuration. in ONTAP 8.3.1, Async Vserver DR cannot be enabled simultaneously with metrocluster. For this reason this command will return an error if metrocluster is currently enabled on the cluster.

---

### Related Links
* [Get-NcSnapmirrorCRClusterStorageConfiguration](Get-NcSnapmirrorCRClusterStorageConfiguration)

* [Get-NcSnapmirrorCRStatus](Get-NcSnapmirrorCRStatus)

* [Get-NcSnapmirrorCRStatusAggregateEligibility](Get-NcSnapmirrorCRStatusAggregateEligibility)

* [Get-NcSnapmirrorCRStatusComm](Get-NcSnapmirrorCRStatusComm)

---

### Examples
> Example 1

```PowerShell
Set-NcSnapmirrorCRClusterStorageConfiguration -DisallowedAggregates aggr0
Add a disallowed aggregate

AbandonedVolumes              : 
CurrentVolume                 : 
DisallowedAggregates          : {aggr0}
NcController                  : 10.238.49.117
UseMirroredAggregate          : False
UseMirroredAggregateSpecified : True

```

---

### Parameters
#### **DisallowedAggregates**
Specifies the list of aggregates that are disallowed for use by the Async Vserver DR configuration replication.

|Type        |Required|Position|PipelineInput        |Aliases       |
|------------|--------|--------|---------------------|--------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|DisallowedAggr|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snapmirror.SnapmirrorInfo

---

### Notes
Category: snapmirror
API: snapmirror-config-replication-cluster-storage-configuration-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcSnapmirrorCRClusterStorageConfiguration [-DisallowedAggregates] <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
