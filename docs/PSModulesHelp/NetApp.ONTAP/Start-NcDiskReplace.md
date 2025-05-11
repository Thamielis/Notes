Start-NcDiskReplace
-------------------

### Synopsis
Initiate replacing a file system disk with an appropriate spare disk.

---

### Description

Initiate replacing a file system disk with an appropriate spare disk.

---

### Examples
> Example 1

PS C:\PSTK\PSTK_Disk\depot\prod\diapason\main\NcCmdlet\bin\Debug> Start-NcDiskReplace -Disk VMw-1.4 -ReplacementDisk VMw
-1.8 -AllowSameCarrier $false
Starts replacement of disk VMw-1.4 with spare replacement disk VMw-1.8.

---

### Parameters
#### **Disk**
Name of the file system disk to replace.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|DiskName|

#### **ReplacementDisk**
Name of the spare disk to use as a replacement.

|Type      |Required|Position|PipelineInput        |Aliases            |
|----------|--------|--------|---------------------|-------------------|
|`[String]`|true    |2       |true (ByPropertyName)|ReplacementDiskName|

#### **AllowSameCarrier**
Using two disks from one carrier that houses multiple disks in one RAID group is not desirable.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **Force**
Specify to allow replacement-disk to come from the opposite spare pool.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[Switch]`|false   |named   |true (ByPropertyName)|

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
The number of times to retry commands that return with errors that may succeed after a retry.

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
Category: disk
API: disk-replace-start
Family: cluster

---

### Syntax
```PowerShell
Start-NcDiskReplace [-Disk] <String> [-ReplacementDisk] <String> [-AllowSameCarrier <Boolean>] [-Force] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
