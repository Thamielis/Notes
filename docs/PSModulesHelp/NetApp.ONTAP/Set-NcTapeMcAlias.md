Set-NcTapeMcAlias
-----------------

### Synopsis
Set a tape/drive media changer alias

---

### Description

Set a tape/drive media changer alias

---

### Related Links
* [Get-NcTapeMc](Get-NcTapeMc)

* [Set-NcTapeMc](Set-NcTapeMc)

---

### Examples
> Example 1

Get-NcTapeMc v8.2 | Set-NcTapeMcAlias -AliasName "st13"
Set alias as "st13" for tape device v8.2

Device Alias      NodeName        DeviceType      WWNN                 Status State           Description
    ID
------ -----      --------        ----------      ----                 ------ -----           -----------
  v8.2 st13       aparajirssd-01  tape drive      0:242:424200:000000  normal ready_write_... NetApp NetApp Tape

---

### Parameters
#### **NodeName**
Name of owning node.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Node   |

#### **AliasName**
The alias to be set.

|Type      |Required|Position|PipelineInput        |Aliases       |
|----------|--------|--------|---------------------|--------------|
|`[String]`|true    |2       |true (ByPropertyName)|Alias<br/>Name|

#### **AliasMapping**
Mapping for Alias Name.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |3       |true (ByPropertyName)|Mapping|

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
* DataONTAP.C.Types.TapeMcInfo.TapeMcInfo

---

### Notes
Category: tape_mc
API: tape-mc-info-alias-set
Family: cluster

---

### Syntax
```PowerShell
Set-NcTapeMcAlias [-NodeName] <String> [-AliasName] <String> [-AliasMapping] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
