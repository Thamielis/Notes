Get-NcLunMove
-------------

### Synopsis
Get details of lun-move jobs on the controller.

---

### Description

Get details of lun-move jobs on the controller. Job details are preserved on the controller up to 120s after the end of a job.

---

### Related Links
* [Start-NcLunMove](Start-NcLunMove)

* [Stop-NcLunMove](Stop-NcLunMove)

* [Suspend-NcLunMove](Suspend-NcLunMove)

* [Resume-NcLunMove](Resume-NcLunMove)

* [Set-NcLunMoveMaxThroughput](Set-NcLunMoveMaxThroughput)

---

### Examples
> Example 1

Get-NcLunMove
Get details of all lun move operations on the controller

SourcePath           DestinationPath      JobStatus  Progress   LunIn JobUUid
                                                     Percentage   dex
----------           ---------------      ---------  ---------- ----- -------
/vol/move_test/lun0  /vol/san_vol/lun0    paused_...         0%     0 273e04fc-5a2d-4dfc-9239-a9b858ee7286

> Example 2

Get-NcLunMove -DestinationPath /vol/alt_vol/lun1,/vol/alt_vol/lun2
Filter results using a parameter

SourcePath           DestinationPath      JobStatus  Progress   LunIn JobUUid
                                                     Percentage   dex
----------           ---------------      ---------  ---------- ----- -------
/vol/move_test/lun0  /vol/alt_vol/lun2    destroyed           %     0 8548d175-2964-4999-a12c-35406375c34a
/vol/move_test/lun0  /vol/alt_vol/lun1    destroyed           %     0 e577f4b5-f8b0-4cdd-a79d-7e9dfeb5a84e

> Example 3

$res = Get-NcLunMove -Template; $res.JobStatus = "paused_admin"; 
Get-NcLunMove -Query $res
Get lun move operations using templates and queries.

SourcePath           DestinationPath      JobStatus  Progress   LunIn JobUUid
                                                     Percentage   dex
----------           ---------------      ---------  ---------- ----- -------
/vol/move_test/lun0  /vol/san_vol/lun0    paused_...         0%     0 273e04fc-5a2d-4dfc-9239-a9b858ee7286

---

### Parameters
#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[LunMoveInfo]`|false   |named   |false        |

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **JobUuid**
Specifies the universal unique ID(s) (UUID) of the job(s) that started the move operation(s) about which information needs to be retrieved.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|UUid   |

#### **LunIndex**
Specifies an additional unique element identifying one LUN among many that could be possibly move as part of a job.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[UInt64[]]`|false   |2       |true (ByPropertyName)|

#### **Vserver**
Restrict results to one or more vservers

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |3       |true (ByPropertyName)|

#### **DestinationPath**
Restrict results to one or more lun move operations by specifying destination lun path.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **SourcePath**
Restrict results to one or more lun move operations by specifying source lun path.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

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
Can be used in Powershell 2 to obtain an empty query element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[LunMoveInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunMoveInfo

---

### Notes
Category: lun
API: lun-move-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcLunMove [-Attributes <LunMoveInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [[-JobUuid] <String[]>] [[-LunIndex] <UInt64[]>] [[-Vserver] <String[]>] [-DestinationPath 
```
```PowerShell
<String[]>] [-SourcePath <String[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLunMove -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLunMove -Query <LunMoveInfo> [-Attributes <LunMoveInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
