Get-NcCloneToken
----------------

### Synopsis
Get information about the reserved token

---

### Description

Get information about the reserved token

---

### Related Links
* [New-NcCloneToken](New-NcCloneToken)

* [Remove-NcCloneToken](Remove-NcCloneToken)

* [Set-NcCloneTokenExpiry](Set-NcCloneTokenExpiry)

---

### Examples
> Example 1

```PowerShell
Get-NcCloneToken aparajir-vvsim-01 8559dda1-d884-436a-8b8f-e117fc18d071
Get details of token 8559dda1-d884-436a-8b8f-e117fc18d071

NcController                          : 10.238.48.40
Node                                  : aparajir-vvsim-01
ReservationDurationLimit              : 300
ReservationDurationRemaining          : 256
ReserveSize                           : 4096
TokenUuid                             : 8559dda1-d884-436a-8b8f-e117fc18d071
ReservationDurationLimitSpecified     : True
ReservationDurationRemainingSpecified : True

```

---

### Parameters
#### **Node**
Node name on which split token has been created.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **TokenUuid**
Token UUID for which the split load is reserved.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide a CloneTokenInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcCloneToken -Template" to get the initially empty CloneTokenInfo object.  If not specified, all data is returned for each object.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[CloneTokenInfo]`|false   |named   |false        |

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

#### **Query**
For advanced queries, provide a object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.

|Type              |Required|Position|PipelineInput|
|------------------|--------|--------|-------------|
|`[CloneTokenInfo]`|true    |2       |false        |

#### **Template**
Specify to get an empty object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Clone.CloneTokenInfo

---

### Notes
Category: clone
API: clone-token-get
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcCloneToken [-Node] <String> [[-TokenUuid] <String>] [-Attributes <CloneTokenInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCloneToken [-Node] <String> [-Query] <CloneTokenInfo> [-Attributes <CloneTokenInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcCloneToken -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
