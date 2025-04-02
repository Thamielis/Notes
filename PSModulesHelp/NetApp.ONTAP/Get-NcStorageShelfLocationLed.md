Get-NcStorageShelfLocationLed
-----------------------------

### Synopsis
Get the Location LED status of one or more shelves.

---

### Description

Get the Location LED status of one or more shelves

---

### Related Links
* [Update-NcStorageShelfLocationLed](Update-NcStorageShelfLocationLed)

---

### Examples
> Example 1

```PowerShell
Get-NcStorageShelfLocationLed
Get the location LED status for all storage shelves.

LedStatus        : unsupported
NcController     : 10.225.183.84
ShelfId          : 1
ShelfName        : 1.1
StackId          : 1
ShelfIdSpecified : True
StackIdSpecified : True

LedStatus        : unsupported
NcController     : 10.225.183.84
ShelfId          : 2
ShelfName        : 1.2
StackId          : 1
ShelfIdSpecified : True
StackIdSpecified : True

```

---

### Parameters
#### **ShelfName**
Specify to filter by shelf name

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **LedStatus**
Specify to filter by LED status

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[StorageShelfLocationLedInfo]`|false   |named   |false        |

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

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                           |Required|Position|PipelineInput|
|-------------------------------|--------|--------|-------------|
|`[StorageShelfLocationLedInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.StorageShelf.StorageShelfLocationLedInfo

---

### Notes
Category: ses
API: storage-shelf-location-led-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcStorageShelfLocationLed [[-ShelfName] <String[]>] [[-LedStatus] <String[]>] [-Attributes <StorageShelfLocationLedInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcStorageShelfLocationLed -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcStorageShelfLocationLed -Query <StorageShelfLocationLedInfo> [-Attributes <StorageShelfLocationLedInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
