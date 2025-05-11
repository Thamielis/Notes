Set-NcSnapmirrorPolicyRule
--------------------------

### Synopsis
Modify the specified SnapMirror Policy rule.

---

### Description

Modify the specified SnapMirror Policy rule.

---

### Related Links
* [Get-NcSnapmirrorPolicy](Get-NcSnapmirrorPolicy)

* [Add-NcSnapmirrorPolicyRule](Add-NcSnapmirrorPolicyRule)

* [Remove-NcSnapmirrorPolicyRule](Remove-NcSnapmirrorPolicyRule)

---

### Examples
> Example 1

Set-NcSnapmirrorPolicyRule -Name sn_policy -SnapmirrorLabel weekly -RetentionCount 10 -Preserve $true
Modify the snapmirror policy rule for snapmirror label 'weekly'.

Name               TotalRules  TotalKeep      Tries TransferPriority   Restart  Vserver
----               ----------  ---------      ----- ----------------   -------  -------
sn_policy                   1         10          5 normal             always   beam01

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

#### **RetentionCount**
Specifies the Snapshot copy retention count.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |named   |true (ByPropertyName)|Keep   |

#### **Preserve**
Specifies whether Snapshot copy preserve is enabled.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **WarnThreshold**
Specifies the warning threshold count.

|Type     |Required|Position|PipelineInput        |Aliases|
|---------|--------|--------|---------------------|-------|
|`[Int32]`|false   |named   |true (ByPropertyName)|Warn   |

#### **Schedule**
Specifies the Snapshot copy creation schedule name associated with the rule.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.SnapmirrorPolicy.SnapmirrorPolicyInfo

---

### Notes
Category: snapmirror policy
API: snapmirror-policy-modify-rule
Family: vserver

---

### Syntax
```PowerShell
Set-NcSnapmirrorPolicyRule [-Name] <String> [-SnapmirrorLabel] <String> [-RetentionCount <String>] [-Preserve <Boolean>] [-WarnThreshold <Int32>] [-Schedule <String>] [-VserverContext 
```
```PowerShell
<String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [<CommonParameters>]
```
