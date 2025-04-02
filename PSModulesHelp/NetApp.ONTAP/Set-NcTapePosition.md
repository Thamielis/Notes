Set-NcTapePosition
------------------

### Synopsis
Position tape cartridge

---

### Description

Position tape cartridge

---

### Related Links
* [Get-NcTapeMc](Get-NcTapeMc)

* [Reset-NcTapeMc](Reset-NcTapeMc)

---

### Examples
> Example 1

```PowerShell
Set-NcTapePosition -NodeName aparajirssd-01 -DeviceName v8.2 -Operation weof
Set the tape v8.2 for operation write-end-of-file
```

---

### Parameters
#### **NodeName**
Name of owning node.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Node   |

#### **DeviceName**
Name of device to be positioned. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases        |
|----------|--------|--------|---------------------|---------------|
|`[String]`|true    |2       |true (ByPropertyName)|Device<br/>Name|

#### **Operation**
Tape operation.
Possible values: 
 * 'weof'     - Write end-of-file,
 *  'fsf'      - Forward space files,
 *  'bsf'      - Backward space files,
 *  'fsr'      - Forward space records,
 *  'bsr'      - Backward space records,
 *  'rewind'   - Rewind tape cartridge,
 *  'erase'    - Erase tape media,
 *  'eom'      - End of tape media

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **Count**
Count for Positioning.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|false   |4       |true (ByPropertyName)|

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
* 

---

### Notes
Category: tape_mc
API: tape-mc-info-position
Family: cluster

---

### Syntax
```PowerShell
Set-NcTapePosition [-NodeName] <String> [-DeviceName] <String> [-Operation] <String> [[-Count] <Int64>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
