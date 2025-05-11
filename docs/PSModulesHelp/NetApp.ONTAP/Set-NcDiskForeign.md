Set-NcDiskForeign
-----------------

### Synopsis
Marks an array lun as a foreign disk

---

### Description

Marks an array lun as a foreign disk

---

### Related Links
* [Clear-NcDiskForeign](Clear-NcDiskForeign)

* [Get-NcDisk](Get-NcDisk)

---

### Examples
> Example 1

Set-NcDiskForeign EMC-1.17
Marks EMC-1.17 as a foreign disk

Name                      Shelf Bay Position     Capacity  RPM  FW    Model             Paths Aggregate
----                      ----- --- --------     --------  ---  --    -----             ----- ---------
EMC-1.17                            present          1 GB       0000  SYMMETRIX           2

---

### Parameters
#### **Name**
The name of the disk to mark as foreign.

|Type      |Required|Position|PipelineInput        |Aliases          |
|----------|--------|--------|---------------------|-----------------|
|`[String]`|true    |1       |true (ByPropertyName)|Disk<br/>DiskName|

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

#### **SerialNumber**
The serial number of the disk to mark as foreign.

|Type      |Required|Position|PipelineInput        |Aliases         |
|----------|--------|--------|---------------------|----------------|
|`[String]`|true    |1       |true (ByPropertyName)|DiskSerialNumber|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.StorageDisk.StorageDiskInfo

---

### Notes
Category: disk
API: storage-disk-modify
Family: cluster

---

### Syntax
```PowerShell
Set-NcDiskForeign [-Name] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcDiskForeign [-SerialNumber] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount 
```
```PowerShell
<Int32>] [<CommonParameters>]
```
