Get-NcPlatformCap
-----------------

### Synopsis
Iterate over a list of Platform Capability Support objects.

---

### Description

Iterate over a list of Platform Capability Support objects.

---

### Examples
> Example 1

```PowerShell
Get-NcPlatformCap
Iterate over a list of Platform Capability Support objects.

CapabilityId          : 0
Name                  : CAP_CMCI_ENABLED
NcController          : 10.238.73.251
Node                  : sapanj-vsim3
Supported             : false
CapabilityIdSpecified : True

CapabilityId          : 1
Name                  : CAP_HA_CONFIG_ONLY
NcController          : 10.238.73.251
Node                  : sapanj-vsim3
Supported             : false
CapabilityIdSpecified : True

CapabilityId          : 2
Name                  : CAP_SUPPORT_CARD_FRU
NcController          : 10.238.73.251
Node                  : sapanj-vsim3
Supported             : false
CapabilityIdSpecified : True

CapabilityId          : 3
Name                  : CAP_SCORPIO_EN
NcController          : 10.238.73.251
Node                  : sapanj-vsim3
Supported             : false
CapabilityIdSpecified : True

CapabilityId          : 4
Name                  : CAP_NVD_EN
NcController          : 10.238.73.251
Node                  : sapanj-vsim3
Supported             : false
CapabilityIdSpecified : True

CapabilityId          : 5
Name                  : CAP_ENABLE_HPET
NcController          : 10.238.73.251
Node                  : sapanj-vsim3
Supported             : false
CapabilityIdSpecified : True

CapabilityId          : 6
Name                  : CAP_VERIFY_ACPI_TABLE
NcController          : 10.238.73.251
Node                  : sapanj-vsim3
Supported             : false
CapabilityIdSpecified : True

CapabilityId          : 0
Name                  : CAP_CMCI_ENABLED
NcController          : 10.238.73.251
Node                  : sapanj-vsim4
Supported             : false
CapabilityIdSpecified : True

CapabilityId          : 1
Name                  : CAP_HA_CONFIG_ONLY
NcController          : 10.238.73.251
Node                  : sapanj-vsim4
Supported             : false
CapabilityIdSpecified : True

CapabilityId          : 2
Name                  : CAP_SUPPORT_CARD_FRU
NcController          : 10.238.73.251
Node                  : sapanj-vsim4
Supported             : false
CapabilityIdSpecified : True

CapabilityId          : 3
Name                  : CAP_SCORPIO_EN
NcController          : 10.238.73.251
Node                  : sapanj-vsim4
Supported             : false
CapabilityIdSpecified : True

CapabilityId          : 4
Name                  : CAP_NVD_EN
NcController          : 10.238.73.251
Node                  : sapanj-vsim4
Supported             : false
CapabilityIdSpecified : True

CapabilityId          : 5
Name                  : CAP_ENABLE_HPET
NcController          : 10.238.73.251
Node                  : sapanj-vsim4
Supported             : false
CapabilityIdSpecified : True

CapabilityId          : 6
Name                  : CAP_VERIFY_ACPI_TABLE
NcController          : 10.238.73.251
Node                  : sapanj-vsim4
Supported             : false
CapabilityIdSpecified : True

```

---

### Parameters
#### **Node**
Specify to filter by Node.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Nodes  |

#### **CapabilityId**
Specify to filter by CapabilityId

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
Specify the attributes that should be returned. If not present, all attributes for which information is available will be returned. If present, only the desired attributes for which information is available will be returned.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[PlatformCapInfo]`|false   |named   |false        |

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
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type               |Required|Position|PipelineInput|
|-------------------|--------|--------|-------------|
|`[PlatformCapInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.PlatformCap.PlatformCapInfo

---

### Notes
Category: platform-cap
API: platform-cap-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcPlatformCap [[-Node] <String[]>] [[-CapabilityId] <Int64>] [-Attributes <PlatformCapInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcPlatformCap -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcPlatformCap -Query <PlatformCapInfo> [-Attributes <PlatformCapInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
