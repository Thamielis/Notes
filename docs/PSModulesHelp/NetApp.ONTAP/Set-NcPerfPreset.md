Set-NcPerfPreset
----------------

### Synopsis
Modify a performance preset.

---

### Description

Modify a performance preset.

---

### Related Links
* [Get-NcPerfPreset](Get-NcPerfPreset)

* [New-NcPerfPreset](New-NcPerfPreset)

* [Remove-NcPerfPreset](Remove-NcPerfPreset)

---

### Examples
> Example 1

Set-NcPerfPreset -Name powershell_volume -Comment "Collect perf data for volumes.  Created by PowerShell Toolkit."
Change the comment for a performance preset.

Preset               Privilege     IsReadOnly   IsArchiveEnabled  Comment
------               ---------     ----------   ----------------  -------
powershell_volume    diagnostic      False           False        Collect perf data for volumes.  Created by PowerSh...

---

### Parameters
#### **Name**
Name of the performance preset to modify.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Preset |

#### **Comment**
Performance preset description.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Privilege**
Performance preset privilege level.  Possible values: admin, advanced, diagnostic.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **IsArchived**
If true, enable performance preset archiving.

|Type       |Required|Position|PipelineInput        |
|-----------|--------|--------|---------------------|
|`[Boolean]`|false   |named   |true (ByPropertyName)|

#### **ExpirationLength**
Default expiration length in minutes. Range: [0..1440]

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

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
Set-NcPerfPreset [-Name] <String> [-Comment <String>] [-Privilege <String>] [-IsArchived <Boolean>] [-ExpirationLength <Int32>] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
