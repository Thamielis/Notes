Get-NcFileHoles
---------------

### Synopsis
Get ranges of holes in a file

---

### Description

Get ranges of holes in a file

---

### Related Links
* [Set-NcFileHoles](Set-NcFileHoles)

---

### Examples
> Example 1

Get-NcFileHoles /vol/pstk_vol1/f2
Get information about all holes in the file f2

FilePath             HoleStart                      HoleSize
--------             ---------                      --------
/vol/pstk_vol1/f2    4096,12288,                    4096,4096,

---

### Parameters
#### **Path**
The path of the file to query.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

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

#### **Offset**
The starting offset of the file from where the scan for holes should begin. If the offset is not an integral multiple of the block size it will be rounded down to the start of the block.
If unspecified, scan starts at offset 0.

|Type      |Required|Position|PipelineInput        |Aliases    |
|----------|--------|--------|---------------------|-----------|
|`[String]`|false   |2       |true (ByPropertyName)|StartOffset|

#### **Length**
The number of bytes to scan. If this is zero scan until end of file. If the length is not an integral multiple of the block size it will be rounded up to the end of the block.
If unspecified, scan proceeds to end of file.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

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
* DataONTAP.C.Types.File.FileHoleInfo

---

### Notes
Category: file
API: file-hole-range-query-iter
Family: vserver

---

### Syntax
```PowerShell
Get-NcFileHoles [-Path] <String> [-VserverContext <String>] [-Controller <NcController[]>] [[-Offset] <String>] [[-Length] <String>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
