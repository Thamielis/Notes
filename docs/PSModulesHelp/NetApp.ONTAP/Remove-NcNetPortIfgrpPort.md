Remove-NcNetPortIfgrpPort
-------------------------

### Synopsis
Remove port from a network interface group (ifgrp).

---

### Description

Remove port from a network interface group (ifgrp).  Use Set-NcNetPort to set the admininistrative status of the ifgrp to 'down' before removing ports from it.

---

### Related Links
* [Get-NcNetPort](Get-NcNetPort)

* [Get-NcNetPortIfgrp](Get-NcNetPortIfgrp)

* [Add-NcNetPortIfgrpPort](Add-NcNetPortIfgrpPort)

---

### Examples
> Example 1

```PowerShell
Get-NcNetPortIfgrp i0b -Node fas3070cluster01-02 | Set-NcNetPort -Down | Remove-NcNetPortIfgrpPort -Port e0b,e0c
Remove ports 'e0b' and 'e0c' from ifgrp 'i0b'.

NcController         : 10.61.172.155
DistributionFunction : mac
DownPorts            :
IfgrpName            : i0b
MacAddress           : 02:a0:98:0a:d4:7f
Mode                 : singlemode
Node                 : fas3070cluster01-02
PortParticipation    : none
Ports                :
UpPorts              :

```

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
The port(s) to remove from the ifgrp.

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
API: net-port-ifgrp-remove-port
Family: cluster

---

### Syntax
```PowerShell
Remove-NcNetPortIfgrpPort [-Name] <String> [-Node] <String> [-Port] <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
