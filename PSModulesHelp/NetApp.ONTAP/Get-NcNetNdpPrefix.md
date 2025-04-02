Get-NcNetNdpPrefix
------------------

### Synopsis
Get a list of network ndp prefix objects.

---

### Description

Get a list of network ndp prefix objects.

---

### Related Links
* [Remove-NcNetNdpPrefix](Remove-NcNetNdpPrefix)

---

### Examples
> Example 1

Get-NcNetNdpPrefix
Get all of the NDP prefixes for the current cluster.

Prefix                             Ipspace              PreferredLifetimeTS    Flag                 Origin
------                             -------              -------------------    ----                 ------
fd20:8b1e:b255:814e::/64           Default              7.00:00:00             on_link_autonomous   router_advertise
fd20:8b1e:b255:814e::/64           Default              7.00:00:00             on_link_autonomous   router_advertise

> Example 2

Get-NcNetNdpPrefix -Query @{Origin="router_advertise"}
Get all of the NDP prefixes with the given Origin value.

Prefix                             Ipspace              PreferredLifetimeTS    Flag                 Origin
------                             -------              -------------------    ----                 ------
fd20:8b1e:b255:814e::/64           Default              7.00:00:00             on_link_autonomous   router_advertise
fd20:8b1e:b255:814e::/64           Default              7.00:00:00             on_link_autonomous   router_advertise

---

### Parameters
#### **Prefix**
One or more prefixes.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Node**
Restrict results to one or more nodes.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Ipspace**
One or more ipspaces.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Port**
One or more ports.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a NetNdpPrefixInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetNdpPrefix -Template" to get the initially empty NetNdpPrefixInfo object.  If not specified, all data is returned for each object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[NetNdpPrefixInfo]`|false   |named   |false        |

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
Specify to get an empty NetNdpPrefixInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NetNdpPrefixInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetNdpPrefix -Template" to get the initially empty NetNdpPrefixInfo object.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[NetNdpPrefixInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetNdpPrefixInfo

---

### Notes
Category: net
API: net-ndp-prefix-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetNdpPrefix [[-Prefix] <String[]>] [[-Node] <String[]>] [[-Ipspace] <String[]>] [-Port <String[]>] [-Attributes <NetNdpPrefixInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetNdpPrefix -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcNetNdpPrefix -Query <NetNdpPrefixInfo> [-Attributes <NetNdpPrefixInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
