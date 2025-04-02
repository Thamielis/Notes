Get-NcSnapmirrorCRClusterStorageConfiguration
---------------------------------------------

### Synopsis
Returns information regarding the configuration of the cluster-wide storage associated with cross-cluster replication of Async Vserver DR configuration data.

---

### Description

Returns information regarding the configuration of the cluster-wide storage associated with cross-cluster replication of Async Vserver DR configuration data. 

In ONTAP 8.3.1, Async Vserver DR cannot be enabled simultaneously with metrocluster. For this reason this command will return an error if metrocluster is currently enabled on the cluster.

---

### Related Links
* [Set-NcSnapmirrorCRClusterStorageConfiguration](Set-NcSnapmirrorCRClusterStorageConfiguration)

* [Get-NcSnapmirrorCRStatus](Get-NcSnapmirrorCRStatus)

* [Get-NcSnapmirrorCrStatusComm](Get-NcSnapmirrorCrStatusComm)

* [Get-NcSnapmirrorCrStatusAggregateEligibility](Get-NcSnapmirrorCrStatusAggregateEligibility)

---

### Examples
> Example 1

```PowerShell
Get-NcSnapmirrorCRClusterStorageConfiguration
Returns all information about cluster storage configuration associated with cross-cluster replication of Async Vserver DR configuration data.

AbandonedVolumes              : 
CurrentVolume                 : 
DisallowedAggregates          : {aggr0}
NcController                  : 10.238.49.117
UseMirroredAggregate          : False
UseMirroredAggregateSpecified : True

```

---

### Parameters
#### **DesiredAttributes**
Specify to restrict fields returned by Data ONTAP

|Type                       |Required|Position|PipelineInput        |Aliases   |
|---------------------------|--------|--------|---------------------|----------|
|`[SnapmirrorCrStorageInfo]`|false   |1       |true (ByPropertyName)|Attributes|

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
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snapmirror.SnapmirrorCrStorageInfo

---

### Notes
Category: snapmirror
API: snapmirror-config-replication-cluster-storage-configuration-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcSnapmirrorCRClusterStorageConfiguration [[-DesiredAttributes] <SnapmirrorCrStorageInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnapmirrorCRClusterStorageConfiguration -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
