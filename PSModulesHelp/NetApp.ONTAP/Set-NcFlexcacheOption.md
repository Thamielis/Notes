Set-NcFlexcacheOption
---------------------

### Synopsis
Modify the cluster-wide attributes of FlexCache.

---

### Description

Modify the cluster-wide attributes of FlexCache.

This cmdlet is not supported in ONTAP 8.2 and 8.3

---

### Related Links
* [Get-NcFlexcacheOption](Get-NcFlexcacheOption)

---

### Examples
> Example 1

```PowerShell
Set-NcFlexcacheOption -DelegationsHighWatermark 100 -DelegationsLowWatermark 20 -PerCacheStatistics $true
Set the cluster-wide FlexCache options.

NcController                      : 192.168.182.144
DelegationsHighWatermark          : 100
DelegationsLowWatermark           : 20
PerCacheStatistics                : True
DelegationsHighWatermarkSpecified : True
DelegationsLowWatermarkSpecified  : True
PerCacheStatisticsSpecified       : True

```

---

### Parameters
#### **DelegationsHighWatermark**
The maximum number of delegations that can be given out per node in the cluster. When this limit is reached, no further delegations can be given out to Cache clients.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **DelegationsLowWatermark**
The number of delegations per node, at which the node resumes giving out delegations to Cache clients.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |named   |true (ByPropertyName)|

#### **PerCacheStatistics**
If true, keep statistics per cache volume basis.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Flexcache.FlexcacheOptionsInfo

---

### Notes
Category: flexcache
API: flexcache-options-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcFlexcacheOption [-DelegationsHighWatermark <Int64>] [-DelegationsLowWatermark <Int64>] [-PerCacheStatistics <Boolean>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
