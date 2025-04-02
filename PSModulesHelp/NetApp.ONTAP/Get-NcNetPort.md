Get-NcNetPort
-------------

### Synopsis
Get network ports.

---

### Description

Get network ports.

---

### Related Links
* [Set-NcNetPort](Set-NcNetPort)

---

### Examples
> Example 1

```PowerShell
Get-NcNetPort e1d -Node Cerebus-05
Get the details for port 'e1d' on node 'Cerebus-05'.

Node                                   : Cerebus-05
Port                                   : e1d
NcController                           : cerebus
Name                                   : e1d
AdministrativeDuplex                   : full
AdministrativeFlowcontrol              : full
AdministrativeSpeed                    : auto
AutorevertDelay                        :
IfgrpDistributionFunction              :
IfgrpMode                              :
IfgrpNode                              :
IfgrpPort                              :
IsAdministrativeAutoNegotiate          : True
IsAdministrativeUp                     : True
IsOperationalAutoNegotiate             : True
LinkStatus                             : up
MacAddress                             : 00:15:17:ef:bc:2f
Mtu                                    : 1500
OperationalDuplex                      : full
OperationalFlowcontrol                 : full
OperationalSpeed                       : 1000
PortType                               : physical
Role                                   : data
VlanId                                 :
VlanNode                               :
VlanPort                               :
AutorevertDelaySpecified               : False
IsAdministrativeAutoNegotiateSpecified : True
IsAdministrativeUpSpecified            : True
IsOperationalAutoNegotiateSpecified    : True
MtuSpecified                           : True
VlanIdSpecified                        : False

```
> Example 2

$attr = Get-NcNetPort -Template
$attr.LinkStatus = ""
Get-NcNetPort -Attributes $attr | select Node,Port,LinkStatus
Get and show (only) the link status for each port.

Node       Port LinkStatus
----       ---- ----------
Cerebus-03 e0a  up
Cerebus-03 e0b  up
Cerebus-03 e0c  up
Cerebus-03 e0d  up
Cerebus-03 e1a  up
Cerebus-03 e1b  up
Cerebus-03 e1c  up
Cerebus-03 e1d  up
Cerebus-04 e0a  up
Cerebus-04 e0b  up
Cerebus-04 e0c  up
Cerebus-04 e0d  up
Cerebus-04 e1a  up
Cerebus-04 e1b  up
Cerebus-04 e1c  up
Cerebus-04 e1d  up
Cerebus-05 e0a  up
Cerebus-05 e0b  up
Cerebus-05 e0c  up
Cerebus-05 e0d  up
Cerebus-05 e1a  up
Cerebus-05 e1b  up
Cerebus-05 e1c  up
Cerebus-05 e1d  up

---

### Parameters
#### **Name**
The name of one or more ports to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases                                  |
|------------|--------|--------|---------------------|-----------------------------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|PortName<br/>Port<br/>IfgrpName<br/>Ifgrp|

#### **Node**
Restrict results to the specified nodes(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |named   |true (ByPropertyName)|NodeName|

#### **LinkStatus**
Restrict results to the specified link status.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Role**
Restrict results to the specified port role(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a NetPortInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetPort -Template" to get the initially empty NetPortInfo object.  If not specified, all data is returned for each object.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[NetPortInfo]`|false   |named   |false        |

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
Specify to get an empty NetPortInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NetPortInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetPort -Template" to get the initially empty NetPortInfo object.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[NetPortInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetPortInfo

---

### Notes
Category: net
API: net-port-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcNetPort [[-Name] <String[]>] [-Node <String[]>] [-LinkStatus <String[]>] [-Role <String[]>] [-Attributes <NetPortInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetPort -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcNetPort -Query <NetPortInfo> [-Attributes <NetPortInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
