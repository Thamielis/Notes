Get-NcSnapmirrorCRStatusAggregateEligibility
--------------------------------------------

### Synopsis
Returns information regarding the eligibility of aggregates to host configuration replication volumes used for the replication of snapmirror configuration data.

---

### Description

Returns information regarding the eligibility of aggregates to host configuration replication volumes used for the replication of snapmirror configuration data.

---

### Related Links
* [Get-NcSnapmirrorCRClusterStorageConfiguration](Get-NcSnapmirrorCRClusterStorageConfiguration)

* [Set-NcSnapmirrorCRClusterStorageConfiguration](Set-NcSnapmirrorCRClusterStorageConfiguration)

* [Get-NcSnapmirrorCRStatus](Get-NcSnapmirrorCRStatus)

* [Get-NcSnapmirrorCrStatusComm](Get-NcSnapmirrorCrStatusComm)

---

### Examples
> Example 1

```PowerShell
Get-NcSnapmirrorCRStatusAggregateEligibility aggr0,san_aggr
Get eligibility information for 2 aggregates

Aggregate                                  : aggr0
Comment                                    : Root Aggregate
HostedConfigurationReplicationVolumes      : 
IsEligibleToHostAdditionalVolumes          : False
NcController                               : 10.238.49.117
IsEligibleToHostAdditionalVolumesSpecified : True

Aggregate                                  : san_aggr
Comment                                    : 
HostedConfigurationReplicationVolumes      : 
IsEligibleToHostAdditionalVolumes          : True
NcController                               : 10.238.49.117
IsEligibleToHostAdditionalVolumesSpecified : True

```

---

### Parameters
#### **Aggregate**
The aggregate being evaluated for config-replication volume hosting eligibility.

|Type        |Required|Position|PipelineInput        |Aliases            |
|------------|--------|--------|---------------------|-------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Aggr<br/>Aggregates|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                                          |Required|Position|PipelineInput|
|----------------------------------------------|--------|--------|-------------|
|`[SnapmirrorCrStatusAggregateEligibilityInfo]`|false   |named   |false        |

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

#### **Query**
Specify to query using a object with restricting fields set.

|Type                                          |Required|Position|PipelineInput|
|----------------------------------------------|--------|--------|-------------|
|`[SnapmirrorCrStatusAggregateEligibilityInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Snapmirror.SnapmirrorCrStatusAggregateEligibilityInfo

---

### Notes
Category: snapmirror
API: snapmirror-cr-status-aggregate-eligibility-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcSnapmirrorCRStatusAggregateEligibility [[-Aggregate] <String[]>] [-Attributes <SnapmirrorCrStatusAggregateEligibilityInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnapmirrorCRStatusAggregateEligibility -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnapmirrorCRStatusAggregateEligibility -Query <SnapmirrorCrStatusAggregateEligibilityInfo> [-Attributes <SnapmirrorCrStatusAggregateEligibilityInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
