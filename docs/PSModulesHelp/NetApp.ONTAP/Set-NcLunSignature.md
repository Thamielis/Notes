Set-NcLunSignature
------------------

### Synopsis
Set the MBR or GPT signature of a partitioned LUN.

---

### Description

Set the MBR or GPT signature of a partitioned LUN.

---

### Examples
> Example 1

Set-NcLunSignature /vol/powershell/luns/disk0
Set a new disk signature for the given LUN.

Path                                           Size   SizeUsed Protocol     Online Mapped  Thin  Vserver
----                                           ----   -------- --------     ------ ------  ----  -------
/vol/powershell/luns/disk0                   1.0 TB   217.5 GB windows_2008  True   True   True  beam01

> Example 2

New-NcClone -volume powershell -SourcePath luns/lun0 -DestinationPath luns/lun0_clone
Set-NcLunSignature /vol/powershell/luns/lun0_clone | Add-NcLunMap -InitiatorGroup igroup1
Create a clone of a LUN, change its signature, then map it to a host.

Path                                           Size   SizeUsed Protocol     Online Mapped  Thin  Vserver
----                                           ----   -------- --------     ------ ------  ----  -------
/vol/powershell/luns/lun0_clone             10.0 GB    76.0 MB windows_2008  True   True   True  beam01

---

### Parameters
#### **Path**
Path to the LUN.

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **MbrSignature**
MBR Signature to assign the LUN.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[UInt32]`|false   |2       |false        |

#### **GptSignature**
GPT GUID signature to assign to the LUN.

|Type    |Required|Position|PipelineInput|
|--------|--------|--------|-------------|
|`[Guid]`|false   |2       |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunInfo

---

### Notes
category: lun

---

### Syntax
```PowerShell
Set-NcLunSignature [-Path] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcLunSignature [-Path] <String> [[-MbrSignature] <UInt32>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcLunSignature [-Path] <String> [[-GptSignature] <Guid>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
