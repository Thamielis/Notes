Stop-NcVolMove
--------------

### Synopsis
Stop a running volume move operation.

---

### Description

Stop a running volume move operation. This is an asynchrous API call and it does not wait for the abort to finish before returning. Get-NcVolMove can be used to monitor the progress of the abort and get the status. Unlike Stop-NcJob, this API makes it possible to stop a move job by the vserver and volume name. If the specified volume has completed the volume move operation, an error is returned.

---

### Related Links
* [Get-NcVolMove](Get-NcVolMove)

---

### Examples
> Example 1

```PowerShell
Stop-NcVolMove -Name vol1 -Vserver joule
Stop the volume move operation of vol1.

ActualCompletionTimestamp            :
ActualDuration                       : 19
BytesRemaining                       :
BytesSent                            : 139264
CompletionCode                       :
CompletionStatus                     :
CutoverAction                        : defer_on_failure
CutoverAttemptedCount                : 1
CutoverAttempts                      : 3
CutoverHardDeferredCount             : 0
CutoversSoftDeferredCount            : 0
CutoverTriggerTimestamp              :
CutoverWindow                        : 45
DestinationAggregate                 : aggr2
DestinationNode                      : tesla-01
Details                              : Volume move job cleaning up.
                                       Error: Volume move job stopped by user "admin".
EstimatedCompletionTime              :
EstimatedRemainingDuration           :
ExecutionProgress                    : Volume move job cleaning up.
InternalState                        : CleanupState
JobId                                : 29
JobUuid                              : 0ccc0fb4-ca96-11e1-a2e1-123478563412
LastCutoverTriggerTimestamp          : 1341928176
ManagingNode                         : tesla-01
NcController                         : 192.168.182.119
PercentComplete                      :
Phase                                : cleaning_up
PriorIssues                          : Volume move job stopped by user "admin".
ReplicationThroughput                : 66KB/s
SourceAggregate                      : aggr1
SourceNode                           : tesla-01
StartTimestamp                       : 1341928161
State                                : warning
Volume                               : vol1
Vserver                              : joule

```

---

### Parameters
#### **Name**
The volume that is part of a completed or running volume move operation.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Volume |

#### **Vserver**
The Vserver name.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Volume.VolumeMoveInfo

---

### Notes
Category: volume
API: volume-move-trigger-abort
Family: cluster

---

### Syntax
```PowerShell
Stop-NcVolMove [-Name] <String> [-Vserver] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
