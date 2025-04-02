Get-NcFlexcacheOption
---------------------

### Synopsis
Get the cluster-wide attributes of FlexCache.

---

### Description

Get the cluster-wide attributes of FlexCache.

This cmdlet is not supported in ONTAP 8.2 and 8.3

---

### Related Links
* [Set-NcFlexcacheOption](Set-NcFlexcacheOption)

---

### Examples
> Example 1

```PowerShell
Get-NcFlexcacheOption
Get the FlexCache options for the current cluster.

DelegationsHighWatermark          : 75
DelegationsLowWatermark           : 25
PerCacheStatistics                : False
DelegationsHighWatermarkSpecified : True
DelegationsLowWatermarkSpecified  : True
PerCacheStatisticsSpecified       : True

```

---

### Parameters
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
API: flexcache-options-get
Family: cluster

---

### Syntax
```PowerShell
Get-NcFlexcacheOption [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
