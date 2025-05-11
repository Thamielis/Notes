Read-NcFile
-----------

### Synopsis
Read data from a named file.

---

### Description

Read data from a named file.  This cmdlet is limited to transfers of 1 MB and should only be used on normal files.  The results for other file types such as LUNs is undefined.

---

### Related Links
* [Get-NcFile](Get-NcFile)

* [Read-NcDirectory](Read-NcDirectory)

* [Write-NcFile](Write-NcFile)

---

### Examples
> Example 1

Read-NcFile /vol/vol1/hosts
Read a file 'hosts' that contains host info.

10.61.161.206   xyratex02.rtprre.testdomain     xyratex02
10.61.167.148   x3550rre8.rtprre.testdomain     x3550rre8

---

### Parameters
#### **Path**
The path of the file to read.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

#### **Raw**
Specify to get a byte array instead of the default ASCII interpretation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Stream**
A stream is an on disk structure which contains a sequence of bytes, analogous to a file.  A stream is always associated with exactly one file.  Characters that are valid for a file name are also valid for the stream-name.  e.g., 'meta', 'resource1'.
Use this parameter if the data should be read from the named stream associated with the file.
Default is empty stream name, in which case the data is read from the file.
This parameter is available in ONTAP 8.2 or later.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |named   |false        |StreamName|

#### **VserverContext**
Vserver to which to direct this command.  If the currently connected controller (as embodied by an NcController object) represents a cluster, there are multiple means to address commands to one of its vservers.  Either set the Vserver field on the NcController object to direct all subsequent commands to that vserver, or supply the VserverContext parameter to an individual cmdlet.  Only cmdlets which may be invoked on vservers offer the VserverContext parameter.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |named   |false        |VS     |

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

#### **Length**
Number of bytes to read.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |false        |

#### **Offset**
Offset into file at which to start reading.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Notes
Category: file
API: file-read-file
Family: vserver

---

### Syntax
```PowerShell
Read-NcFile [-Path] <String> [-Raw] [-Stream <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Read-NcFile [-Path] <String> [-Raw] [-Stream <String>] [-VserverContext <String>] [-Controller <NcController[]>] -Length <Int32> -Offset <Int64> [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
