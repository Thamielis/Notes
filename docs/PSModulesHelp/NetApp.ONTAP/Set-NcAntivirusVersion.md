Set-NcAntivirusVersion
----------------------

### Synopsis
Set the version information of the antivirus engine installed.

---

### Description

Set the version information of the antivirus engine installed.

---

### Related Links
* [Get-NcAntivirusVersion](Get-NcAntivirusVersion)

---

### Examples
> Example 1

---

### Parameters
#### **ClusterVersion**
The current cluster version of the engine. If this does not correspond to the current cluster version of the engine, then the ZAPI fails.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **ComponentUpdated**
The component that was updated. Possible values: "engine" - only antivirus engine was updated; "vde" - only virus definition files were updated; "both" - both antivirus engine and virus definition files were updated.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Vsapi32BitVersion**
The version of the 32-bit VSAPI engine.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Vsapi64BitVersion**
The version of the 64-bit VSAPI engine.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **VirusPatternVersion**
The version of the virus pattern files.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **SpywarePatternVersion**
The version of the spyware pattern files.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

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
* DataONTAP.C.Types.Antivirus.AvVersionInfo

---

### Notes
Category: antivirus
API: av-set-version-info
Family: cluster

---

### Syntax
```PowerShell
Set-NcAntivirusVersion [-ClusterVersion] <String> [-ComponentUpdated <String>] [-Vsapi32BitVersion <String>] [-Vsapi64BitVersion <String>] [-VirusPatternVersion <String>] 
```
```PowerShell
[-SpywarePatternVersion <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
