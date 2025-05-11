Set-NcCachePolicy
-----------------

### Synopsis
Modify an existing Cache policy.

---

### Description

Modify an existing Cache policy. Only default field in the row is modifiable.

---

### Examples
> Example 1

```PowerShell
Set-NcCachePolicy -CachePolicyName random_read_write-randomwrite -IsDefault $true
Modify an existing Cache policy random_read_write-randomwrite

CacheClass                 : preset
CachePolicyName            : random_read_write-random_write
IsDefault                  : True
IsLopriData                : False
IsMetaData                 : True
IsNormalData               : True
IsRandomwriteData          : True
IsReadaheadData            : False
NcController               : 10.140.111.42
IsDefaultSpecified         : True
IsLopriDataSpecified       : True
IsMetaDataSpecified        : True
IsNormalDataSpecified      : True
IsRandomwriteDataSpecified : True
IsReadaheadDataSpecified   : True

```

---

### Parameters
#### **CachePolicyName**
Name of the QoS Cache policy

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **IsDefault**
Identifies the default Cache policy.  If this field is true then QoS workloads with the special value 'default' in the cache field will use this cache policy.

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Qos.CacheInfo

---

### Notes
Category: qos
API: cache-policy-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcCachePolicy [-CachePolicyName] <String> [-IsDefault <Boolean>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
