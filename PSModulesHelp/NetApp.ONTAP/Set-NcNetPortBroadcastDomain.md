Set-NcNetPortBroadcastDomain
----------------------------

### Synopsis
Modify the attributes of the layer 2 broadcast domain object.

---

### Description

Modify the attributes of the layer 2 broadcast domain object.

---

### Related Links
* [Get-NcNetPortBroadcastDomain](Get-NcNetPortBroadcastDomain)

* [Merge-NcNetPortBroadcastDomain](Merge-NcNetPortBroadcastDomain)

* [Split-NcNetPortBroadcastDomain](Split-NcNetPortBroadcastDomain)

* [Rename-NcNetPortBroadcastDomain](Rename-NcNetPortBroadcastDomain)

* [Remove-NcNetPortBroadcastDomain](Remove-NcNetPortBroadcastDomain)

---

### Examples
> Example 1

Set-NcNetPortBroadcastDomain -Name test -Ipspace test -Mtu 1500
Change the MTU for the given net port broadcast domain.

BroadcastDomain            Ipspace              FailoverGroups            Mtu PortUpdateStatusCombined
---------------            -------              --------------            --- ------------------------
test                       test                 {test}                   1500 complete

> Example 2

Set-NcNetPortBroadcastDomain -Name Default -AddPort beam-fs-ps-01:e0d
Add the specified port to the net port broadcast domain.

BroadcastDomain            Ipspace              FailoverGroups            Mtu PortUpdateStatusCombined
---------------            -------              --------------            --- ------------------------
Default                    Default              {Default}                1500 complete

> Example 3

Set-NcNetPortBroadcastDomain -Name pester_test -RemovePort beam-fs-ps-01:e0b -Ipspace test
Remove the given port from the net port broadcast domain.

BroadcastDomain            Ipspace              FailoverGroups            Mtu PortUpdateStatusCombined
---------------            -------              --------------            --- ------------------------
pester_test                test                                          1500 complete

---

### Parameters
#### **Name**
Name of the layer 2 broadcast domain.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |1       |true (ByPropertyName)|BroadcastDomain|

#### **Ipspace**
IPspace name that the layer 2 broadcast domain belongs to.  The default value for this parameter is 'Default'.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Mtu**
Maximum Transmission Unit (MTU) of the layer 2 broadcast domain. The MTU will be applied to all ports that belong to the layer 2 broadcast domain.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |3       |true (ByPropertyName)|

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

#### **AddPort**
Ports to be added to the broadcast domain.
Format:node-name:port-name

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|

#### **RemovePort**
Ports to be removed from the broadcast domain.
Format:node-name:port-name

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Net.NetPortBroadcastDomainInfo

---

### Notes
Category: net
API: net-port-broadcast-domain-modify,net-port-broadcast-domain-add-ports,net-port-broadcast-domain-remove-ports
Family: cluster

---

### Syntax
```PowerShell
Set-NcNetPortBroadcastDomain [-Name] <String> [[-Ipspace] <String>] [-Mtu] <Int32> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcNetPortBroadcastDomain [-Name] <String> [[-Ipspace] <String>] -AddPort <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcNetPortBroadcastDomain [-Name] <String> [[-Ipspace] <String>] -RemovePort <String[]> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
