Get-NcLunCopy
-------------

### Synopsis
Get details of lun-copy jobs on the controller.

---

### Description

Get details of lun-copy jobs on the controller. Job details are preserved on the controller up to 120s after the end of a job.

---

### Related Links
* [Start-NcLunCopy](Start-NcLunCopy)

* [Suspend-NcLunCopy](Suspend-NcLunCopy)

* [Resume-NcLunCopy](Resume-NcLunCopy)

* [Set-NcLunCopyMaxThroughput](Set-NcLunCopyMaxThroughput)

* [Stop-NcLunCopy](Stop-NcLunCopy)

---

### Examples
> Example 1

Get-NcLunCopy
Get all lun copy operations' information

SourcePath           DestinationPath      JobStatus       Progress   LunIn JobUUid
                                                          Percentage   dex
----------           ---------------      ---------       ---------- ----- -------
/vol/move_test_al... /vol/move_test/lu... paused_admin            0%     0 2a9cb2a0-689f-4fe0-a868-f5a25fe5f951
/vol/move_test_al... /vol/move_test/lu... paused_admin            0%     0 321e9221-7707-4854-8ef7-c12a90a39617
/vol/move_test_al... /vol/move_test/lu... paused_admin            0%     0 ffff8c31-408d-4e42-807f-cd45424871bf
/vol/move_test_al... /vol/move_test/lu... complete              100%     1 321e9221-7707-4854-8ef7-c12a90a39617

> Example 2

$obj = Get-NcLunCopy -Template
Query for all paused jobs, using a template

PS > $obj.JobStatus = "paused_admin"
PS > Get-NcLunCopy -Query $obj

SourcePath           DestinationPath      JobStatus       Progress   LunIn JobUUid
                                                          Percentage   dex
----------           ---------------      ---------       ---------- ----- -------
/vol/move_test_al... /vol/move_test/lu... paused_admin            0%     0 2a9cb2a0-689f-4fe0-a868-f5a25fe5f951
/vol/move_test_al... /vol/move_test/lu... paused_admin            0%     0 321e9221-7707-4854-8ef7-c12a90a39617
/vol/move_test_al... /vol/move_test/lu... paused_admin            0%     0 ffff8c31-408d-4e42-807f-cd45424871bf

---

### Parameters
#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[LunCopyInfo]`|false   |named   |false        |

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
Specifies the universal unique ID(s) (UUID) of the job(s) that started the copy operation(s) about which information needs to be retrieved.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|UUid   |

#### **LunIndex**
Specifies an additional unique element identifying one LUN among many that could be possibly copied as part of a job.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[UInt64[]]`|false   |2       |true (ByPropertyName)|

#### **DestinationVserver**
Restrict results to lun copy operations where destination luns are housed in a particular vserver

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |true (ByPropertyName)|VServer|

#### **SourceVserver**
Restrict results to lun copy operations where source is a particular vserver

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **DestinationPath**
Restrict results to one or more lun copy operations by specifying destination lun path.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **SourcePath**
Restrict results to one or more lun copy operations by specifying source lun path.

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
Can be used to obtain an empty query element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[LunCopyInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunCopyInfo

---

### Notes
Category: lun
API: lun-copy-get-iter
Family: cluster, vserver

---

### Syntax
```PowerShell
Get-NcLunCopy [-Attributes <LunCopyInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [[-JobUuid] <String[]>] [[-LunIndex] <UInt64[]>] [-DestinationVserver <String[]>] 
```
```PowerShell
[-SourceVserver <String[]>] [-DestinationPath <String[]>] [-SourcePath <String[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLunCopy -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLunCopy -Query <LunCopyInfo> [-Attributes <LunCopyInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
