Set-NcFileSpaceReservationInfo
------------------------------

### Synopsis
Sets the space reservation settings for the named file.

---

### Description

Sets the space reservation settings for the named file.

---

### Related Links
* [Get-NcFileSpaceReservationInfo](Get-NcFileSpaceReservationInfo)

---

### Examples
> Example 1

Set-NcFileSpaceReservationInfo /vol/pstk_vol1/f1 -EnableOverwrite $false -EnableFill $false
Disable Overwrite and Fill on the file.

NcController                                                      IsFillEnabled                      IsOverwriteEnabled
------------                                                      -------------                      ------------------
10.238.49.117                                                             False                                   False

---

### Parameters
#### **Path**
Absolute path of the file to be queried.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **EnableOverwrite**
Whether or not to set the file with overwrite.

|Type       |Required|Position|PipelineInput|Aliases           |
|-----------|--------|--------|-------------|------------------|
|`[Boolean]`|true    |2       |false        |IsOverwriteEnabled|

#### **EnableFill**
Whether or not to set the file with fill. 
Note: Must be the same value as EnableOverwrite

|Type       |Required|Position|PipelineInput|Aliases      |
|-----------|--------|--------|-------------|-------------|
|`[Boolean]`|true    |3       |false        |IsFillEnabled|

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
* DataONTAP.C.Types.File.FileSpaceReservationInfo

---

### Notes
Category: file
API: file-set-space-reservation-info
Family: vserver

---

### Syntax
```PowerShell
Set-NcFileSpaceReservationInfo [-Path] <String> [-EnableOverwrite] <Boolean> [-EnableFill] <Boolean> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
