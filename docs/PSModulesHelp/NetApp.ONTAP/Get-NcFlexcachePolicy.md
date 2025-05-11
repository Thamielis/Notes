Get-NcFlexcachePolicy
---------------------

### Synopsis
Get a list of flexcache cache policy objects.

---

### Description

Get a list of flexcache cache policy objects.

Flexcache feature is not supported in ONTAP 8.3, so this cmdlet works in ONTAP 8.2 or lower only.

---

### Related Links
* [New-NcFlexcachePolicy](New-NcFlexcachePolicy)

* [Remove-NcFlexcachePolicy](Remove-NcFlexcachePolicy)

---

### Examples
> Example 1

Get-NcFlexcachePolicy -Name default
Get the default FlexCache cache policy.

CachePolicyName                 TimeToLiveFilesTS  TimeToLiveDirectoriesTS Vserver
---------------                 -----------------  ----------------------- -------
default                                  00:00:15                 00:00:15 lemon

---

### Parameters
#### **Vserver**
The name of the managing vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Name**
The name of one or more FlexCache cache policies.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases        |
|------------|--------|--------|---------------------|---------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|CachePolicyName|

#### **Attributes**
For improved scalability in large clusters, provide an FlexcacheCachePolicyInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcFlexcachePolicy -Template" to get the initially empty FlexcacheCachePolicyInfo object.  If not specified, all data is returned for each object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[FlexcacheCachePolicyInfo]`|false   |named   |false        |

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
Specify to get an empty FlexcacheCachePolicyInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide an FlexcacheCachePolicyInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcFlexcachePolicy -Template" to get the initially empty FlexcacheCachePolicyInfo object.

|Type                        |Required|Position|PipelineInput|
|----------------------------|--------|--------|-------------|
|`[FlexcacheCachePolicyInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Flexcache.FlexcacheCachePolicyInfo

---

### Notes
Category: flexcache
API: flexcache-cache-policy-get-iter
Family: vserver,cluster

---

### Syntax
```PowerShell
Get-NcFlexcachePolicy [[-Vserver] <String[]>] [[-Name] <String[]>] [-Attributes <FlexcacheCachePolicyInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFlexcachePolicy -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFlexcachePolicy -Query <FlexcacheCachePolicyInfo> [-Attributes <FlexcacheCachePolicyInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
