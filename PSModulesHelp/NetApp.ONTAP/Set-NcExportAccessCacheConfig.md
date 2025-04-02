Set-NcExportAccessCacheConfig
-----------------------------

### Synopsis
Modify the exports access cache configuration for the given Vserver.

---

### Description

Modify the exports access cache configuration for the given Vserver.

---

### Examples
> Example 1

```PowerShell
Set-NcExportAccessCacheConfig -TtlPositive 4500
Modify the exports access cache configuration for the Vserver vs1

HarvestTimeout          : 86400
NcController            : 10.238.73.251
TtlFailure              : 6
TtlNegative             : 4200
TtlPositive             : 4500
Vserver                 : vs1
HarvestTimeoutSpecified : True
TtlFailureSpecified     : True
TtlNegativeSpecified    : True
TtlPositiveSpecified    : True

```

---

### Parameters
#### **TtlPositive**
TTL in seconds for access cache entries that allow access. Default value is 3600 seconds

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |1       |true (ByPropertyName)|

#### **TtlNegative**
TTL in seconds for access cache entries that deny access. Default value is 3600 seconds

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |2       |true (ByPropertyName)|

#### **TtlFailure**
TTL in seconds for access cache entries that failed to fetch export rules from management gateway. Default value is 5 seconds

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |3       |true (ByPropertyName)|

#### **HarvestTimeout**
The timeout in seconds after which unused access cache entries will be deleted. Default value is 36000 seconds

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |4       |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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
* 

---

### Notes
Category: exports
API: exports-access-cache-config-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcExportAccessCacheConfig [[-TtlPositive] <Int32>] [[-TtlNegative] <Int32>] [[-TtlFailure] <Int32>] [[-HarvestTimeout] <Int32>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
