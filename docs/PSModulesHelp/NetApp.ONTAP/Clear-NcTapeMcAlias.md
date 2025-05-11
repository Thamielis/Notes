Clear-NcTapeMcAlias
-------------------

### Synopsis
Clear tape drive / media changer alias.

---

### Description

Clear tape drive / media changer alias.

---

### Related Links
* [Set-NcTapeMcAlias](Set-NcTapeMcAlias)

---

### Examples
> Example 1

Clear-NcTapeMcAlias -AliasName "st13" -NodeName aparajirssd-01
Clear the alias st13

Device Alias      NodeName        DeviceType      WWNN                 Status State           Description
    ID
------ -----      --------        ----------      ----                 ------ -----           -----------
  v8.2 st2        aparajirssd-01  tape drive      0:242:424200:000000  normal ready_write_... NetApp NetApp Tape

---

### Parameters
#### **NodeName**
Name of owning node.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Node   |

#### **AliasName**
The alias to be cleared.
Note: If you specify this, you can not specify ClearScope

|Type      |Required|Position|PipelineInput        |Aliases       |
|----------|--------|--------|---------------------|--------------|
|`[String]`|false   |2       |true (ByPropertyName)|Alias<br/>Name|

#### **ClearScope**
Scope of alias clear Operation.
Note: If you specify this, you can not specify AliasName.
This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |named   |true (ByPropertyName)|Scope  |

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
API: tape-mc-info-alias-clear
Family: cluster

---

### Syntax
```PowerShell
Clear-NcTapeMcAlias [-NodeName] <String> [[-AliasName] <String>] [-ClearScope <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
