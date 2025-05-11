Remove-NcSnapmirrorPolicyRule
-----------------------------

### Synopsis
Remove a rule from SnapMirror policy.

---

### Description

Remove a rule from SnapMirror policy.

---

### Related Links
* [Get-NcSnapmirrorPolicy](Get-NcSnapmirrorPolicy)

* [Add-NcSnapmirrorPolicyRule](Add-NcSnapmirrorPolicyRule)

* [Set-NcSnapmirrorPolicyRule](Set-NcSnapmirrorPolicyRule)

---

### Examples
> Example 1

Remove-NcSnapmirrorPolicyRule -Name sn_policy -SnapmirrorLabel weekly
Remove the rule from the snapmirror policy.

Name               TotalRules  TotalKeep      Tries TransferPriority   Restart  Vserver
----               ----------  ---------      ----- ----------------   -------  -------
sn_policy                   0          0          5 normal             always   beam01

---

### Parameters
#### **Name**
The name of the SnapMirror policy.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|PolicyName|

#### **SnapmirrorLabel**
Specifies the Snapshot copy label.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **RetentionCount**
Specifies the Snapshot copy retention count. This parameter is supported with Rest only.

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.SnapmirrorPolicy.SnapmirrorPolicyInfo

---

### Notes
Category: snapmirror policy
API: snapmirror-policy-remove-rule
Family: vserver

---

### Syntax
```PowerShell
Remove-NcSnapmirrorPolicyRule [-Name] <String> [-SnapmirrorLabel] <String> [-VserverContext <String>] [-RetentionCount <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
