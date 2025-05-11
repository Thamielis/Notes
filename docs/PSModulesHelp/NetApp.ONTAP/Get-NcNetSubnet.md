Get-NcNetSubnet
---------------

### Synopsis
Iterate over a list of subnet objects.

---

### Description

Iterate over a list of subnet objects.

---

### Related Links
* [New-NcNetSubnet](New-NcNetSubnet)

* [Set-NcNetSubnet](Set-NcNetSubnet)

* [Rename-NcNetSubnet](Rename-NcNetSubnet)

* [Remove-NcNetSubnet](Remove-NcNetSubnet)

---

### Examples
> Example 1

```PowerShell
Get-NcNetSubnet
Get all of the subnets for the current cluster.

AvailableCount                      : 1
BroadcastDomain                     : Default
ForceUpdateLifAssociations          :
Gateway                             : 10.63.0.1
IpRanges                            : {10.63.11.83-10.63.11.85}
Ipspace                             : Default
NcController                        : 10.63.10.37
Subnet                              : 10.63.0.0/18
SubnetName                          : pester_subnet
TotalCount                          : 3
UsedCount                           : 2
AvailableCountSpecified             : True
ForceUpdateLifAssociationsSpecified : False
TotalCountSpecified                 : True
UsedCountSpecified                  : True

```
> Example 2

```PowerShell
Get-NcNetSubnet -Query @{AvailableCount="<3"}
Get all of the subnets on the current cluster with less than 3 available IPs.

AvailableCount                      : 1
BroadcastDomain                     : Default
ForceUpdateLifAssociations          :
Gateway                             : 10.63.0.1
IpRanges                            : {10.63.11.83-10.63.11.85}
Ipspace                             : Default
NcController                        : 10.63.10.37
Subnet                              : 10.63.0.0/18
SubnetName                          : pester_subnet
TotalCount                          : 3
UsedCount                           : 2
AvailableCountSpecified             : True
ForceUpdateLifAssociationsSpecified : False
TotalCountSpecified                 : True
UsedCountSpecified                  : True

```

---

### Parameters
#### **Name**
Name of one or more subnets to get.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|SubnetName|

#### **Ipspace**
Name of one or more ipspaces that subnets belong to.  Data ONTAP wildcards are accepted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a NetSubnetInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcNetSubnet -Template" to get the initially empty NetSubnetInfo object.  If not specified, all data is returned for each object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[NetSubnetInfo]`|false   |named   |false        |

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
Specify to get an empty NetSubnetInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a NetSubnetInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcNetSubnet -Template" to get the initially empty NetSubnetInfo object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[NetSubnetInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetSubnetInfo

---

### Notes
Category: net
API: net-subnet-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetSubnet [[-Name] <String[]>] [[-Ipspace] <String[]>] [-Attributes <NetSubnetInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetSubnet -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcNetSubnet -Query <NetSubnetInfo> [-Attributes <NetSubnetInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
