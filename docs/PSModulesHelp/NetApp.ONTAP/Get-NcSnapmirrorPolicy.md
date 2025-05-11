Get-NcSnapmirrorPolicy
----------------------

### Synopsis
Get a list of SnapMirror policies.

---

### Description

Get a list of SnapMirror policies.

---

### Related Links
* [New-NcSnapmirrorPolicy](New-NcSnapmirrorPolicy)

* [Add-NcSnapmirrorPolicyRule](Add-NcSnapmirrorPolicyRule)

---

### Examples
> Example 1

Get-NcSnapmirrorPolicy -Name XDPDefault
Get the XDPDefault snapmirror policy.

Name               TotalRules  TotalKeep      Tries TransferPriority   Restart  Vserver
----               ----------  ---------      ----- ----------------   -------  -------
XDPDefault                  2         59          8 normal             always   beam01

> Example 2

$q = Get-NcSnapmirrorPolicy -Template
$q.TotalRules = ">0"
Get-NcSnapmirrorPolicy -Query $q
Get all of the snapmirror policies that have defined at least one rule.

Name               TotalRules  TotalKeep      Tries TransferPriority   Restart  Vserver
----               ----------  ---------      ----- ----------------   -------  -------
XDPDefault                  2         59          8 normal             always   beam01

---

### Parameters
#### **Name**
The name of one or more snapmirror policies.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|false   |1       |true (ByPropertyName)|PolicyName|

#### **Vserver**
The name of one or more vservers for the snapmirror policies.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases    |
|------------|--------|--------|---------------------|-----------|
|`[String[]]`|false   |named   |true (ByPropertyName)|VserverName|

#### **Attributes**
For improved scalability in large clusters, provide a SnapmirrorPolicyInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcSnapmirrorPolicy -Template" to get the initially empty SnapmirrorPolicyInfo object.  If not specified, all data is returned for each object.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[SnapmirrorPolicyInfo]`|false   |named   |false        |

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
Specify to get an empty SnapmirrorPolicyInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a SnapmirrorPolicyInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcSnapmirrorPolicy -Template" to get the initially empty SnapmirrorPolicyInfo object.

|Type                    |Required|Position|PipelineInput|
|------------------------|--------|--------|-------------|
|`[SnapmirrorPolicyInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.SnapmirrorPolicy.SnapmirrorPolicyInfo

---

### Notes
Category: snapmirror policy
API: snapmirror-policy-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcSnapmirrorPolicy [[-Name] <String[]>] [-Vserver <String[]>] [-Attributes <SnapmirrorPolicyInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnapmirrorPolicy -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcSnapmirrorPolicy -Query <SnapmirrorPolicyInfo> [-Attributes <SnapmirrorPolicyInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
