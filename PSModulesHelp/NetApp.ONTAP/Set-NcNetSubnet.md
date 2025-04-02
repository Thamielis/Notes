Set-NcNetSubnet
---------------

### Synopsis
Modify an existing subnet object.

---

### Description

Modify an existing subnet object.

---

### Related Links
* [Get-NcNetSubnet](Get-NcNetSubnet)

* [Rename-NcNetSubnet](Rename-NcNetSubnet)

* [New-NcNetSubnet](New-NcNetSubnet)

* [Remove-NcNetSubnet](Remove-NcNetSubnet)

---

### Examples
> Example 1

```PowerShell
Set-NcNetSubnet -Name 10.63.0.0/18 -IpRange 10.63.11.83-10.63.11.85 -ForceUpdateLifAssociations
Update the IP range for the given subnet.

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
> Example 2

```PowerShell
Set-NcNetSubnet -Name 10.63.0.0/18 -AddIpRange 10.63.10.33-10.63.10.37 -ForceUpdateLifAssociations
Add an IP range to the subnet.

AvailableCount                      : 5
BroadcastDomain                     : Default
ForceUpdateLifAssociations          :
Gateway                             : 10.63.0.1
IpRanges                            : {10.63.10.33-10.63.10.37, 10.63.11.83-10.63.11.85}
Ipspace                             : Default
NcController                        : 10.63.10.37
Subnet                              : 10.63.0.0/18
SubnetName                          : 10.63.0.0/18
TotalCount                          : 8
UsedCount                           : 3
AvailableCountSpecified             : True
ForceUpdateLifAssociationsSpecified : False
TotalCountSpecified                 : True

```
> Example 3

```PowerShell
Set-NcNetSubnet -Name 10.63.0.0/18 -RemoveIpRange 10.63.10.33-10.63.10.37 -ForceUpdateLifAssociations
Remove the IP range from the subnet.

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
Name of the subnet to modify.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|SubnetName|

#### **Ipspace**
IPspace Name that the subnet belongs to.  The default value for this parameter is the default IPspace, named 'Default'. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **ForceUpdateLifAssociations**
If specified, associate any manually addressed interfaces with the subnet and will allow the command to succeed.  Otherwise the command will fail if any service processor interfaces or network interfaces are using the IP addresses in the ranges provided.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Subnet**
Layer 3 Subnet.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IpRange**
The list of IP address ranges associated with the subnet.
For example: 10.64.10.100-10.64.10.192

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |named   |true (ByPropertyName)|IpRanges|

#### **Gateway**
The gateway for the default route of the subnet. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **RemoveAllIpRange**
If specified, It will remove all the ip ranges. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

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

#### **AddIpRange**
The list of IP address ranges to add to the subnet.
For example: 10.64.10.100-10.64.10.192.  This parameter is supported with Ontapi only.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|

#### **RemoveIpRange**
The list of IP address ranges to remove from the subnet.
For example: 10.64.10.100-10.64.10.192. This parameter is supported with Ontapi only.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetSubnetInfo

---

### Notes
Category: net
API: net-subnet-modify,net-subnet-add-ranges,net-subnet-remove-ranges
Family: cluster

---

### Syntax
```PowerShell
Set-NcNetSubnet [-Name] <String> [-Ipspace <String>] [-ForceUpdateLifAssociations] [-Subnet <String>] [-IpRange <String[]>] [-Gateway <String>] -RemoveAllIpRange <SwitchParameter> 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcNetSubnet [-Name] <String> [-Ipspace <String>] [-ForceUpdateLifAssociations] -AddIpRange <String[]> [-Gateway <String>] -RemoveAllIpRange <SwitchParameter> [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcNetSubnet [-Name] <String> [-Ipspace <String>] [-ForceUpdateLifAssociations] -RemoveIpRange <String[]> [-Gateway <String>] -RemoveAllIpRange <SwitchParameter> [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
