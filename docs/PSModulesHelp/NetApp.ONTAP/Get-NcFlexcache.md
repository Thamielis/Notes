Get-NcFlexcache
---------------

### Synopsis
Get a list of flexcache objects.

---

### Description

Get a list of flexcache objects.

Flexcache feature is not supported in ONTAP 8.3, so this cmdlet works in ONTAP 8.2 or lower only.

---

### Related Links
* [New-NcFlexcache](New-NcFlexcache)

* [Remove-NcFlexcache](Remove-NcFlexcache)

---

### Examples
> Example 1

Get-NcFlexcache -Vserver lemon
Get all of the FlexCache objects for vserver lemon.

CacheVolume              CacheState          CacheSize   CachePercentUsed  ConnectionStatus  Vserver
-----------              ----------          ---------   ----------------  ----------------  -------
cifs_cache_aggr1         online                30.4 MB                 0%         ok         lemon

> Example 2

$q = Get-NcFlexcache -Template
$q.ConnectionStatus = "ok"
Get-NcFlexcache -Query $q
Get all of the FlexCache objects with an "ok" connection status.

CacheVolume              CacheState          CacheSize   CachePercentUsed  ConnectionStatus  Vserver
-----------              ----------          ---------   ----------------  ----------------  -------
cifs_cache_aggr1         online                30.4 MB                 0%         ok         lemon

---

### Parameters
#### **Vserver**
The name of the managing vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **CacheVolume**
The name of one or more cache volumes.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **OriginVolume**
The name of one or more origin volumes.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Volume**

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |4       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an FlexcacheInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcFlexcache -Template" to get the initially empty FlexcacheInfo object.  If not specified, all data is returned for each object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[FlexcacheInfo]`|false   |named   |false        |

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **Template**
Specify to get an empty FlexcacheInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an FlexcacheInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcFlexcache -Template" to get the initially empty FlexcacheInfo object.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[FlexcacheInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Flexcache.FlexcacheInfo

---

### Notes
Category: flexcache
API: flexcache-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcFlexcache [[-Vserver] <String[]>] [[-CacheVolume] <String[]>] [[-OriginVolume] <String[]>] [[-Volume] <String[]>] [-Attributes <FlexcacheInfo>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFlexcache -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFlexcache -Query <FlexcacheInfo> [-Attributes <FlexcacheInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
