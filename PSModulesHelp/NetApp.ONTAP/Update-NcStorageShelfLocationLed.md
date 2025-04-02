Update-NcStorageShelfLocationLed
--------------------------------

### Synopsis
Modify the state of the Location LED of one or more shelves/

---

### Description

Modify the state of the Location LED of one or more shelves

---

### Related Links
* [Get-NcStorageShelfLocationLed](Get-NcStorageShelfLocationLed)

---

### Examples
> Example 1

$attr = Update-NcStorageShelfLocationLed -Template
$attr.LedStatus = "on"
Update-NcStorageShelfLocationLed 1.1 -Attributes $attr
Change the location LED's state for one particular storage-shelf.

NcController : 10.225.183.84
SuccessCount : 0
FailureCount : 1
SuccessList  : {}
FailureList  : {DataONTAP.C.Types.StorageShelf.StorageShelfLocationLedInfo}

---

### Parameters
#### **ShelfName**
Specify to restrict modifications by ShelfName

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|true    |1       |true (ByPropertyName)|

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **ContinueOnFailure**
This input element is useful when multiple objects match a given query.  If set to true, the API will continue modifying the next matching object even when modification of a previous object fails.  If set to false, the API will return on the first failure.  Default: false.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

#### **MaxFailureCount**
When allowing failures, then this input element may be provided to limit the number of failed modify operations before the server gives up and returns.  If set, the cmdlet will continue modifying the next matching object even when the modification of a previous matching object fails, and do so until the total number of objects failed to be modified reaches the maximum specified.  If set to the maximum or not provided, then there will be no limit on the number of failed modify operations.  Only applicable if ContinueOnFailure is specified.  Default: 2^32-1

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                           |Required|Position|PipelineInput        |Aliases          |
|-------------------------------|--------|--------|---------------------|-----------------|
|`[StorageShelfLocationLedInfo]`|true    |2       |true (ByPropertyName)|DesiredAttributes|

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
Specify to query using a object with restricting fields set.

|Type                           |Required|Position|PipelineInput        |
|-------------------------------|--------|--------|---------------------|
|`[StorageShelfLocationLedInfo]`|true    |1       |true (ByPropertyName)|

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.PowerShell.SDK.Cmdlets.TableModifyResult

---

### Notes
Category: ses
API: storage-shelf-location-led-modify-iter
Family: cluster

---

### Syntax
```PowerShell
Update-NcStorageShelfLocationLed [-ShelfName] <String[]> [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Attributes] <StorageShelfLocationLedInfo> 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Update-NcStorageShelfLocationLed [-Query] <StorageShelfLocationLedInfo> [-Controller <NcController[]>] [-ContinueOnFailure] [-MaxFailureCount <Int32>] [-Attributes] 
```
```PowerShell
<StorageShelfLocationLedInfo> [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Update-NcStorageShelfLocationLed [-Template] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
