Get-NcNameServiceNisBindingDetail
---------------------------------

### Synopsis
Iterate over a list of bound NIS servers.

---

### Description

Iterate over a list of bound NIS servers.

---

### Related Links
* [Get-NcNameServiceNisStatistics](Get-NcNameServiceNisStatistics)

* [Reset-NcNameServiceNisStatistics](Reset-NcNameServiceNisStatistics)

---

### Examples
> Example 1

```PowerShell
Get-NcNameServiceNisBindingDetail
Get binding details for all vservers in the cluster

BoundServer  : 10.60.132.113
BoundStatus  : Invalid domain
NcController : 10.63.1.234
NisDomain    : sim.rtp.netapp.com
Vserver      : primary1

BoundServer  : 10.60.252.15
BoundStatus  : Invalid domain
NcController : 10.63.1.234
NisDomain    : sim.rtp.netapp.com
Vserver      : primary1

BoundServer  : 10.60.132.113
BoundStatus  : Invalid domain
NcController : 10.63.1.234
NisDomain    : sim.rtp.netapp.com
Vserver      : secondary1

BoundServer  : 10.60.252.15
BoundStatus  : Invalid domain
NcController : 10.63.1.234
NisDomain    : sim.rtp.netapp.com
Vserver      : secondary1

```

---

### Parameters
#### **Vserver**
Specify to filter by Vserver

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **NisDomain**
Specify to filter by NisDomain

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **BoundServer**
Specify to filter by BoundServer

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[NisBindingDetail]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[NisBindingDetail]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Nameservice.NisBindingDetail

---

### Notes
Category: nameservice
API: name-service-nis-binding-detail-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcNameServiceNisBindingDetail [[-Vserver] <String[]>] [[-NisDomain] <String[]>] [[-BoundServer] <String[]>] [-Attributes <NisBindingDetail>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNameServiceNisBindingDetail -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNameServiceNisBindingDetail -Query <NisBindingDetail> [-Attributes <NisBindingDetail>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
