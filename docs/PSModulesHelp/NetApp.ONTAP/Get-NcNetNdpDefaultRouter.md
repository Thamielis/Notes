Get-NcNetNdpDefaultRouter
-------------------------

### Synopsis
Get a list of network ndp default-router objects.

---

### Description

Get a list of network ndp default-router objects.

---

### Related Links
* [Remove-NcNetNdpDefaultRouter](Remove-NcNetNdpDefaultRouter)

---

### Examples
> Example 1

Get-NcNetNdpDefaultRouter
Get all of the NDP default routers for the given cluster.

RouterAddr                         Node                 Port     Ipspace              ExpireTime
----------                         ----                 ----     -------              ----------
fe80::5:73ff:fea0:107              beam-fs-ps-01        e0d      Default              0d0h29m7s
fe80::5:73ff:fea0:107              beam-fs-ps-01        e0c      Default              0d0h29m7s

> Example 2

Get-NcNetNdpDefaultRouter -Query @{Ipspace="Default"}
Query all of the NDP default routers for the given Ipspace.

RouterAddr                         Node                 Port     Ipspace              ExpireTime
----------                         ----                 ----     -------              ----------
fe80::5:73ff:fea0:107              beam-fs-ps-01        e0d      Default              0d0h28m43s
fe80::5:73ff:fea0:107              beam-fs-ps-01        e0c      Default              0d0h28m43s

---

### Parameters
#### **RouterAddress**
One or more router IPv6 addresses.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Node**
One or more nodes.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Ipspace**
Name of one or more ipspaces.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Port**
Name of one or more ports.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a NetNdpDefaultRouterInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetNdpDefaultRouter -Template" to get the initially empty NetNdpDefaultRouterInfo object.  If not specified, all data is returned for each object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[NetNdpDefaultRouterInfo]`|false   |named   |false        |

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
Specify to get an empty NetNdpDefaultRouterInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NetNdpDefaultRouterInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetNdpDefaultRouter -Template" to get the initially empty NetNdpDefaultRouterInfo object.

|Type                       |Required|Position|PipelineInput|
|---------------------------|--------|--------|-------------|
|`[NetNdpDefaultRouterInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetNdpDefaultRouterInfo

---

### Notes
Category: net
API: net-ndp-default-router-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetNdpDefaultRouter [[-RouterAddress] <String[]>] [[-Node] <String[]>] [[-Ipspace] <String[]>] [[-Port] <String[]>] [-Attributes <NetNdpDefaultRouterInfo>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetNdpDefaultRouter -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetNdpDefaultRouter -Query <NetNdpDefaultRouterInfo> [-Attributes <NetNdpDefaultRouterInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
