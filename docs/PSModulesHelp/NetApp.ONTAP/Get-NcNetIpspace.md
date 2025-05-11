Get-NcNetIpspace
----------------

### Synopsis
Get a list of IPspace objects.

---

### Description

Get a list of IPspace objects.

---

### Related Links
* [New-NcNetIpspace](New-NcNetIpspace)

* [Remove-NcNetIpspace](Remove-NcNetIpspace)

* [Rename-NcNetIpspace](Rename-NcNetIpspace)

---

### Examples
> Example 1

Get-NcNetIpspace
Get all of the ipspaces for the current cluster.

BroadcastDomains : {Cluster}
Id               : 4294967294
Ipspace          : Cluster
NcController     : 10.63.10.37
Ports            :
Uuid             : 7a94443d-aec8-11e3-a303-123478563412
Vservers         : {Cluster}
IdSpecified      : True

BroadcastDomains : {Default}
Id               : 4294967295
Ipspace          : Default
NcController     : 10.63.10.37
Ports            : {beam-fs-ps-01:e0a, beam-fs-ps-01:e0b, beam-fs-ps-01:e0c, beam-fs-ps-01:e0d}
Uuid             : 7a94367d-aec8-11e3-a303-123478563412
Vservers         : {beam-fs-ps, pester}
IdSpecified      : True

> Example 2

Get-NcNetIpspace -Query @{Ports="beam-fs-ps-01:e0a"}
Get all the Ipspaces that include the given port.

BroadcastDomains : {Default}
Id               : 4294967295
Ipspace          : Default
NcController     : 10.63.10.37
Ports            : {beam-fs-ps-01:e0a, beam-fs-ps-01:e0b, beam-fs-ps-01:e0c, beam-fs-ps-01:e0d}
Uuid             : 7a94367d-aec8-11e3-a303-123478563412
Vservers         : {beam-fs-ps, pester}
IdSpecified      : True

---

### Parameters
#### **Name**
One or more Ipspace names.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Ipspace|

#### **Attributes**
For improved scalability in large clusters, provide a NetIpspacesInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetIpspace -Template" to get the initially empty NetIpspacesInfo object.  If not specified, all data is returned for each object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[NetIpspacesInfo]`|false   |named   |false        |

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
Specify to get an empty NetIpspacesInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NetIpspacesInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetIpspace -Template" to get the initially empty NetIpspacesInfo object.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[NetIpspacesInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetIpspacesInfo

---

### Notes
Category: net
API: net-ipspaces-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetIpspace [[-Name] <String[]>] [-Attributes <NetIpspacesInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetIpspace -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcNetIpspace -Query <NetIpspacesInfo> [-Attributes <NetIpspacesInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
