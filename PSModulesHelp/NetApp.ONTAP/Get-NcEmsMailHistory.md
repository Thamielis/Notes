Get-NcEmsMailHistory
--------------------

### Synopsis
Get EMS mail history.

---

### Description

Get EMS mail history.

---

### Related Links
* [Remove-NcEmsMailHistory](Remove-NcEmsMailHistory)

---

### Examples
> Example 1

```PowerShell
Get-NcEmsMailHistory -MessageName app.log.info
Get the mail history for the EMS message app.log.info.

DropsSincePreviousTime          :
MailAddress                     : {admin@localhost}
Message                         : app.log.info: test
MessageName                     : app.log.info
Node                            : fas3070cluster01-01
PreviousTime                    :
PreviousTimeDT                  :
SeqNum                          : 1
Time                            : 1333127534
TimeDT                          : 3/30/2012 1:12:14 PM

```
> Example 2

```PowerShell
$q = Get-NcEmsMailHistory -Template
$q.MailAddress = "admin@localhost"
Get-NcEmsMailHistory -Query $q
Get all the EMS mail messages that have been sent to the given address.

DropsSincePreviousTime          :
MailAddress                     : {admin@localhost}
Message                         : app.log.info: test
MessageName                     : app.log.info
Node                            : fas3070cluster01-01
PreviousTime                    :
PreviousTimeDT                  :
SeqNum                          : 1
Time                            : 1333127534
TimeDT                          : 3/30/2012 1:12:14 PM

```

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
For improved scalability in large clusters, provide an EmsMailHistoryInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcEmsMailHistory -Template" to get the initially empty EmsMailHistoryInfo object.  If not specified, all data is returned for each object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[EmsMailHistoryInfo]`|false   |named   |false        |

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
Specify to get an empty EmsMailHistoryInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a EmsMailHistoryInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcEmsMailHistory -Template" to get the initially empty EmsMailHistoryInfo object.

|Type                  |Required|Position|PipelineInput|
|----------------------|--------|--------|-------------|
|`[EmsMailHistoryInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ems.EmsMailHistoryInfo

---

### Notes
Category: ems
API: ems-mail-history-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcEmsMailHistory [[-Node] <String[]>] [[-SequenceNumber] <String[]>] [[-MessageName] <String[]>] [-Attributes <EmsMailHistoryInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcEmsMailHistory -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcEmsMailHistory -Query <EmsMailHistoryInfo> [-Attributes <EmsMailHistoryInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
