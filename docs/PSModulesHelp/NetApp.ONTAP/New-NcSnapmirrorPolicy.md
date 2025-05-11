New-NcSnapmirrorPolicy
----------------------

### Synopsis
Create a new SnapMirror Policy.

---

### Description

Create a new SnapMirror Policy.

---

### Related Links
* [Get-NcSnapmirrorPolicy](Get-NcSnapmirrorPolicy)

* [Add-NcSnapmirrorPolicyRule](Add-NcSnapmirrorPolicyRule)

---

### Examples
> Example 1

```PowerShell
New-NcSnapmirrorPolicy -Name sn_policy -Tries 5 -TransferPriority low -Comment "Test snapmirror policy."
Create a new snapmirror policy.

Comment               : Test snapmirror policy.
IgnoreAtime           : False
NcController          : 10.63.165.62
Owner                 : vserver_admin
PolicyName            : sn_policy
Restart               : default
SnapmirrorPolicyRules :
TotalKeep             : 0
TotalRules            : 0
TransferPriority      : low
Tries                 : 5
VserverName           : beam01

```

---

### Parameters
#### **Name**
The name of the SnapMirror policy.

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |1       |true (ByPropertyName)|PolicyName|

#### **Tries**
Specifies the maximum number of times to attempt each manual or scheduled transfer for a SnapMirror relationship. Valid input is a positive integer.  The default is 8.  If the UnlimitedTries switch is set, this value is ignored.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Int32?]`|false   |named   |true (ByPropertyName)|

#### **UnlimitedTries**
If specified, a tries value of 'unlimited' will be used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TransferPriority**
Specifies the priority at which a SnapMirror transfer runs.
Possible values:
'normal'  : By default every transfer in the system has this priority. These transfers are scheduled before most 'low' priority transfers.
'low'     : These transfers have least priority and usually are scheduled after most 'normal' priority transfers.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Restart**
Defines the behavior of SnapMirror if an interrupted transfer exists. Applies to SnapMirror data protection relationship only.
Possible values: "always", "never", "default"

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IgnoreAccessTime**
If specified, incremental transfers will ignore files which have only their access time changed. Applies to SnapMirror vault relationships only.

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[Switch]`|false   |named   |false        |IgnoreAtime|

#### **Comment**
A human readable description associated with the SnapMirror policy.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Type**
The type of the Snapmirror policy.  Possible values: 'vault', 'async_mirror', 'mirror_vault', 'sync_mirror'

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **EnableNetworkCompression**
If specified, network compression is enabled for transfers.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

#### **CopyAllSourceSnapshots**
Specifies whether all source Snapshot copies should be copied to the destination on a transfer rather than specifying specific retentions." +
            "This is applicable only to async policies. This parameter is supported with Rest Only.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[Boolean?]`|false   |named   |true (ByPropertyName)|

#### **IdentityPreservation**
Specifies which configuration of the source SVM is replicated to the destination SVM." +
            "This property is applicable only for SVM data protection with async policy type. This parameter is supported with Rest Only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **RPO**
Specifies the duration of time for which a change to be propogated to a mirror should be delayed, in seconds. This parameter is supported with Rest Only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Int64?]`|false   |named   |true (ByPropertyName)|

#### **CommonSnapShotSchedule**
Schedule used to create common Snapshot copies for synchronous relationships. This parameter is supported with Rest Only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SyncType**
Set type of sync e.g., sync, strict_sync, automated_failover. This parameter is supported with Rest Only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Throttle**
Throttle in KB/s. Default to unlimited. This parameter is supported with Rest Only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Int64?]`|false   |named   |true (ByPropertyName)|

#### **TransferSchedule**
The schedule used to update asynchronous relationships. To create object use New - Object DataONTAP.C.Types.SnapmirrorPolicyInfo.TransferSchedule .  This parameter is supported with Rest Only.

|Type                |Required|Position|PipelineInput        |
|--------------------|--------|--------|---------------------|
|`[TransferSchedule]`|false   |named   |true (ByPropertyName)|

#### **Uuid**
Unique identifier of the policy. This parameter is supported with Rest Only.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Archive**
Archive information for the objects in an object store SnapMirror relationship. This property is applicable only for 'async' policies with 'create_snapshot_on_source' set to 'false'. To create object use New-Object DataONTAP.C.Types.SnapmirrorPolicyInfo.Archive. This parameter is supported with Rest Only.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Archive]`|false   |named   |true (ByPropertyName)|

#### **CreateSnapshotOnSource**
Specifies whether a new Snapshot copy should be created on the source at the beginning of an update or resync operation. This is applicable only to async policies. Property can only be set to 'false'. This parameter is supported with Rest Only.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[Boolean?]`|false   |named   |true (ByPropertyName)|

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
API: snapmirror-policy-create
Family: vserver

---

### Syntax
```PowerShell
New-NcSnapmirrorPolicy [-Name] <String> [-Tries <Int32>] [-UnlimitedTries] [-TransferPriority <String>] [-Restart <String>] [-IgnoreAccessTime] [-Comment <String>] [-Type <String>] 
```
```PowerShell
[-EnableNetworkCompression] [-WindowSizeForTdpMirror <String>] [-Owner <String>] [-SnapmirrorLabel <String[]>] [-Keep <String[]>] [-Preserve <Boolean[]>] [-Warn <Int64[]>] [-Schedule 
```
```PowerShell
<String[]>] [-Prefix <String[]>] [-DiscardConfigs <String[]>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
