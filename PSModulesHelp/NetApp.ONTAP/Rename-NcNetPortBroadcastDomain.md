Rename-NcNetPortBroadcastDomain
-------------------------------

### Synopsis
Rename a layer 2 broadcast domain.

---

### Description

Rename a layer 2 broadcast domain.

---

### Related Links
* [Get-NcNetPortBroadcastDomain](Get-NcNetPortBroadcastDomain)

* [Set-NcNetPortBroadcastDomain](Set-NcNetPortBroadcastDomain)

* [Merge-NcNetPortBroadcastDomain](Merge-NcNetPortBroadcastDomain)

* [Split-NcNetPortBroadcastDomain](Split-NcNetPortBroadcastDomain)

* [Remove-NcNetPortBroadcastDomain](Remove-NcNetPortBroadcastDomain)

---

### Examples
> Example 1

Rename-NcNetPortBroadcastDomain -Name test -Ipspace test -NewName pester_test_1
Rename the net port broadcast domain.

BroadcastDomain            Ipspace              FailoverGroups            Mtu PortUpdateStatusCombined
---------------            -------              --------------            --- ------------------------
pester_test_1              test                 {pester_test_1}          1500 complete

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
New name of the layer 2 broadcast domain name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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
API: net-port-broadcast-domain-rename
Family: cluster

---

### Syntax
```PowerShell
Rename-NcNetPortBroadcastDomain [-Name] <String> [-Ipspace <String>] [-NewName] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
