Set-NcExportsAccessCache
------------------------

### Synopsis
Modify the NFS Exports Access Cache refresh periods.

---

### Description

Modify the NFS Exports Access Cache refresh periods.

---

### Related Links
* [Get-NcExportsAccessCache](Get-NcExportsAccessCache)

---

### Examples
> Example 1

```PowerShell
Set-NcExportsAccessCache -PositiveRefreshPeriod 1h
Set the positive refresh period to 1 hour.

RefreshPeriodPositive : 3600
RefreshPeriodNegative : 3600
HarvestTimeout        : 86400

```

---

### Parameters
#### **PositiveRefreshPeriod**
Refresh Period for Positive Entries. Examples : 5m (5 minutes), 1d (1 day)

|Type      |Required|Position|PipelineInput        |Aliases              |
|----------|--------|--------|---------------------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|RefreshPeriodPositive|

#### **NegativeRefreshPeriod**
Refresh Period for Negative Entries. Examples : 5m (5 minutes), 1d (1 day)

|Type      |Required|Position|PipelineInput        |Aliases              |
|----------|--------|--------|---------------------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|RefreshPeriodNegative|

#### **HarvestTimeout**
Harvest Timeout

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Exports.AccessCacheAttributesInfo

---

### Notes
Category: exports
API: exports-access-cache-all-vservers-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcExportsAccessCache [-PositiveRefreshPeriod <String>] [-NegativeRefreshPeriod <String>] [-HarvestTimeout <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
