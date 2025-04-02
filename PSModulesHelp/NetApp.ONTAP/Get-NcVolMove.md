Get-NcVolMove
-------------

### Synopsis
Get status of move operation.

---

### Description

Get status of move operation.

---

### Related Links
* [Start-NcVolMove](Start-NcVolMove)

* [Stop-NcVolMove](Stop-NcVolMove)

---

### Examples
> Example 1

```PowerShell
Get-NcVolMove
Get all of the volume move operations.

ActualCompletionTimestamp            :
ActualDuration                       : 4
BytesRemaining                       :
BytesSent                            :
CompletionCode                       :
CompletionStatus                     :
CutoverAction                        : defer_on_failure
CutoverAttemptedCount                : 0
CutoverAttempts                      : 3
CutoverHardDeferredCount             : 0
CutoversSoftDeferredCount            : 0
CutoverTriggerTimestamp              :
CutoverWindow                        : 45
DestinationAggregate                 : aggr2
DestinationNode                      : tesla-01
Details                              : Volume move job in setup
EstimatedCompletionTime              :
EstimatedRemainingDuration           :
ExecutionProgress                    : Volume move job in setup
InternalState                        : Setup
JobId                                : 29
JobUuid                              : 0ccc0fb4-ca96-11e1-a2e1-123478563412
LastCutoverTriggerTimestamp          :
ManagingNode                         : tesla-01
NcController                         : 192.168.182.119
PercentComplete                      :
Phase                                : initializing
PriorIssues                          :
ReplicationThroughput                :
SourceAggregate                      : aggr1
SourceNode                           : tesla-01
StartTimestamp                       : 1341928161
State                                : healthy
Volume                               : vol1
Vserver                              : joule

```
> Example 2

```PowerShell
$q = Get-NcVolMove -Template
$q.Phase = "failed"
Get-NcVolMove -Query $q
Get all of the failed volume move operations.

ActualCompletionTimestamp            : 1341928183
ActualDuration                       : 22
BytesRemaining                       :
BytesSent                            :
CompletionCode                       : 1
CompletionStatus                     : Volume move job stopped by user "admin".
CutoverAction                        : defer_on_failure
CutoverAttemptedCount                : 1
CutoverAttempts                      : 3
CutoverHardDeferredCount             : 0
CutoversSoftDeferredCount            : 0
CutoverTriggerTimestamp              :
CutoverWindow                        : 45
DestinationAggregate                 : aggr2
DestinationNode                      : tesla-01
Details                              : Volume move job stopped by user "admin".
EstimatedCompletionTime              :
EstimatedRemainingDuration           :
ExecutionProgress                    :
InternalState                        :
JobId                                : 29
JobUuid                              : 0ccc0fb4-ca96-11e1-a2e1-123478563412
LastCutoverTriggerTimestamp          : 1341928176
ManagingNode                         : tesla-01
NcController                         : 192.168.182.119
PercentComplete                      :
Phase                                : failed
PriorIssues                          : Volume move job stopped by user "admin".
ReplicationThroughput                : 66KB/s
SourceAggregate                      : aggr1
SourceNode                           : tesla-01
StartTimestamp                       : 1341928161
State                                : failed
Volume                               : vol1
Vserver                              : joule

```

---

### Parameters
#### **Name**
The name of one or more volumes to get.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Volume |

#### **Vserver**
Restrict results to the specified vserver(s).  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|OwningVserver|

#### **Attributes**
For improved scalability in large clusters, provide a VolumeMoveInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcVolMove -Template" to get the initially empty VolumeMoveInfo object.  If not specified, all data is returned for each object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VolumeMoveInfo]`|false   |named   |false        |

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
Specify to get an empty VolumeMoveInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a VolumeMoveInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcVolMove -Template" to get the initially empty VolumeMoveInfo object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[VolumeMoveInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Volume.VolumeMoveInfo

---

### Notes
Category: volume
API: volume-move-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcVolMove [[-Name] <String[]>] [-Vserver <String[]>] [-Attributes <VolumeMoveInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcVolMove -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcVolMove -Query <VolumeMoveInfo> [-Attributes <VolumeMoveInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
