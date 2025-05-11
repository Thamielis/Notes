Get-NcNetDataLifCapacity
------------------------

### Synopsis
Get the IP data LIF capacity of the entire cluster.

---

### Description

Get the IP data LIF capacity of the entire cluster.

---

### Related Links
* [Get-NcNetDataLifCapacityDetails](Get-NcNetDataLifCapacityDetails)

---

### Examples
> Example 1

Get-NcNetDataLifCapacity
Get the overall data lif capacity of the cluster

Controller                                                                         Count                          Limit
----------                                                                         -----                          -----
10.63.1.234                                                                            4                            512

---

### Parameters
#### **DesiredAttributes**
Specify to restrict which data fields are returned by Data ONTAP.

|Type                   |Required|Position|PipelineInput|Aliases   |
|-----------------------|--------|--------|-------------|----------|
|`[DataLifCapacityInfo]`|false   |named   |false        |Attributes|

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
* DataONTAP.C.Types.Net.DataLifCapacityInfo

---

### Notes
Category: net
API: data-lif-capacity
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetDataLifCapacity [-DesiredAttributes <DataLifCapacityInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
