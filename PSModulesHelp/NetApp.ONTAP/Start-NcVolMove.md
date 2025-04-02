Start-NcVolMove
---------------

### Synopsis
Moves a flexvol to any eligible aggregate in the cluster.

---

### Description

Moves a flexvol to any eligible aggregate in the cluster.  The list of eligible aggregates can be obtained using Get-NcVolMoveTargetAggr.  This API will start the move.  It will run a series of checks to determine if the volume can be moved.  If any of the checks results in an error or warning, the API will return with an error. The user has to take the necessary corrective action before restarting the move.  If all the checks pass, the API will return a success.  If ValidateOnly is not specified, the destination volume will be created and the move will start.  By default, the move will cutover automatically.  A background job will be created and the API returns immediately with the job ID information. The status of the move job can be obtained by using Get-NcJob.

---

### Related Links
* [Invoke-NcVolMoveCutover](Invoke-NcVolMoveCutover)

* [Get-NcVolMoveTargetAggr](Get-NcVolMoveTargetAggr)

---

### Examples
> Example 1

```PowerShell
Start-NcVolMove bigvol aggr1 -Vserver vserver1
Move volume 'bigvol' to aggregate 'aggr1'.

NcController : 10.61.172.155
ErrorCode    :
ErrorMessage :
JobId        : 1369
JobVserver   : vserver1
Status       : in_progress

```

---

### Parameters
#### **Name**
Name of the volume that must be moved.

|Type      |Required|Position|PipelineInput        |Aliases                                     |
|----------|--------|--------|---------------------|--------------------------------------------|
|`[String]`|true    |1       |true (ByPropertyName)|Volume<br/>SourceVolume<br/>SourceVolumeName|

#### **DestinationAggregate**
Name of the destination aggregate.

|Type      |Required|Position|PipelineInput|Aliases                               |
|----------|--------|--------|-------------|--------------------------------------|
|`[String]`|true    |2       |false        |Destination<br/>Aggregate<br/>DestAggr|

#### **Vserver**
The name of the vserver that contains the volume to be moved.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **CutoverWindow**
Time interval to complete cutover in seconds.  Default value is 45 seconds.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **CutoverAttempts**
Number of cutover attempts.  Default value is 3.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **CutoverAction**
Specifies the action to be taken for cutover. Possible values are "abort_on_failure", "defer_on_failure", "force" and "wait". Default is "defer_on_failure". If "abort_on_failure" action is specified, the job will try cutover till the cutover attempts are exhausted, and cleanup if it fails to cutover.  If "defer_on_failure" action is specified, the job will try cutover till the cutover attempts are exhausted and move into "cutover deferred" state if it fails to cutover.  This is the default option.  The volume move job waits for intervention to restart the cutover process again.  If "force" action is specified, the job will try cutover till the cutover attempts are exhausted and force the cutover at the expense of disrupting the clients.  If "wait" action is specified, when the job hits the decision point, it will not go into cutover automatically, instead it will wait for the user to issue Invoke-NcVolMoveCutover as the signal to try the cutover.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ValidateOnly**
Run pre-checks for the move, return all the errors and warning messages encountered during the checks.  The move will not be triggered.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **EncryptDestination**
Specify to encrypt destination volume.
This parameter is available in ONTAP 9.1 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **DecryptDestination**
Specify to decrypt destination volume.
This parameter is available in ONTAP 9.1 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **GenerateDestinationKey**
To generate new encryption key for destination volume.
This parameter is available in ONTAP 9.1 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **TieringPolicy**
The tiering policy that is to be associated with the volume.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **AllowMixedAggrTypes**
To allow FlexGroup volume constituents move from a FabricPool to a non-FabricPool, or vice versa. This option is not applicable for Flex Volume move.
This parameter is available in ONTAP 9.4 and later.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.PowerShell.SDK.Cmdlets.JobStartResult

---

### Notes
Category: volume
API: volume-move-start
Family: cluster

---

### Syntax
```PowerShell
Start-NcVolMove [-Name] <String> [-DestinationAggregate] <String> [-Vserver <String>] [-CutoverWindow <Int32>] [-CutoverAttempts <Int32>] [-CutoverAction <String>] [-ValidateOnly] 
```
```PowerShell
[-EncryptDestination] [-DecryptDestination] [-GenerateDestinationKey] [-TieringPolicy <String>] [-AllowMixedAggrTypes] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
