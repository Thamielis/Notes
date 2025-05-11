Set-NcFileHoles
---------------

### Synopsis
Punch hole in the file.

---

### Description

Punch hole in the file. Hole punching involves reclaiming of blocks in a file by unallocating them and then direct or indirect blocks can be made to point to 0.

---

### Related Links
* [Get-NcFileHoles](Get-NcFileHoles)

---

### Examples
> Example 1

Set-NcFileHoles /vol/pstk_vol1/f2 -HoleStart 4096,12288 -HoleSize 4096,4096
Create two holes, from 4096-8192 and 12288-16384, in the file f2

FilePath             HoleStart                      HoleSize
--------             ---------                      --------
/vol/pstk_vol1/f2    4096,12288,                    4096,4096,

---

### Parameters
#### **Path**
Absolute path of the file in which to punch the holes.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

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

#### **Holes**
HoleRangeInfo object, from which HoleStart and HoleSize information will be extracted.

|Type               |Required|Position|PipelineInput        |Aliases                                      |
|-------------------|--------|--------|---------------------|---------------------------------------------|
|`[HoleRangeInfo[]]`|true    |named   |true (ByPropertyName)|HoleRangeInfo<br/>HoleInfo<br/>AttributesList|

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

#### **HoleStart**
Starting offset of the hole(s)

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|true    |named   |true (ByPropertyName)|Start  |

#### **HoleSize**
Size of the hole(s); should have a one-to-one mapping with starting offsets.

|Type        |Required|Position|PipelineInput        |Aliases        |
|------------|--------|--------|---------------------|---------------|
|`[String[]]`|true    |named   |true (ByPropertyName)|Size<br/>Length|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.File.FileHoleInfo

---

### Notes
Category: file
API: file-punch-hole-iter
Family: vserver

---

### Syntax
```PowerShell
Set-NcFileHoles [-Path] <String> [-VserverContext <String>] [-Controller <NcController[]>] -Holes <HoleRangeInfo[]> [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcFileHoles [-Path] <String> [-VserverContext <String>] [-Controller <NcController[]>] -HoleStart <String[]> -HoleSize <String[]> [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
