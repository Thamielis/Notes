Invoke-NcAutoSupportPerformanceArchive
--------------------------------------

### Synopsis
Generate and send an AutoSupport message with performance archives.

---

### Description

Generate and send an AutoSupport message with performance archives.

---

### Related Links
* [Get-NcPerfArchiveConfig](Get-NcPerfArchiveConfig)

* [Set-NcPerfArchiveConfig](Set-NcPerfArchiveConfig)

---

### Examples
> Example 1

```PowerShell
Invoke-NcAutoSupportPerformanceArchive -Node f3250-215-73-75-02 -StartDate "12/23/2014 03:00 PM" -Duration 4h
Generate an Autosupport message with the performance archive between 3PM to 7PM of 23rd Decemeber 2014
```
> Example 2

```PowerShell
Invoke-NcAutoSupportPerformanceArchive -Node f3250-215-73-75-02 -StartDate "12/23/2014 03:00 PM" -EndDate "12/23/2014 07:00 PM"
Generate an Autosupport message with the 4 hours of performance archive beginning 3PM on 23rd Decemeber 2014
```

---

### Parameters
#### **Query**
If operating on a specific autosupport, this input element mustspecify all keys. If operating on autosupport objects based on query, this input
element must specify a query.

|Type                     |Required|Position|PipelineInput |
|-------------------------|--------|--------|--------------|
|`[AutosupportConfigInfo]`|false   |named   |true (ByValue)|

#### **NodeName**
The name of the node on which the AutoSupport message will be generated.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Node   |

#### **StartDate**
Start date of files to collect from the performance archive dataset.
Format: MM/dd/YYYY HH:MM:[ss] AM|PM

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|true    |named   |true (ByPropertyName)|Start<br/>StartTime|

#### **Duration**
Duration of the performance archives to collect in the AutoSupport. 
Format: '4h' (4 hours), '40m' (40 minutes), '1252s' (1252 seconds). Maximum duration is 6hours

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |named   |true (ByPropertyName)|

#### **Message**
Text to include as part of the subject of the AutoSupport message

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Uri**
Alternate destination for the AutoSupport.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **CaseNumber**
Support case number to associate with this performance archive file.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Force**
If specified, force generation, even if AutoSupport is disabled in the system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ContinueOnFailure**
This input element is useful when multiple autosupport objects match a given query. If set to true, the API will continue with the next matching autosupport even when the operation fails for the autosupport. If set to false, the API will return on the first failure. Default: false

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MaxFailureCount**
When allowing failures ('continue-on-failure' is set to true),then this input element may be provided to limit the number of failed operations before the server gives up and returns. If set, the API will continue with the next matching autosupport even when the operation on a previous matching autosupport fails, and do so until the total number of objects failed to be operated on reaches the maximum specified. If set to the maximum or not provided, then there will be no limit on the number of failed operations. Only applicable if 'continue-on-failure' is set to true. Default: 2^32-1

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **MaxRecords**
The maximum number of autosupport objects to be operated in this call. Default: 20

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

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

#### **EndDate**
End date of files to collect from the performance archive dataset.
Format: MM/dd/YYYY HH:MM:[ss] AM|PM

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |named   |true (ByPropertyName)|End<br/>EndTime|

#### **Template**
Specify to get an empty AutoSupportPerformanceArchiveInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.PowerShell.SDK.Cmdlets.TableModifyResult

---

### Notes
Category: autosupport
API: autosupport-invoke-performance-archive
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcAutoSupportPerformanceArchive [-Query <AutosupportConfigInfo>] [-NodeName <String[]>] -StartDate <String> -Duration <String> [-Message <String>] [-Uri <String>] [-CaseNumber 
```
```PowerShell
<String>] [-Force] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-MaxRecords <Int32>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Invoke-NcAutoSupportPerformanceArchive [-Query <AutosupportConfigInfo>] [-NodeName <String[]>] -StartDate <String> -EndDate <String> [-Message <String>] [-Uri <String>] [-CaseNumber <String>] 
```
```PowerShell
[-Force] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-MaxRecords <Int32>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Invoke-NcAutoSupportPerformanceArchive -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
