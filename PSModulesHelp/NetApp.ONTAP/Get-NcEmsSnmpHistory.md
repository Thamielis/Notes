Get-NcEmsSnmpHistory
--------------------

### Synopsis
Get EMS SNMP history.

---

### Description

Get EMS SNMP history.

---

### Related Links
* [Remove-NcEmsSnmpHistory](Remove-NcEmsSnmpHistory)

---

### Examples
> Example 1

Get-NcEmsSnmpHistory -SequenceNumber 1
Get EMS SNMP messages with a sequence number of 1.

DropsSincePreviousTime          :
Message                         : app.log.info
MessageName                     : app.log.info
Node                            : fas3070cluster01-01
PreviousTime                    :
PreviousTimeDT                  :
SeqNum                          : 1
SnmpAddress                     : {10.61.169.73:public}
Time                            : 1333129342
TimeDT                          : 3/30/2012 1:42:22 PM

> Example 2

$q = Get-NcEmsSnmpHistory -Template
$q.SnmpAddress = "10.61.169.73*"
Get-NcEmsSnmpHistory -Query $q
Get the EMS SNMP messages that match the given query.

DropsSincePreviousTime          :
Message                         : app.log.info
MessageName                     : app.log.info
Node                            : fas3070cluster01-01
PreviousTime                    :
PreviousTimeDT                  :
SeqNum                          : 1
SnmpAddress                     : {10.61.169.73:public}
Time                            : 1333129342
TimeDT                          : 3/30/2012 1:42:22 PM

---

### Parameters
#### **Node**
Node emitting the EMS message.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **SequenceNumber**
The message sequence number.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |2       |true (ByPropertyName)|SeqNum |

#### **MessageName**
The emitted message's name.  Data ONTAP wildcards are permitted.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an EmsSnmpHistoryInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcEmsSnmpHistory -Template" to get the initially empty EmsSnmpHistoryInfo object.  If not specified, all data is returned for each object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[EmsSnmpHistoryInfo]`|false   |named   |false        |

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
Specify to get an empty EmsSnmpHistoryInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a EmsSnmpHistoryInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcEmsSnmpHistory -Template" to get the initially empty EmsSnmpHistoryInfo object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[EmsSnmpHistoryInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ems.EmsSnmpHistoryInfo

---

### Notes
Category: ems
API: ems-snmp-history-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcEmsSnmpHistory [[-Node] <String[]>] [[-SequenceNumber] <String[]>] [[-MessageName] <String[]>] [-Attributes <EmsSnmpHistoryInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcEmsSnmpHistory -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcEmsSnmpHistory -Query <EmsSnmpHistoryInfo> [-Attributes <EmsSnmpHistoryInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
