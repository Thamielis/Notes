Set-NcSnapmirrorPolicy
----------------------

### Synopsis
Modify the specified SnapMirror Policy.

---

### Description

Modify the specified SnapMirror Policy.

---

### Related Links
* [Get-NcSnapmirrorPolicy](Get-NcSnapmirrorPolicy)

* [New-NcSnapmirrorPolicy](New-NcSnapmirrorPolicy)

* [Remove-NcSnapmirrorPolicy](Remove-NcSnapmirrorPolicy)

---

### Examples
> Example 1

Set-NcSnapmirrorPolicy -Name sn_policy -TransferPriority normal -Restart always
Modify the snapmirror policy sn_policy.

Name               TotalRules  TotalKeep      Tries TransferPriority   Restart  Vserver
----               ----------  ---------      ----- ----------------   -------  -------
sn_policy                   1          4          5 normal             always   beam01

---

### Parameters
#### **Name**
The name of the SnapMirror policy.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|PolicyName|

#### **Tries**
Specifies the maximum number of times to attempt each manual or scheduled transfer for a SnapMirror relationship. The default is '8'.  This value is ignored if the UnlimitedTries switch is set.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **UnlimitedTries**
If specified, specify an unlimited number of tries.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **TransferPriority**
Specifies the priority at which a SnapMirror transfer runs.
Possible values:
'normal' : By default every transfer in the system has this priority. These transfers are scheduled before most 'low' priority transfers.
'low'    : These transfers have least priority and usually are scheduled after most 'normal' priority transfers.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Restart**
Defines the behavior of SnapMirror if an interrupted transfer exists. Applies to SnapMirror data protection relationship only. Possible values: "always", "never", "default"

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IgnoreAccessTime**
If true, incremental transfers will ignore files which have only their access time changed. Applies to SnapMirror vault relationships only.

|Type       |Required|Position|PipelineInput        |Aliases    |
|-----------|--------|--------|---------------------|-----------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|IgnoreAtime|

#### **Comment**
A human readable description associated with the SnapMirror policy.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **EnableNetworkCompression**
If true, network compression is enabled for transfers.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **WindowSizeForTdpMirror**
Window size for TDP Mirror Transfer Operations. The default size is 2M

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Owner**
The owner of the SnapMirror policy.
This parameter is available in ONTAP 8.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SnapmirrorLabel**
Specifies the Snapshot copy label.
This parameter is available in ONTAP 8.4 and later.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Keep**
Specifies the Snapshot copy retention count.
This parameter is available in ONTAP 8.4 and later.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Preserve**
Specifies whether Snapshot copy preserve is enabled, which determines the behavior when the Snapshot copy retention count is reached on the SnapMirror Vault destination.
This parameter is available in ONTAP 8.4 and later.

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[Boolean[]]`|false   |named   |true (ByPropertyName)|

#### **Warn**
Specifies the warning threshold count.
This parameter is available in ONTAP 8.4 and later.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Int64[]]`|false   |named   |true (ByPropertyName)|

#### **Schedule**
Specifies the Snapshot copy creation schedule name associated with the rule.
This parameter is available in ONTAP 8.4 and later.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Prefix**
Specifies the Snapshot copy creation prefix name associated with the rule.
This parameter is available in ONTAP 8.4 and later.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **DiscardConfigs**
Configurations Not Replicated During Identity Preserve Vserver DR.
This parameter is available in ONTAP 8.4 and later.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.SnapmirrorPolicy.SnapmirrorPolicyInfo

---

### Notes
Category: snapmirror policy
API: snapmirror-policy-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcSnapmirrorPolicy [-Name] <String> [-Tries <Int32>] [-UnlimitedTries] [-TransferPriority <String>] [-Restart <String>] [-IgnoreAccessTime <Boolean>] [-Comment <String>] 
```
```PowerShell
[-EnableNetworkCompression <Boolean>] [-WindowSizeForTdpMirror <String>] [-Owner <String>] [-SnapmirrorLabel <String[]>] [-Keep <String[]>] [-Preserve <Boolean[]>] [-Warn <Int64[]>] 
```
```PowerShell
[-Schedule <String[]>] [-Prefix <String[]>] [-DiscardConfigs <String[]>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
