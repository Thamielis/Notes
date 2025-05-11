Update-NcStorageShelfAcpFirmware
--------------------------------

### Synopsis
Start shelf firmware download process to update firmware on disk shelves. This operation is asynchronous, and therefore returns no errors that might occur during the download process. This operation will only update firmware on shelves that do not have the latest firmware revision.

---

### Description

Start shelf firmware download process to update firmware on disk shelves. This operation is asynchronous, and therefore returns no errors that might occur during the download process. This operation will only update firmware on shelves that do not have the latest firmware revision.

---

### Examples
> Example 1

```PowerShell
PS C:\PSTK\PSTK_StorageShelf\depot\prod\diapason\main\NcCmdlet\bin\Debug> Update-NcStorageShelfAcpFirmware -Node sapanj-vsim3
Start shelf firmware download process to update firmware on disk shelves for node sapanj-vsim3.
```

---

### Parameters
#### **Module**
The module name. Example: 1.10.A

|Type      |Required|Position|PipelineInput        |Aliases   |
|----------|--------|--------|---------------------|----------|
|`[String]`|true    |named   |true (ByPropertyName)|ModuleName|

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

#### **Node**
The node that has alternate control path configured

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |named   |true (ByPropertyName)|NodeName|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: ses
API: storage-shelf-acp-firmware-update
Family: cluster

---

### Syntax
```PowerShell
Update-NcStorageShelfAcpFirmware -Module <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Update-NcStorageShelfAcpFirmware -Node <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
