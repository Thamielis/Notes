Start-NcLunMove
---------------

### Synopsis
Starts a LUN move operation to move one or more LUNs from one  volume to another within a Vserver.

---

### Description

Starts a LUN move operation to move one or more LUNs from one  volume to another within a Vserver. The destination volume can   be located on the same node as the source volume or on a  different node.

---

### Related Links
* [Stop-NcLunMove](Stop-NcLunMove)

* [Get-NcLunMove](Get-NcLunMove)

* [Suspend-NcLunMove](Suspend-NcLunMove)

---

### Examples
> Example 1

Start-NcLunMove /vol/move_test/lun0 /vol/san_vol/lun0
Move lun0 from move_test to san_vol volume.

SourcePath           DestinationPath      JobStatus  Progress   LunIn JobUUid
                                                     Percentage   dex
----------           ---------------      ---------  ---------- ----- -------
/vol/move_test/lun0  /vol/san_vol/lun0    allocat...       100%     0 273e04fc-5a2d-4dfc-9239-a9b858ee7286

> Example 2

Start-NcLunMove /vol/move_test/lun0,/vol/move_test/lun1 /vol/move_test_alt/lun0,/vol/move_test_alt/lun1
From lun0 and lun1 from volume move_test to volume move_test_alt

SourcePath           DestinationPath      JobStatus  Progress   LunIn JobUUid
                                                     Percentage   dex
----------           ---------------      ---------  ---------- ----- -------
/vol/move_test/lun0  /vol/move_test_al... allocat...       100%     0 ea869075-a659-449f-aa63-263a7c08870f
/vol/move_test/lun1  /vol/move_test_al... allocat...       100%     1 ea869075-a659-449f-aa63-263a7c08870f

---

### Parameters
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

#### **Source**
A String array where each element is the original path of a lun to be moved

|Type        |Required|Position|PipelineInput        |Aliases   |
|------------|--------|--------|---------------------|----------|
|`[String[]]`|true    |1       |true (ByPropertyName)|SourcePath|

#### **Destination**
A String array where each element is the destination path of a lun to be moved. The destination paths must correspond with the source paths.

|Type        |Required|Position|PipelineInput|Aliases        |
|------------|--------|--------|-------------|---------------|
|`[String[]]`|true    |2       |false        |DestinationPath|

#### **PromoteLate**
Specify in order to ensure new lun is not visible till the entire lun is fully framed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **MaxThroughput**
Specifies the maximum amount of data that can be transferred per second in support of this operation. 
Default: zero, indicating no throttling.
Note: Specified value will be rounded up to the nearest megabyte

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ReferenceLun**
Data from all other luns to be moved are transferred as difference from this one; may save bandwidth

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

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
LUNs created from files cannot be moved.

Category: lun
API: lun-move-start
Family: vserver

---

### Syntax
```PowerShell
Start-NcLunMove [-VserverContext <String>] [-Controller <NcController[]>] [-Source] <String[]> [-Destination] <String[]> [-PromoteLate] [-MaxThroughput <String>] [-ReferenceLun <String>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
