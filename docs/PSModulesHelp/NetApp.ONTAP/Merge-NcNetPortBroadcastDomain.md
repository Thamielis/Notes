Merge-NcNetPortBroadcastDomain
------------------------------

### Synopsis
Merge two layer 2 broadcast domains.

---

### Description

Merge two layer 2 broadcast domains.

---

### Related Links
* [Split-NcNetPortBroadcastDomain](Split-NcNetPortBroadcastDomain)

* [Get-NcNetPortBroadcastDomain](Get-NcNetPortBroadcastDomain)

---

### Examples
> Example 1

Merge-NcNetPortBroadcastDomain -Name pester_test_1 -Ipspace test -IntoName test
Merge the two net port broadcast domain into a single broadcast domain.

BroadcastDomain            Ipspace              FailoverGroups            Mtu PortUpdateStatusCombined
---------------            -------              --------------            --- ------------------------
test                       test                 {test}                   1500 complete

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

#### **IntoName**
Merge with this layer 2 broadcast domain.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|true    |2       |true (ByPropertyName)|IntoBroadcastDomain|

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
API: net-port-broadcast-domain-merge
Family: cluster

---

### Syntax
```PowerShell
Merge-NcNetPortBroadcastDomain [-Name] <String> [-Ipspace <String>] [-IntoName] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
