Set-NcSisPolicy
---------------

### Synopsis
Modify the attributes of a SIS (dedupe) policy.

---

### Description

Modify the attributes of a SIS (dedupe) policy.

---

### Related Links
* [New-NcSisPolicy](New-NcSisPolicy)

* [Get-NcSisPolicy](Get-NcSisPolicy)

* [Remove-NcSisPolicy](Remove-NcSisPolicy)

---

### Examples
> Example 1

```PowerShell
Set-NcSisPolicy dailyDedupe -DurationHours 8 -Comment ""
Change the duration of dedupe policy "dailyDedupe" to 8 hours and clear the associated comment.

NcController     : vxeRubble
Comment          :
Duration         : 8
DurationTS       : 08:00:00
Enabled          : True
PolicyName       : dailyDedupe
Schedule         : daily
Vserver          : costea01
EnabledSpecified : True

```

---

### Parameters
#### **Name**
The name of the dedupe policy to modify.

|Type      |Required|Position|PipelineInput        |Aliases              |
|----------|--------|--------|---------------------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Policy<br/>PolicyName|

#### **Schedule**
Cron type job schedule name.  When the associated policy is set on a volume, the SIS operation will be triggered for the volume on this schedule.  If this field is not set, the existing value is not modified.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Enabled**
If the value is true, the SIS policy is active in this cluster.  If the value is false this policy will not be activated by the schedulers and hence will be inactive.  A policy can be assigned to managed objects although it is disabled.  If the value is not specified, the current settings are retained.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Boolean]`|false   |named   |false        |

#### **DurationHours**
The duration in hours for which the scheduled SIS operation should run.  After this time expires, the SIS operation will be stopped even if the operation is incomplete.  If 0 is specified as the duration, the SIS operation will run until it completes.  If duration is not provided the current setting is not modified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |named   |false        |

#### **Comment**
A brief description of the policy.  If a value is not provided the current settings are retained.  An empty string can be used to clear the current comment setting.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **QosPolicy**
QoS policy for the sis operation. 
Possible values:
"background" - sis operation will run in background with minimal or no impact on data serving client operations
"best-effort" - sis operations may have some impact on data serving client operations.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **PolicyType**
The policy type reflects the reason a volume using this policy will start processing a changelog.
Possible values: 
"threshold"- Changelog processing occurs once the changelog reaches a certain percent full.
"scheduled" - Changelog processing will be triggered by time.
Default value: "scheduled"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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

#### **ChangelogThresholdPercent**
Percentage at which the changelog will be processed for a policy type 'threshold', tested once each hour. Range [1..100].

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Sis.SisPolicyInfo

---

### Notes
Category: sis
API: sis-policy-modify
Family: vserver

---

### Syntax
```PowerShell
Set-NcSisPolicy [-Name] <String> [[-Schedule] <String>] [-Enabled <Boolean>] [-DurationHours <UInt32>] [-Comment <String>] [-QosPolicy <String>] [-PolicyType <String>] [-VserverContext 
```
```PowerShell
<String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcSisPolicy [-Name] <String> [-Enabled <Boolean>] [-DurationHours <UInt32>] [-Comment <String>] [-QosPolicy <String>] [-PolicyType <String>] [-ChangelogThresholdPercent <Int32>] 
```
```PowerShell
[-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
