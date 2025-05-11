Get-NcNetSubnetsForBroadcastDomain
----------------------------------

### Synopsis
Get the list of subnets associated with the layer 2 broadcast

---

### Description

Get the list of subnets associated with the layer 2 broadcast

---

### Parameters
#### **Ipspace**
IPspace name that the layer 2 broadcast domain belongs to.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **BroadcastDomain**
The name of the layer 2 broadcast domain.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[NetSubnetsForBroadcastDomainInfo]`|false   |named   |false        |

#### **Controller**

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

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**

|Type                                |Required|Position|PipelineInput|
|------------------------------------|--------|--------|-------------|
|`[NetSubnetsForBroadcastDomainInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: net
API: net-subnets-for-broadcast-domain-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcNetSubnetsForBroadcastDomain [[-Ipspace] <String[]>] [[-BroadcastDomain] <String[]>] [-Attributes <NetSubnetsForBroadcastDomainInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetSubnetsForBroadcastDomain -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcNetSubnetsForBroadcastDomain -Query <NetSubnetsForBroadcastDomainInfo> [-Attributes <NetSubnetsForBroadcastDomainInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
