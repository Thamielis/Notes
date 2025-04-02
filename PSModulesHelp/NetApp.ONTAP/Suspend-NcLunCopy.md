Suspend-NcLunCopy
-----------------

### Synopsis
Pauses an ongoing LUN copy operation.

---

### Description

Pauses an ongoing LUN copy operation. Use the Resume-NcLunCopy cmdlet to resume the copy operation.

---

### Related Links
* [Get-NcLunCopy](Get-NcLunCopy)

* [Resume-NcLunCopy](Resume-NcLunCopy)

* [Stop-NcLunCopy](Stop-NcLunCopy)

---

### Examples
> Example 1

Suspend-NcLunCopy ffff8c31-408d-4e42-807f-cd45424871bf
Pauses the lun copy operation identified by uuid ffff8c31-408d-4e42-807f-cd45424871bf

SourcePath           DestinationPath      JobStatus       Progress   LunIn JobUUid
                                                          Percentage   dex
----------           ---------------      ---------       ---------- ----- -------
/vol/move_test_al... /vol/move_test/lu... paused_admin            0%     0 ffff8c31-408d-4e42-807f-cd45424871bf

> Example 2

Suspend-NcLunCopy 321e9221-7707-4854-8ef7-c12a90a39617 -LunIndex 0
Suspend only one lun copy operation in a batch job

SourcePath           DestinationPath      JobStatus       Progress   LunIn JobUUid
                                                          Percentage   dex
----------           ---------------      ---------       ---------- ----- -------
/vol/move_test_al... /vol/move_test/lu... paused_admin            0%     0 321e9221-7707-4854-8ef7-c12a90a39617
/vol/move_test_al... /vol/move_test/lu... allocation_map        100%     1 321e9221-7707-4854-8ef7-c12a90a39617

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
Note: Resume changes the JobUuid, so if you want to suspend an operation the after having resumed it before, use the JobUuid returned by the last Resume operation, not the one used to start the operation.

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
API: lun-copy-pause
Family: cluster, vserver

---

### Syntax
```PowerShell
Suspend-NcLunCopy [-LunPath <String[]>] [-Controller <NcController[]>] [-JobUuid] <String> [-LunIndex <Int64>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
