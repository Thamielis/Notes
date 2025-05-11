Add-NcNetPortIfgrpPort
----------------------

### Synopsis
Add port to a network interface group (ifgrp).

---

### Description

Add port to a network interface group (ifgrp).

---

### Related Links
* [Get-NcNetPort](Get-NcNetPort)

* [Get-NcNetPortIfgrp](Get-NcNetPortIfgrp)

* [Remove-NcNetPortIfgrpPort](Remove-NcNetPortIfgrpPort)

---

### Examples
> Example 1

Add-NcNetPortIfgrpPort i0b fas3070cluster01-02 e0b,e0c
Add ports 'e0b' and 'e0c' to ifgrp 'i0b'.

NcController         : 10.61.172.155
DistributionFunction : mac
DownPorts            : {e0c}
IfgrpName            : i0b
MacAddress           : 02:a0:98:0a:d4:7f
Mode                 : singlemode
Node                 : fas3070cluster01-02
PortParticipation    : partial
Ports                : {e0b, e0c}
UpPorts              : {e0b}

---

### Parameters
#### **Name**
The name of the ifgrp to modify.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|true    |1       |true (ByPropertyName)|IfgrpName<br/>Ifgrp|

#### **Node**
The node that owns the ifgrp.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Port**
The port(s) to add to the ifgrp.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |3       |true (ByPropertyName)|

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
API: net-port-ifgrp-add-port
Family: cluster

---

### Syntax
```PowerShell
Add-NcNetPortIfgrpPort [-Name] <String> [-Node] <String> [-Port] <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
