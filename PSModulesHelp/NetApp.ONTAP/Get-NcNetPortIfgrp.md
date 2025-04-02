Get-NcNetPortIfgrp
------------------

### Synopsis
Get interface group (ifgrp) objects.

---

### Description

Get interface group (ifgrp) objects.

---

### Related Links
* [New-NcNetPortIfgrp](New-NcNetPortIfgrp)

---

### Examples
> Example 1

```PowerShell
Get-NcNetPortIfgrp -Node fas3070cluster01-02
List the ifgroups from a single node.

NcController         : 10.61.172.155
DistributionFunction : port
DownPorts            :
IfgrpName            : i0a
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
The name of one or more ifgrps to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases            |
|------------|--------|--------|---------------------|-------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|IfgrpName<br/>Ifgrp|

#### **Node**
Restrict results to the specified nodes(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |named   |true (ByPropertyName)|NodeName|

#### **Attributes**
For improved scalability in large clusters, provide a NetIfgrpInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetPortIfgrp -Template" to get the initially empty NetIfgrpInfo object.  If not specified, all data is returned for each object.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[NetIfgrpInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty NetIfgrpInfo object for use with advanced queries involving the Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetIfgrpInfo

---

### Notes
Category: net
API: net-port-get-iter, net-port-ifgrp-get
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcNetPortIfgrp [[-Name] <String[]>] [-Node <String[]>] [-Attributes <NetIfgrpInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetPortIfgrp -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
