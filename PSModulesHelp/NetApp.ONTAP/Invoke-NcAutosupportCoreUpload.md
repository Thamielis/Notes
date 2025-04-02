Invoke-NcAutosupportCoreUpload
------------------------------

### Synopsis
Generate and send an AutoSupport message with the core file.

---

### Description

Generate and send an AutoSupport message with the core file. Invoke-NcCoredump cmdlet may be used to generate a corefile.

---

### Related Links
* [Invoke-NcCoredump](Invoke-NcCoredump)

* [Invoke-NcAutosupport](Invoke-NcAutosupport)

---

### Examples
> Example 1

```PowerShell
Invoke-NcAutosupportCoreUpload core.2015103330.2014-06-19.13_30_06.nz
Generate a new AutoSupport message with the corefile core.2015103330.2014-06-19.13_30_06.nz
```

---

### Parameters
#### **Node**
The name of the filer on which the AutoSupport message will be generated.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |1       |true (ByPropertyName)|NodeName|

#### **CoreFile**
Core file to be included in this AutoSupport.

|Type      |Required|Position|PipelineInput        |Aliases                                    |
|----------|--------|--------|---------------------|-------------------------------------------|
|`[String]`|true    |2       |true (ByPropertyName)|CoreFileName<br/>Core<br/>File<br/>CoreDump|

#### **Message**
Text to include as part of the subject of the AutoSupport message.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Uri**
Alternate destination for the AutoSupport.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **CaseNumber**
Support case number to associate with this core file.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |named   |true (ByPropertyName)|

#### **Force**
Specify to force generation, even if AutoSupport is disabled in the system.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
Category: autosupport
API: autosupport-invoke-core-upload
Family: cluster

---

### Syntax
```PowerShell
Invoke-NcAutosupportCoreUpload [-Node] <String> [-CoreFile] <String> [-Message <String>] [-Uri <String>] [-CaseNumber <String>] [-Force] [-Controller <NcController[]>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
