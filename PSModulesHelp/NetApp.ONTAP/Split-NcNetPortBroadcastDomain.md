Split-NcNetPortBroadcastDomain
------------------------------

### Synopsis
Split a layer 2 broadcast domain into two layer 2 broadcast domains.

---

### Description

Split a layer 2 broadcast domain into two layer 2 broadcast domains.

---

### Related Links
* [Get-NcNetPortBroadcastDomain](Get-NcNetPortBroadcastDomain)

* [Merge-NcNetPortBroadcastDomain](Merge-NcNetPortBroadcastDomain)

---

### Examples
> Example 1

Split-NcNetPortBroadcastDomain -Name test -Ipspace test -NewName pester_test -Port beam-fs-ps-01:e0b
Split the net port broadcast domain into two, with the new broadcast domain containing the given port.

BroadcastDomain            Ipspace              FailoverGroups            Mtu PortUpdateStatusCombined
---------------            -------              --------------            --- ------------------------
pester_test                test                 {pester_test}            1500 complete

---

### Parameters
#### **Name**
Name of the layer 2 broadcast domain.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |1       |true (ByPropertyName)|BroadcastDomain|

#### **Ipspace**
IPspace name that the layer 2 broadcast domain belongs to.  The default value for this parameter is 'Default'.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **NewName**
New layer 2 broadcast domain name.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|true    |2       |true (ByPropertyName)|NewBroadcastName|

#### **Port**
The ports to be split from current broadcast domain and added to the new broadcast domain.
Format:node-name:port-name

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|true    |named   |true (ByPropertyName)|Ports  |

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
* DataONTAP.C.Types.Net.NetPortBroadcastDomainInfo

---

### Notes
Category: net
API: net-port-broadcast-domain-split
Family: cluster

---

### Syntax
```PowerShell
Split-NcNetPortBroadcastDomain [-Name] <String> [-Ipspace <String>] [-NewName] <String> -Port <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
