Get-NcNetDataLifCapacityDetails
-------------------------------

### Synopsis
Get the IP data LIF capacity details for each node of the cluster.

---

### Description

Get the IP data LIF capacity details for each node of the cluster.

---

### Related Links
* [Get-NcNetDataLifCapacity](Get-NcNetDataLifCapacity)

---

### Examples
> Example 1

```PowerShell
Get-NcNetDataLifCapacityDetails
Get per-node information about data lif capacity

CapacityForNode          : 256
CountForNode             : 2
LimitForNode             : 256
NcController             : 10.63.1.234
CapacityForNodeSpecified : True
CountForNodeSpecified    : True
LimitForNodeSpecified    : True

CapacityForNode          : 256
CountForNode             : 2
LimitForNode             : 256
NcController             : 10.63.1.234
CapacityForNodeSpecified : True
CountForNodeSpecified    : True
LimitForNodeSpecified    : True

```

---

### Parameters
#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[DataLifCapacityDetailsInfo]`|false   |named   |false        |

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

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[DataLifCapacityDetailsInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.DataLifCapacityDetailsInfo

---

### Notes
Category: net
API: data-lif-capacity-details
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetDataLifCapacityDetails [-Attributes <DataLifCapacityDetailsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetDataLifCapacityDetails -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetDataLifCapacityDetails -Query <DataLifCapacityDetailsInfo> [-Attributes <DataLifCapacityDetailsInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
