New-NcNetPortIfgrp
------------------

### Synopsis
Create a new network interface group (ifgrp).

---

### Description

Create a new network interface group (ifgrp).

---

### Related Links
* [Get-NcNetPortIfgrp](Get-NcNetPortIfgrp)

* [Remove-NcNetPortIfgrp](Remove-NcNetPortIfgrp)

* [Add-NcNetPortIfgrpPort](Add-NcNetPortIfgrpPort)

---

### Examples
> Example 1

```PowerShell
New-NcNetPortIfgrp i0b -Node fas3070cluster01-02 -DistributionFunction mac -Mode singlemode
Create a new ifgrp.

NcController         : 10.61.172.155
DistributionFunction : mac
DownPorts            :
IfgrpName            : i0b
MacAddress           : 02:a0:98:0a:d4:7e
Mode                 : singlemode
Node                 : fas3070cluster01-02
PortParticipation    : none
Ports                :
UpPorts              :

```

---

### Parameters
#### **Name**
The name of the ifgrp to create.  Must use the format <letter><number><letter>.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|true    |1       |true (ByPropertyName)|IfgrpName<br/>Ifgrp|

#### **Node**
The node that will own the new ifgrp.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **DistributionFunction**
The traffic distribution function of the new ifgrp.  Values include mac, ip, sequential, port.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **Mode**
The link policy of the new ifgrp.  Values include multimode, multimode_lacp, singlemode.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |4       |true (ByPropertyName)|

#### **MemberPorts**
Set of ports the LAG consists of. This parameter is supported with Rest only.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **BroadcastDomain**
Broadcast domain name and Ipspace name provided on input. To instantiate the object please create object using New-Object DataONTAP.C.Types.Net.BroadcastDomain. This parameter is supported with Rest only.

|Type                                     |Required|Position|PipelineInput        |
|-----------------------------------------|--------|--------|---------------------|
|`[DataONTAP.C.Types.Net.BroadcastDomain]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Net.NetIfgrpInfo

---

### Notes
Category: net
API: net-port-ifgrp-create
Family: cluster

---

### Syntax
```PowerShell
New-NcNetPortIfgrp [-Name] <String> [-Node] <String> [-DistributionFunction] <String> [-Mode] <String> [-MemberPorts <String[]>] [-BroadcastDomain <DataONTAP.C.Types.Net.BroadcastDomain>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
