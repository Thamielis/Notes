Get-NcFileInodeInfo
-------------------

### Synopsis
Get information about all the files associated with an inode in a volume.

---

### Description

Get information about all the files associated with an inode in a volume.

---

### Related Links
* [Get-NcFile](Get-NcFile)

---

### Examples
> Example 1

Get-NcFileInodeInfo 96 pstk_vol1
Get all files associated with inode 96

FilePath                                       DSID SnapshotName         Snaps                        ParentInodeNumber
                                                                         hotId
--------                                       ---- ------------         -----                        -----------------
/vol/pstk_vol1/dir45/fi2                       1029 -                        0                                      101
/vol/pstk_vol1/fi1                             1029 -                        0                                       64

---

### Parameters
#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[InodeInfo]`|false   |named   |false        |

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

#### **InodeNumber**
The inode number for which information is desired.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int32]`|true    |1       |true (ByPropertyName)|

#### **Volume**
The name of the volume containing the given inode.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |2       |true (ByPropertyName)|

#### **DSID**
The DSID (Data Set IDentifier) of the volume containing the given inode.

|Type     |Required|Position|PipelineInput        |Aliases  |
|---------|--------|--------|---------------------|---------|
|`[Int64]`|false   |named   |true (ByPropertyName)|DataSetID|

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
Used to obtain an empty query element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type         |Required|Position|PipelineInput|
|-------------|--------|--------|-------------|
|`[InodeInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.File.InodeInfo

---

### Notes
Category: file
API: file-inode-info-get-iter
Family: vserver

---

### Syntax
```PowerShell
Get-NcFileInodeInfo [-Attributes <InodeInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InodeNumber] <Int32> [[-Volume] <String>] [-DSID <Int64>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFileInodeInfo -Template [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcFileInodeInfo -Query <InodeInfo> [-Attributes <InodeInfo>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
