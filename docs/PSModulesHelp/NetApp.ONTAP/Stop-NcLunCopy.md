Stop-NcLunCopy
--------------

### Synopsis
Cancels an ongoing LUN copy operation prior to creation of the  new LUN.

---

### Description

Cancels an ongoing LUN copy operation prior to creation of the  new LUN. This operation will fail if the LUN already exists at the destination path; in that case, use the Remove-NcLun cmdlet to  delete the LUN at the destination path.

---

### Related Links
* [Start-NcLunCopy](Start-NcLunCopy)

* [Get-NcLunCopy](Get-NcLunCopy)

---

### Examples
> Example 1

Start-NcLunCopy /vol/move_test/lun0 /vol/san_vol/lun0 | Stop-NcLunCopy
Cancel a lun copy job, by piping from a Start-NcLunCopy

Are you sure you want to stop lun copy operation e0a315df-4ec3-4320-bc3a-7f8b7c4505c6.
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

SourcePath           DestinationPath      JobStatus  Progress   LunIn JobUUid
                                                     Percentage   dex
----------           ---------------      ---------  ---------- ----- -------
/vol/move_test/lun0  /vol/san_vol/lun0    destroyed           %     2 8bfd7c71-6868-4275-86cc-926eb17d4f43

---

### Parameters
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
API: lun-copy-cancel
Family: cluster, vserver

---

### Syntax
```PowerShell
Stop-NcLunCopy [-Controller <NcController[]>] [-JobUuid] <String> [-LunIndex <Int64>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
