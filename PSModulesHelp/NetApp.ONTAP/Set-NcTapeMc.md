Set-NcTapeMc
------------

### Synopsis
Bring an attached tape or media changer device online or offline

---

### Description

Bring an attached tape or media changer device online or offline

---

### Related Links
* [Get-NcTapeMc](Get-NcTapeMc)

* [Set-NcTapePosition](Set-NcTapePosition)

* [Set-NcTapeMcAlias](Set-NcTapeMcAlias)

---

### Examples
> Example 1

Get-NcTapeMc v8.2 | Set-NcTapeMc -Offline
Put the tape drive v8.2 offline

Device Alias      NodeName        DeviceType      WWNN                 Status State           Description
    ID
------ -----      --------        ----------      ----                 ------ -----           -----------
  v8.2 st2        aparajirssd-01  tape drive      0:242:424200:000000  normal ready_write_... NetApp NetApp Tape

---

### Parameters
#### **DeviceId**
The deviceID of the tape to modify.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Id     |

#### **NodeName**
Name of owning node.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|Node   |

#### **Online**
Specify to bring the tape online.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[Switch]`|false   |named   |false        |on<br/>onl|

#### **Offline**
Specify to put the tape offline.

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[Switch]`|false   |named   |false        |off<br/>ofl|

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

#### **DeviceName**
The device name of the tape to modify. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.TapeMcInfo.TapeMcInfo

---

### Notes
Category: tape_mc
API: tape-mc-info-online, tape-mc-info-offline
Family: cluster

---

### Syntax
```PowerShell
Set-NcTapeMc [-DeviceId] <String> [-NodeName] <String> [-Online] [-Offline] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Set-NcTapeMc [-DeviceName] <String> [-NodeName] <String> [-Online] [-Offline] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
