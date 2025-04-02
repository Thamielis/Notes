Test-NcTapeMc
-------------

### Synopsis
Reserve a tape drive for testing or release a reserved drive

---

### Description

Reserve a tape drive for testing or release a reserved drive

---

### Related Links
* [Enable-NcTapeMcTrace](Enable-NcTapeMcTrace)

* [Disable-NcTapeMcTrace](Disable-NcTapeMcTrace)

---

### Examples
> Example 1

```PowerShell
Test-NcTapeMc -DeviceId v8.2 -NodeName aparajirssd-01 -Reserve
Reserve the device v8.2 for testing.
```

---

### Parameters
#### **DeviceId**
The deviceID of the tape to reserve/release for testing.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Id     |

#### **NodeName**
Name of owning node.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |2       |true (ByPropertyName)|Node   |

#### **Reserve**
Reserve the tape for testing.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[Switch]`|false   |named   |false        |on<br/>res|

#### **Release**
Release a reserved tape.

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[Switch]`|false   |named   |false        |off<br/>rel|

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
API: tape-mc-info-test-reserve, tape-mc-info-test-release
Family: cluster

---

### Syntax
```PowerShell
Test-NcTapeMc [-DeviceId] <String> [-NodeName] <String> [-Reserve] [-Release] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
