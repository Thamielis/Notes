Set-NcLunSelect
---------------

### Synopsis
Set the select attribute for the specified LUN.

---

### Description

Set the select attribute for the specified LUN.  The select attribute is used by multi-pathing software to discriminate between luns when  mirrored or cloned copies of a vdisk are mapped to the same host.

---

### Related Links
* [Get-NcLunSelect](Get-NcLunSelect)

---

### Examples
> Example 1

Set-NcLunSelect /vol/luns/sclun0 -Select active
Set the LUN select attribute to "active" for the given LUN.

Path                                           Size   SizeUsed Protocol     Online Mapped  Thin  Vserver
----                                           ----   -------- --------     ------ ------  ----  -------
/vol/luns/sclun0                           256.0 GB   106.4 MB windows_2008  True   True   True  beam01

---

### Parameters
#### **Path**
Path of the LUN.

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

#### **Select**
The select attribute for the LUN.  Possible inputs: 'active', 'copy', 'mirror'

|Type      |Required|Position|PipelineInput|Aliases        |
|----------|--------|--------|-------------|---------------|
|`[String]`|true    |2       |false        |SelectAttribute|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunInfo

---

### Notes
Category: lun
API: lun-set-select-attribute
Family: vserver

---

### Syntax
```PowerShell
Set-NcLunSelect [-Path] <String> [-VserverContext <String>] [-Controller <NcController[]>] [-Select] <String> [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
