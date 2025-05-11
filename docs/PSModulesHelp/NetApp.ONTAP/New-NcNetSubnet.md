New-NcNetSubnet
---------------

### Synopsis
Create a new subnet object.

---

### Description

Create a new subnet object.  A subnet object represents a layer 3 subnet in a network.

---

### Related Links
* [Get-NcNetSubnet](Get-NcNetSubnet)

* [Set-NcNetSubnet](Set-NcNetSubnet)

* [Rename-NcNetSubnet](Rename-NcNetSubnet)

* [Remove-NcNetSubnet](Remove-NcNetSubnet)

---

### Examples
> Example 1

```PowerShell
New-NcNetSubnet -Name pester_subnet -BroadcastDomain Default -Subnet 10.63.0.0/18 -Ipspace Default -Gateway 10.63.0.1 -IpRange 10.63.11.83-10.63.11.85 -ForceUpdateLifAssociations
Create the specified subnet.

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
Name to give the layer 3 subnet.  A specific subnet name, for example 'Mgmt' or 'Data', or a specific subnet IP value, 198.18.10.0/24 is allowed.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|SubnetName|

#### **BroadcastDomain**
Layer 2 broadcast domain name that the subnet belongs to.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Subnet**
Layer 3 Subnet.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **Ipspace**
IPspace Name that the subnet belongs to.  The default value for this parameter is the default IPspace, named 'Default'.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Gateway**
The gateway for the default route of the subnet.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IpRange**
The list of IP address ranges associated with the subnet.
For example: 10.64.10.100-10.64.10.192

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |named   |true (ByPropertyName)|IpRanges|

#### **ForceUpdateLifAssociations**
If specified, associate any manually addressed interfaces with the subnet and will allow the command to succeed.  Otherwise the command will fail if any service processor interfaces or network interfaces are using the IP addresses in the ranges provided.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
API: net-subnet-create
Family: cluster

---

### Syntax
```PowerShell
New-NcNetSubnet [-Name] <String> [-BroadcastDomain] <String> [-Subnet] <String> [-Ipspace <String>] [-Gateway <String>] [-IpRange <String[]>] [-ForceUpdateLifAssociations] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
