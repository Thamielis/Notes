Rename-NcNetSubnet
------------------

### Synopsis
Rename a layer 3 subnet.

---

### Description

Rename a layer 3 subnet.

---

### Related Links
* [Get-NcNetSubnet](Get-NcNetSubnet)

* [Set-NcNetSubnet](Set-NcNetSubnet)

---

### Examples
> Example 1

```PowerShell
Rename-NcNetSubnet -Name pester_subnet -NewName 10.63.0.0/18
Rename the subnet to be more descriptive.

AvailableCount                      : 1
BroadcastDomain                     : Default
ForceUpdateLifAssociations          :
Gateway                             : 10.63.0.1
IpRanges                            : {10.63.11.83-10.63.11.85}
Ipspace                             : Default
NcController                        : 10.63.10.37
Subnet                              : 10.63.0.0/18
SubnetName                          : 10.63.0.0/18
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
Name of the subnet to rename.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|SubnetName|

#### **NewName**
New name to give the layer 3 subnet.  A specific subnet name, for example 'Mgmt' or 'Data', or a specific subnet IP value, 198.18.10.0/24 is allowed.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Ipspace**
IPspace Name that the subnet belongs to.  The default value for this parameter is the default IPspace, named 'Default'.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Net.NetSubnetInfo

---

### Notes
Category: net
API: net-subnet-rename
Family: cluster

---

### Syntax
```PowerShell
Rename-NcNetSubnet [-Name] <String> [-NewName] <String> [-Ipspace <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
