Get-NcHaInterconnectConfigDetails
---------------------------------

### Synopsis
Iterate over list of nodes in the cluster to get their high-availability interconnect device configuration information

---

### Description

Iterate over list of nodes in the cluster to get their high-availability interconnect device configuration information

---

### Examples
> Example 1

```PowerShell
Get-NcHaInterconnectConfigDetails
Gives the configuration details of the HA pair nodes sapanj-vsim3 and sapanj-vsim4

ConnectionRequestInitiator : partner
InterconnectPortDetails    : {e0h}
InterfaceType              : external
LocalNodeSysid             : 4077998148
NcController               : 10.238.73.251
NodeName                   : sapanj-vsim3
PartnerNodeSysid           : 4077998149
TransportType              : MVIA-RDMA
LocalNodeSysidSpecified    : True
PartnerNodeSysidSpecified  : True

ConnectionRequestInitiator : local
InterconnectPortDetails    : {e0h}
InterfaceType              : external
LocalNodeSysid             : 4077998149
NcController               : 10.238.73.251
NodeName                   : sapanj-vsim4
PartnerNodeSysid           : 4077998148
TransportType              : MVIA-RDMA
LocalNodeSysidSpecified    : True
PartnerNodeSysidSpecified  : True

```

---

### Parameters
#### **NodeName**
Specify to filter by NodeName

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[HaInterconnectConfigDetails]`|false   |named   |false        |

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

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[HaInterconnectConfigDetails]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.HaInterconnect.HaInterconnectConfigDetails

---

### Notes
Category: ha interconnect
API: ha-interconnect-config-details-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcHaInterconnectConfigDetails [[-NodeName] <String[]>] [-Attributes <HaInterconnectConfigDetails>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcHaInterconnectConfigDetails -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcHaInterconnectConfigDetails -Query <HaInterconnectConfigDetails> [-Attributes <HaInterconnectConfigDetails>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
