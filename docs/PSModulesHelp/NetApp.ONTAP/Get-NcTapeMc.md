Get-NcTapeMc
------------

### Synopsis
Iterate over the list of Tape/MC objects

---

### Description

Iterate over the list of Tape/MC objects

---

### Related Links
* [Set-NcTapeMc](Set-NcTapeMc)

* [Set-NcTapePosition](Set-NcTapePosition)

* [Test-NcTapeMc](Test-NcTapeMc)

---

### Examples
> Example 1

Get-NcTapeMc
Get information about all attached tape drives.

Device Alias      NodeName        DeviceType      WWNN                 Status State           Description
    ID
------ -----      --------        ----------      ----                 ------ -----           -----------
  v8.2 st2        aparajirssd-01  tape drive      0:242:424200:000000  normal ready_write_... NetApp NetApp Tape
  v8.3 st3        aparajirssd-01  tape drive      0:342:424200:000000  normal ready_write_... NetApp NetApp Tape
  v8.0 st0        aparajirssd-01  tape drive      0:042:424200:000000  normal ready_write_... NetApp NetApp Tape
  v8.1 st1        aparajirssd-01  tape drive      0:142:424200:000000  normal ready_write_... NetApp NetApp Tape

---

### Parameters
#### **DeviceId**
Device Id(s) for which information is to be retrieved.

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |1       |true (ByPropertyName)|Device |

#### **NodeName**
Name of the node(s) from which to retrieve information.

|Type        |Required|Position|PipelineInput        |Aliases      |
|------------|--------|--------|---------------------|-------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Name<br/>Node|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[TapeMcInfo]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **DeviceType**
Type(s) of devices for which information is to be retrieved

|Type        |Required|Position|PipelineInput        |Aliases|
|------------|--------|--------|---------------------|-------|
|`[String[]]`|false   |named   |true (ByPropertyName)|Type   |

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

#### **Template**
Can be used in Powershell 2 to obtain an empty query element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[TapeMcInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.TapeMcInfo.TapeMcInfo

---

### Notes
Category: tape_mc
API: tape-mc-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcTapeMc [[-DeviceId] <String[]>] [-NodeName <String[]>] [-Attributes <TapeMcInfo>] [-Controller <NcController[]>] [-DeviceType <String[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcTapeMc -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcTapeMc -Query <TapeMcInfo> [-Attributes <TapeMcInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
