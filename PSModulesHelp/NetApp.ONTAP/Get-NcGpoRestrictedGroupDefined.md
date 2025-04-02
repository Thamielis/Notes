Get-NcGpoRestrictedGroupDefined
-------------------------------

### Synopsis
Get information on all restricted Group Settings defined

---

### Description

Get information on all restricted Group Settings defined

---

### Related Links
* [Get-NcGpoRestrictedGroupApplied](Get-NcGpoRestrictedGroupApplied)

* [Get-NcGpo](Get-NcGpo)

---

### Parameters
#### **Vserver**
One or more Vserver display names.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **GroupPolicyName**
GPO name in text format.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases               |
|------------|--------|--------|---------------------|----------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|GpoName<br/>PolicyName|

#### **GroupName**
Group name associated with GPO group-policy-name.

|Type        |Required|Position|PipelineInput        |Aliases     |
|------------|--------|--------|---------------------|------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|GpoGroupName|

#### **LinkType**
Restrict results to one or more link types : site, local, domain, organizationalunit, rsop.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[GpoRestrictedGroupDefinedInfo]`|false   |named   |false        |

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
Can be used to obtain an empty query element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                             |Required|Position|PipelineInput|
|---------------------------------|--------|--------|-------------|
|`[GpoRestrictedGroupDefinedInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Gpo.GpoRestrictedGroupDefinedInfo

---

### Notes
Category: gpo
API: gpo-restricted-group-defined-info-get-iter
Family: vserver, cluster

---

### Syntax
```PowerShell
Get-NcGpoRestrictedGroupDefined [[-Vserver] <String[]>] [[-GroupPolicyName] <String[]>] [-GroupName <String[]>] [-LinkType <String[]>] [-Attributes <GpoRestrictedGroupDefinedInfo>] 
```
```PowerShell
[-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcGpoRestrictedGroupDefined -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcGpoRestrictedGroupDefined -Query <GpoRestrictedGroupDefinedInfo> [-Attributes <GpoRestrictedGroupDefinedInfo>] [-VserverContext <String>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
