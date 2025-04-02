Get-NcExportAccessCacheConfig
-----------------------------

### Synopsis
Get the exports access cache configuration for the given Vserver

---

### Description

Get the exports access cache configuration for the given Vserver

---

### Examples
> Example 1

```PowerShell
Get-NcExportAccessCacheConfig
Get the exports access cache configuration for the Vserver vs1

HarvestTimeout          : 86400
NcController            : 10.238.73.251
TtlFailure              : 6
TtlNegative             : 3600
TtlPositive             : 3600
Vserver                 : vs1
HarvestTimeoutSpecified : True
TtlFailureSpecified     : True
TtlNegativeSpecified    : True
TtlPositiveSpecified    : True

```

---

### Parameters
#### **Vserver**
Restrict results to the specified vserver(s). Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **Attributes**
The attributes of the Exports Access Cache Configuration.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[ExportsAccessCacheConfigInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty ExportAccessCacheConfigInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a ExportAccessCacheConfigInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcExportAccessCacheConfig -Template" to get the initially empty ExportAccessCacheConfigInfo object.

|Type                            |Required|Position|PipelineInput|
|--------------------------------|--------|--------|-------------|
|`[ExportsAccessCacheConfigInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Exports.ExportsAccessCacheConfigInfo

---

### Notes
Category: exports
API: exports-access-cache-config-get
Family: vserver

---

### Syntax
```PowerShell
Get-NcExportAccessCacheConfig [-Vserver <String[]>] [-Attributes <ExportsAccessCacheConfigInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcExportAccessCacheConfig -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcExportAccessCacheConfig -Query <ExportsAccessCacheConfigInfo> [-Attributes <ExportsAccessCacheConfigInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
