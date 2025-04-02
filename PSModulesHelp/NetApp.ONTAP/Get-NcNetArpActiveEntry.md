Get-NcNetArpActiveEntry
-----------------------

### Synopsis
Get a list of network ARP active entries.

---

### Description

Get a list of network ARP active entries.

---

### Related Links
* [Get-NcNetArpEntry](Get-NcNetArpEntry)

* [Remove-NcNetArpActiveEntry](Remove-NcNetArpActiveEntry)

---

### Examples
> Example 1

Get-NcNetArpActiveEntry -Vserver pester
Get all of the ARP active entries for the given vserver.

MacAddress                 RemoteHost           Node                       Port     Vserver
----------                 ----------           ----                       ----     -------
0:26:98:c:b6:c1            10.63.0.3            beam-fs-ps-01              e0c      pester
40:55:39:25:27:c1          10.63.0.2            beam-fs-ps-01              e0c      pester
0:0:c:9f:f1:7              10.63.0.1            beam-fs-ps-01              e0c      pester

> Example 2

Get-NcNetArpActiveEntry -Query @{Node="beam-fs-ps-01";Port="e0c"}
Query all of the ARP active entries for the given node and port.

MacAddress                 RemoteHost           Node                       Port     Vserver
----------                 ----------           ----                       ----     -------
0:0:c:9f:f1:7              10.63.0.1            beam-fs-ps-01              e0c      pester
40:55:39:25:27:c1          10.63.0.2            beam-fs-ps-01              e0c      pester
0:26:98:c:b6:c1            10.63.0.3            beam-fs-ps-01              e0c      pester
0:0:c:9f:f1:7              10.63.0.1            beam-fs-ps-01              e0c      beam-fs-ps
40:55:39:25:27:c1          10.63.0.2            beam-fs-ps-01              e0c      beam-fs-ps
0:26:98:c:b6:c1            10.63.0.3            beam-fs-ps-01              e0c      beam-fs-ps

---

### Parameters
#### **Node**
One or more nodes from which to get the ARP entry.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **Vserver**
One or more vservers from which to get the ARP entry.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **SubnetGroup**
One or more subnet groups from which to get the ARP entry.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **RemoteHost**
One or more remote hosts.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Port**
One or more port names.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a NetArpOperationalInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetArpActiveEntry -Template" to get the initially empty NetArpOperationalInfo object.  If not specified, all data is returned for each object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[NetArpOperationalInfo]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**
Specify to get an empty NetArpOperationalInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NetArpOperationalInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetArpActiveEntry -Template" to get the initially empty NetArpOperationalInfo object.

|Type                     |Required|Position|PipelineInput|
|-------------------------|--------|--------|-------------|
|`[NetArpOperationalInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetArpOperationalInfo

---

### Notes
Category: net
API: net-arp-active-entry-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetArpActiveEntry [[-Node] <String[]>] [[-Vserver] <String[]>] [-SubnetGroup <String[]>] [-RemoteHost <String[]>] [-Port <String[]>] [-Attributes <NetArpOperationalInfo>] 
```
```PowerShell
[-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcNetArpActiveEntry -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetArpActiveEntry -Query <NetArpOperationalInfo> [-Attributes <NetArpOperationalInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
