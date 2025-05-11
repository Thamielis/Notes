Suspend-NcLunMove
-----------------

### Synopsis
Pauses an ongoing LUN move operation.

---

### Description

Pauses an ongoing LUN move operation. Use the Resume-NcLunMove cmdlet to resume the move operation.

---

### Related Links
* [Get-NcLunMove](Get-NcLunMove)

* [Resume-NcLunMove](Resume-NcLunMove)

* [Stop-NcLunMove](Stop-NcLunMove)

---

### Examples
> Example 1

Suspend-NcLunMove 273e04fc-5a2d-4dfc-9239-a9b858ee7286
Suspend the lun move operation with the uuid of 273e04fc-5a2d-4dfc-9239-a9b858ee7286

SourcePath           DestinationPath      JobStatus  Progress   LunIn JobUUid
                                                     Percentage   dex
----------           ---------------      ---------  ---------- ----- -------
/vol/move_test/lun0  /vol/san_vol/lun0    paused_...         0%     0 273e04fc-5a2d-4dfc-9239-a9b858ee7286

---

### Parameters
#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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
Specifies the universally unique ID (UUID) of the job that started this move operation. Resume changes the JobUuid, so if you want to suspend an operation the after having resumed it before, use the JobUuid returned by the last Resume operation, not the one used to start the operation.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|UUid   |

#### **LunIndex**
Specifies an additional unique element identifying one LUN among many that could be possibly moved as part of a job.

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
* DataONTAP.C.Types.Lun.LunMoveInfo

---

### Notes
Category: lun
API: lun-move-pause
Family: vserver

---

### Syntax
```PowerShell
Suspend-NcLunMove [-VserverContext <String>] [-LunPath <String[]>] [-Controller <NcController[]>] [-JobUuid] <String> [-LunIndex <Int64>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
