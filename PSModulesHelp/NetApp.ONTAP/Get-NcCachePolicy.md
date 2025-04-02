Get-NcCachePolicy
-----------------

### Synopsis
Get the attributes of an Cache policy.

---

### Description

Get the attributes of an Cache policy.

---

### Examples
> Example 1

```PowerShell
Get-NcCachePolicy
Get the attributes of an Cache policy.

CacheClass                 : preset
CachePolicyName            : all
IsDefault                  : False
IsLopriData                : True
IsMetaData                 : True
IsNormalData               : True
IsRandomwriteData          : True
IsReadaheadData            : True
NcController               : 10.140.111.42
IsDefaultSpecified         : True
IsLopriDataSpecified       : True
IsMetaDataSpecified        : True
IsNormalDataSpecified      : True
IsRandomwriteDataSpecified : True
IsReadaheadDataSpecified   : True

CacheClass                 : preset
CachePolicyName            : all_read
IsDefault                  : False
IsLopriData                : False
IsMetaData                 : True
IsNormalData               : True
IsRandomwriteData          : False
IsReadaheadData            : True
NcController               : 10.140.111.42
IsDefaultSpecified         : True
IsLopriDataSpecified       : True
IsMetaDataSpecified        : True
IsNormalDataSpecified      : True
IsRandomwriteDataSpecified : True
IsReadaheadDataSpecified   : True

CacheClass                 : preset
CachePolicyName            : all_read_random_write
IsDefault                  : False
IsLopriData                : False
IsMetaData                 : True
IsNormalData               : True
IsRandomwriteData          : True
IsReadaheadData            : True
NcController               : 10.140.111.42
IsDefaultSpecified         : True
IsLopriDataSpecified       : True
IsMetaDataSpecified        : True
IsNormalDataSpecified      : True
IsRandomwriteDataSpecified : True
IsReadaheadDataSpecified   : True

CacheClass                 : preset
CachePolicyName            : all_read_random_write-random_write
IsDefault                  : False
IsLopriData                : False
IsMetaData                 : True
IsNormalData               : True
IsRandomwriteData          : True
IsReadaheadData            : True
NcController               : 10.140.111.42
IsDefaultSpecified         : True
IsLopriDataSpecified       : True
IsMetaDataSpecified        : True
IsNormalDataSpecified      : True
IsRandomwriteDataSpecified : True
IsReadaheadDataSpecified   : True

CacheClass                 : preset
CachePolicyName            : all_read-random_write
IsDefault                  : False
IsLopriData                : False
IsMetaData                 : True
IsNormalData               : True
IsRandomwriteData          : True
IsReadaheadData            : True
NcController               : 10.140.111.42
IsDefaultSpecified         : True
IsLopriDataSpecified       : True
IsMetaDataSpecified        : True
IsNormalDataSpecified      : True
IsRandomwriteDataSpecified : True
IsReadaheadDataSpecified   : True

CacheClass                 : preset
CachePolicyName            : all-random_write
IsDefault                  : False
IsLopriData                : True
IsMetaData                 : True
IsNormalData               : True
IsRandomwriteData          : True
IsReadaheadData            : True
NcController               : 10.140.111.42
IsDefaultSpecified         : True
IsLopriDataSpecified       : True
IsMetaDataSpecified        : True
IsNormalDataSpecified      : True
IsRandomwriteDataSpecified : True
IsReadaheadDataSpecified   : True

CacheClass                 : preset
CachePolicyName            : auto
IsDefault                  : True
IsLopriData                : False
IsMetaData                 : True
IsNormalData               : True
IsRandomwriteData          : False
IsReadaheadData            : False
NcController               : 10.140.111.42
IsDefaultSpecified         : True
IsLopriDataSpecified       : True
IsMetaDataSpecified        : True
IsNormalDataSpecified      : True
IsRandomwriteDataSpecified : True
IsReadaheadDataSpecified   : True

CacheClass                 : preset
CachePolicyName            : meta
IsDefault                  : False
IsLopriData                : False
IsMetaData                 : True
IsNormalData               : False
IsRandomwriteData          : False
IsReadaheadData            : False
NcController               : 10.140.111.42
IsDefaultSpecified         : True
IsLopriDataSpecified       : True
IsMetaDataSpecified        : True
IsNormalDataSpecified      : True
IsRandomwriteDataSpecified : True
IsReadaheadDataSpecified   : True

CacheClass                 : preset
CachePolicyName            : meta-random_write
IsDefault                  : False
IsLopriData                : False
IsMetaData                 : True
IsNormalData               : False
IsRandomwriteData          : False
IsReadaheadData            : False
NcController               : 10.140.111.42
IsDefaultSpecified         : True
IsLopriDataSpecified       : True
IsMetaDataSpecified        : True
IsNormalDataSpecified      : True
IsRandomwriteDataSpecified : True
IsReadaheadDataSpecified   : True

CacheClass                 : preset
CachePolicyName            : none
IsDefault                  : False
IsLopriData                : False
IsMetaData                 : False
IsNormalData               : False
IsRandomwriteData          : False
IsReadaheadData            : False
NcController               : 10.140.111.42
IsDefaultSpecified         : True
IsLopriDataSpecified       : True
IsMetaDataSpecified        : True
IsNormalDataSpecified      : True
IsRandomwriteDataSpecified : True
IsReadaheadDataSpecified   : True

CacheClass                 : preset
CachePolicyName            : noread-random_write
IsDefault                  : False
IsLopriData                : False
IsMetaData                 : False
IsNormalData               : False
IsRandomwriteData          : False
IsReadaheadData            : False
NcController               : 10.140.111.42
IsDefaultSpecified         : True
IsLopriDataSpecified       : True
IsMetaDataSpecified        : True
IsNormalDataSpecified      : True
IsRandomwriteDataSpecified : True
IsReadaheadDataSpecified   : True

CacheClass                 : preset
CachePolicyName            : random_read
IsDefault                  : False
IsLopriData                : False
IsMetaData                 : True
IsNormalData               : True
IsRandomwriteData          : False
IsReadaheadData            : False
NcController               : 10.140.111.42
IsDefaultSpecified         : True
IsLopriDataSpecified       : True
IsMetaDataSpecified        : True
IsNormalDataSpecified      : True
IsRandomwriteDataSpecified : True
IsReadaheadDataSpecified   : True

CacheClass                 : preset
CachePolicyName            : random_read_write
IsDefault                  : False
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

CacheClass                 : preset
CachePolicyName            : random_read_write-random_write
IsDefault                  : False
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

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CacheInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCachePolicy -Template" to get the initially empty CacheInfo object.  If not specified, all data is returned for each object.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[CacheInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty CacheInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a CacheInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcCachePolicy -Template" to get the initially empty CacheInfo object.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[CacheInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Qos.CacheInfo

---

### Notes
Category: qos
API: cache-policy-get
Family: ontap-cluster

---

### Syntax
```PowerShell
Get-NcCachePolicy [[-CachePolicyName] <String[]>] [-Attributes <CacheInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCachePolicy -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcCachePolicy -Query <CacheInfo> [-Attributes <CacheInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
