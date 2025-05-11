Set-NcCloneDeletionMinSize
--------------------------

### Synopsis
Required minimum size of the file(s) and lun(s) on the specified  volume to be deleted with clone-delete.

---

### Description

Required minimum size of the file(s) and lun(s) on the specified  volume to be deleted with clone-delete.

---

### Related Links
* [Get-NcCloneDeletion](Get-NcCloneDeletion)

---

### Examples
> Example 1

Set-NcCloneDeletionMinSize -Volume move_test -MinSize 10G
Set minimum required file size for autodeletion on volume move_test to 10GB

Vserver                        Volume                         MinimumSiz Extensions
                                                              e
-------                        ------                         ---------- ----------
pstk_san                       move_test                      1073741... vmdk,vhd,vhdx,vswp,cln,

---

### Parameters
#### **Volume**
The volume name

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **MinSize**
Minimum size of the file(s) to be deleted using the clone-delete.The format to use is: <number>k|m|g|t

|Type      |Required|Position|PipelineInput        |Aliases             |
|----------|--------|--------|---------------------|--------------------|
|`[String]`|true    |2       |true (ByPropertyName)|Size<br/>MinimumSize|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Clone.CloneDeletionInfo

---

### Notes
Category: clone
API: clone-deletion-minimum-size
Family: vserver

---

### Syntax
```PowerShell
Set-NcCloneDeletionMinSize [-Volume] <String> [-MinSize] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
