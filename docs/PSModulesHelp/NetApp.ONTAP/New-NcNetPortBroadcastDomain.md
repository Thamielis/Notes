New-NcNetPortBroadcastDomain
----------------------------

### Synopsis
Create a new layer 2 broadcast domain object.

---

### Description

Create a new layer 2 broadcast domain object.

---

### Related Links
* [Get-NcNetPortBroadcastDomain](Get-NcNetPortBroadcastDomain)

* [Set-NcNetPortBroadcastDomain](Set-NcNetPortBroadcastDomain)

* [Rename-NcNetPortBroadcastDomain](Rename-NcNetPortBroadcastDomain)

* [Remove-NcNetPortBroadcastDomain](Remove-NcNetPortBroadcastDomain)

---

### Examples
> Example 1

New-NcNetPortBroadcastDomain -Name test -Port beam-fs-ps-01:e0b -Ipspace test -Mtu 1500
Create a new port broadcast domain containing the given port.

BroadcastDomain            Ipspace              FailoverGroups            Mtu PortUpdateStatusCombined
---------------            -------              --------------            --- ------------------------
test                       test                 {test}                   1500 complete

---

### Parameters
#### **Name**
Name to give the layer 2 broadcast domain.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |1       |true (ByPropertyName)|BroadcastDomain|

#### **Ipspace**
IPspace name that the layer 2 broadcast domain belongs to.  The default value for this parameter is 'Default'.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Mtu**
Maximum Transmission Unit (MTU) of the layer 2 broadcast domain. The MTU will be applied to all ports that belong to the layer 2 broadcast domain.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |3       |true (ByPropertyName)|

#### **Port**
Ports added to the layer 2 broadcast domain.  Ports added to a new layer 2 broadcast domain will be removed from their current layer 2 broadcast domain.
Format: node-name:port-name

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Ports  |

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
API: net-port-broadcast-domain-create
Family: cluster

---

### Syntax
```PowerShell
New-NcNetPortBroadcastDomain [-Name] <String> [[-Ipspace] <String>] [-Mtu] <Int32> [-Port <String[]>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
