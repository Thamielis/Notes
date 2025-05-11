Get-NcStorageShelfFirmwareUpdateInfo
------------------------------------

### Synopsis
Storage shelf firmware update status records.

---

### Description

Storage shelf firmware update status records.

---

### Related Links
* [Start-NcStorageShelfFirmwareUpdate](Start-NcStorageShelfFirmwareUpdate)

---

### Examples
> Example 1

```PowerShell
Get-NcStorageShelfFirmwareUpdateInfo
Get information from all nodes in the cluster

InProgressCount          :
NcController             : 10.238.49.117
Node                     : aparajir-vsim2
UpdateStatus             : idle
InProgressCountSpecified : False

InProgressCount          :
NcController             : 10.238.49.117
Node                     : aparajir-vsim1
UpdateStatus             : idle
InProgressCountSpecified : False

```

---

### Parameters
#### **Node**
Restrict by specifying one or more node name(s) that has alternate control path configured

|Type        |Required|Position|PipelineInput        |Aliases           |
|------------|--------|--------|---------------------|------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|NodeName<br/>Nodes|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[StorageShelfFirmwareUpdateInfo]`|false   |named   |false        |

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

|Type                              |Required|Position|PipelineInput|
|----------------------------------|--------|--------|-------------|
|`[StorageShelfFirmwareUpdateInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.StorageShelf.StorageShelfFirmwareUpdateInfo

---

### Notes
Category: ses
API: storage-shelf-firmware-update-info-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcStorageShelfFirmwareUpdateInfo [[-Node] <String[]>] [-Attributes <StorageShelfFirmwareUpdateInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcStorageShelfFirmwareUpdateInfo -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcStorageShelfFirmwareUpdateInfo -Query <StorageShelfFirmwareUpdateInfo> [-Attributes <StorageShelfFirmwareUpdateInfo>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
