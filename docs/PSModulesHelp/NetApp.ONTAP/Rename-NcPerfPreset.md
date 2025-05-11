Rename-NcPerfPreset
-------------------

### Synopsis
Rename a performance preset.

---

### Description

Rename a performance preset.

---

### Related Links
* [Get-NcPerfPreset](Get-NcPerfPreset)

* [Set-NcPerfPreset](Set-NcPerfPreset)

* [Remove-NcPerfPreset](Remove-NcPerfPreset)

---

### Examples
> Example 1

Rename-NcPerfPreset powershell_volume powershell
Rename the performance preset 'powershell_volume' to 'powershell'.

Preset               Privilege     IsReadOnly   IsArchiveEnabled  Comment
------               ---------     ----------   ----------------  -------
powershell           diagnostic      False           False        Collect perf data for volumes.

---

### Parameters
#### **Name**
Name of the performance preset.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Preset |

#### **NewName**
New name to give the performance preset.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Perf.PresetInfo

---

### Notes
Category: perf
API: perf-preset-modify
Family: cluster

---

### Syntax
```PowerShell
Rename-NcPerfPreset [-Name] <String> [-NewName] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
