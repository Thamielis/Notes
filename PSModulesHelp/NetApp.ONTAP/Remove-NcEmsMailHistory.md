Remove-NcEmsMailHistory
-----------------------

### Synopsis
Delete EMS mail history entries.

---

### Description

Delete EMS mail history entries.

---

### Related Links
* [Get-NcEmsMailHistory](Get-NcEmsMailHistory)

---

### Examples
> Example 1

```PowerShell
Remove-NcEmsMailHistory -Node fas3070cluster01-01 -SequenceNumber 1
Remove the mail history entry with sequence number 1 from node fas3070cluster01-01.
```
> Example 2

```PowerShell
$q = Get-NcEmsMailHistory -Template
$q.MessageName = "app.log.info"
Remove-NcEmsMailHistory -Query $q
Remove all the EMS mail history entries for the given message name.

SuccessCount : 1
FailureCount : 0
SuccessList  : {DataONTAP.C.Types.Ems.EmsMailHistoryInfo}
FailureList  : {}

```

---

### Parameters
#### **Node**
Node emitting the EMS message.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **SequenceNumber**
The message sequence number.

|Type     |Required|Position|PipelineInput        |Aliases|
|---------|--------|--------|---------------------|-------|
|`[Int64]`|true    |2       |true (ByPropertyName)|SeqNum |

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

#### **Query**
A EmsMailHistoryInfo object with various fields set to indicate which EMS mail history entries to delete.  Other fields should remain set to null.  Use "Get-NcEmsMailHistory -Template" to get the initially empty EmsMailHistoryInfo object.

|Type                  |Required|Position|PipelineInput        |
|----------------------|--------|--------|---------------------|
|`[EmsMailHistoryInfo]`|true    |named   |true (ByPropertyName)|

#### **ContinueOnFailure**
This input element is useful when multiple objects match a given query.  If set to true, the API will continue removing the next matching object even when removal of a previous object fails.  If set to false, the API will return on the first failure.  Default: false.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MaxFailureCount**
When allowing failures, then this input element may be provided to limit the number of failed remove operations before the server gives up and returns.  If set, the cmdlet will continue removing the next matching object even when the removal of a previous matching object fails, and do so until the total number of objects failed to be removed reaches the maximum specified.  If set to the maximum or not provided, then there will be no limit on the number of failed remove operations.  Only applicable if ContinueOnFailure is specified.  Default: 2^32-1

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: ems
API: ems-mail-history-destroy-iter
Family: cluster

---

### Syntax
```PowerShell
Remove-NcEmsMailHistory [-Node] <String> [-SequenceNumber] <Int64> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcEmsMailHistory -Query <EmsMailHistoryInfo> [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
