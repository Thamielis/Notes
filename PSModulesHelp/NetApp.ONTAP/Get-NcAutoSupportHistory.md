Get-NcAutoSupportHistory
------------------------

### Synopsis
Get the history records for the last 50 AutoSupport messages.

---

### Description

Get the history records for the last 50 AutoSupport messages.

---

### Related Links
* [Invoke-NcAutoSupportHistoryRetransmit](Invoke-NcAutoSupportHistoryRetransmit)

---

### Examples
> Example 1

```PowerShell
Get-NcAutoSupportHistory fas3070cluster01-01
Get the AutoSupport history for node fas3070cluster01-01.

NcController                       : 10.61.172.155
AttemptCount                       : 1
Destination                        : noteto
LastModificationTimestamp          : 1330734608
LastModificationTimestampDT        : 3/3/2012 12:30:08 AM
NodeName                           : fas3070cluster01-01
SeqNum                             : 720
Status                             : ignore
Subject                            : PERFORMANCE DATA
Trigger                            : callhome.performance.data
Uri                                :
AttemptCountSpecified              : True
LastModificationTimestampSpecified : True
SeqNumSpecified                    : True

NcController                       : 10.61.172.155
AttemptCount                       : 1
Destination                        : http
LastModificationTimestamp          : 1330734610
LastModificationTimestampDT        : 3/3/2012 12:30:10 AM
NodeName                           : fas3070cluster01-01
SeqNum                             : 720
Status                             : sent_successful
Subject                            : PERFORMANCE DATA
Trigger                            : callhome.performance.data
Uri                                : testbed.corp.netapp.com/put/AsupPut
AttemptCountSpecified              : True
LastModificationTimestampSpecified : True
SeqNumSpecified                    : True

NcController                       : 10.61.172.155
AttemptCount                       : 1
Destination                        : smtp
LastModificationTimestamp          : 1330734608
LastModificationTimestampDT        : 3/3/2012 12:30:08 AM
NodeName                           : fas3070cluster01-01
SeqNum                             : 720
Status                             : ignore
Subject                            : PERFORMANCE DATA
Trigger                            : callhome.performance.data
Uri                                :
AttemptCountSpecified              : True
LastModificationTimestampSpecified : True
SeqNumSpecified                    : True

```

---

### Parameters
#### **Node**
The name of the controller where the AutoSupport message was previously generated.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName|

#### **Sequence**
The AutoSupport message sequence number.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |2       |true (ByPropertyName)|SeqNum |

#### **Destination**
The transport protocol for this AutoSupport message's destination.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Trigger**
The name of the EMS event that triggered this AutoSupport message.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Status**
The delivery status for this AutoSupport message.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a AutosupportHistoryInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcAutoSupportHistory -Template" to get the initially empty AutosupportHistoryInfo object.  If not specified, all data is returned for each object.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[AutosupportHistoryInfo]`|false   |named   |false        |

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
Specify to get an empty AutosupportHistoryInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a AutosupportHistoryInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcAutoSupportHistory -Template" to get the initially empty AutosupportHistoryInfo object.

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[AutosupportHistoryInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Autosupport.AutosupportHistoryInfo

---

### Notes
Category: autosupport
API: autosupport-history-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcAutoSupportHistory [[-Node] <String[]>] [[-Sequence] <String[]>] [[-Destination] <String[]>] [-Trigger <String[]>] [-Status <String[]>] [-Attributes <AutosupportHistoryInfo>] 
```
```PowerShell
[-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAutoSupportHistory -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAutoSupportHistory -Query <AutosupportHistoryInfo> [-Attributes <AutosupportHistoryInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
