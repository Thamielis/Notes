Resume-NcLunCopy
----------------

### Synopsis
Resume a paused lun copy operation

---

### Description

Resume a paused lun copy operation

---

### Related Links
* [Get-NcLunCopy](Get-NcLunCopy)

* [Suspend-NcLunCopy](Suspend-NcLunCopy)

* [Start-NcLunCopy](Start-NcLunCopy)

---

### Examples
> Example 1

Resume-NcLunCopy ffff8c31-408d-4e42-807f-cd45424871bf
Resume the lun copy operation identified by the job uuid ffff8c31-408d-4e42-807f-cd45424871bf

SourcePath           DestinationPath      JobStatus       Progress   LunIn JobUUid
                                                          Percentage   dex
----------           ---------------      ---------       ---------- ----- -------
/vol/move_test_al... /vol/move_test/lu... data                  100%     0 ffff8c31-408d-4e42-807f-cd45424871bf

---

### Parameters
#### **LunPath**
An array , where each element is the path of one lun. This parameter is supported with Rest only.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **JobUuid**
Specifies the universally unique ID (UUID) of the job that started this copy operation.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|UUid   |

#### **LunIndex**
Specifies an additional unique element identifying one LUN among many that could be possibly copied as part of a job.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |named   |false        |

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunCopyInfo

---

### Notes
Category: lun
API: lun-copy-resume
Family: cluster, vserver

---

### Syntax
```PowerShell
Resume-NcLunCopy [-LunPath <String[]>] [-Controller <NcController[]>] [-JobUuid] <String> [-LunIndex <Int64>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
