Get-NcNetPortBroadcastDomain
----------------------------

### Synopsis
Get a list of layer 2 broadcast domain objects.

---

### Description

Get a list of layer 2 broadcast domain objects.

---

### Related Links
* [Set-NcNetPortBroadcastDomain](Set-NcNetPortBroadcastDomain)

* [New-NcNetPortBroadcastDomain](New-NcNetPortBroadcastDomain)

* [Rename-NcNetPortBroadcastDomain](Rename-NcNetPortBroadcastDomain)

* [Remove-NcNetPortBroadcastDomain](Remove-NcNetPortBroadcastDomain)

---

### Examples
> Example 1

Get-NcNetPortBroadcastDomain
Get the net port broadcast domains for the current cluster.

BroadcastDomain          : Cluster
FailoverGroups           : 
Ipspace                  : Cluster
Mtu                      : 9000
NcController             : 10.63.10.37
Ports                    : 
PortUpdateStatusCombined : complete
SubnetNames              : 
MtuSpecified             : True

BroadcastDomain          : Default
FailoverGroups           : {Default}
Ipspace                  : Default
Mtu                      : 1500
NcController             : 10.63.10.37
Ports                    : {beam-fs-ps-01:e0a, beam-fs-ps-01:e0b, beam-fs-ps-01:e0c, beam-fs-ps-01:e0d}
PortUpdateStatusCombined : complete
SubnetNames              : {test}
MtuSpecified             : True

> Example 2

Get-NcNetPortBroadcastDomain -Query @{SubnetNames="test"}
Get all of the net port broadcast domains associated with the given subnet.

BroadcastDomain            Ipspace              FailoverGroups            Mtu PortUpdateStatusCombined
---------------            -------              --------------            --- ------------------------
Default                    Default              {Default}                1500 complete

---

### Parameters
#### **Name**
Name of one or more broadcast domains.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases        |
|------------|--------|--------|---------------------|---------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|BroadcastDomain|

#### **Ipspace**
Name of one or more ipspaces the broadcast domain belongs to.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a NetPortBroadcastDomainInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetPortBroadcastDomain -Template" to get the initially empty NetPortBroadcastDomainInfo object.  If not specified, all data is returned for each object.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[NetPortBroadcastDomainInfo]`|false   |named   |false        |

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
Specify to get an empty NetPortBroadcastDomainInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NetPortBroadcastDomainInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetPortBroadcastDomain -Template" to get the initially empty NetPortBroadcastDomainInfo object.

|Type                          |Required|Position|PipelineInput|
|------------------------------|--------|--------|-------------|
|`[NetPortBroadcastDomainInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetPortBroadcastDomainInfo

---

### Notes
Category: net
API: net-port-broadcast-domain-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetPortBroadcastDomain [[-Name] <String[]>] [[-Ipspace] <String[]>] [-Attributes <NetPortBroadcastDomainInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetPortBroadcastDomain -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetPortBroadcastDomain -Query <NetPortBroadcastDomainInfo> [-Attributes <NetPortBroadcastDomainInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
