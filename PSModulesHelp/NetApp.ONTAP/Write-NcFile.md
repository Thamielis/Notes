Write-NcFile
------------

### Synopsis
Write data into a named file.

---

### Description

Write data into a named file.   If the file does not previously exist, it will be created; the owner of the file will be root and it will not be readable or writable by non-root users.  This cmdlet is limited to transfers of 1 MB and should only be used on normal files. The results for other file types such as LUNs is undefined.

---

### Related Links
* [Read-NcFile](Read-NcFile)

---

### Examples
> Example 1

```PowerShell
Write-NcFile /vol/vol1/hosts -RawData (Get-Content c:\windows\system32\drivers\etc\hosts -Encoding byte)
Copy a file from the local host to a new file on a vserver.  This example works for any file, text or binary.
```

---

### Parameters
#### **Path**
Pathname of the file to write.  For example: "/vol/<volume>/<file>".

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |1       |false        |Name   |

#### **Data**
ASCII text to be written to the file.

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[String[]]`|true    |named   |true (ByValue, ByPropertyName)|

#### **NoClobber**
If specified, file will not be overwritten if it exists.

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[Switch]`|false   |named   |false        |NoOverwrite|

#### **Append**
If specified, file will be appended to.  Ignored if Offset is specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AppendLine**
If specified, file will be appended to on a new line.  Ignored if Offset is specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NoTruncate**
If specified, file will not be truncated before being written to.  Ignored if non-zero Offset if specified.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Separator**
Separator used between lines of input.  May be an empty string.  Default is a newline (`n).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Stream**
A stream is an on disk structure which contains a sequence of bytes, analogous to a file.  A stream is always associated with exactly one file.  Characters that are valid for a file name are also valid for the stream-name.  e.g., 'meta', 'resource1'.
Use this parameter if the data should be written to the named stream associated with the file.
Default is empty stream name, in which case the data is written to the file.
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

#### **Offset**
Offset into file at which to start writing.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int64]`|false   |named   |false        |

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

#### **RawData**
Array of bytes to be written to the file.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Byte[]]`|true    |named   |true (ByValue, ByPropertyName)|

---

### Inputs

---

### Outputs
* 

---

### Notes
Category: file
API: file-write-file, file-truncate-file
Family: vserver

---

### Syntax
```PowerShell
Write-NcFile [-Path] <String> -Data <String[]> [-NoClobber] [-Append] [-AppendLine] [-NoTruncate] [-Separator <String>] [-Stream <String>] [-VserverContext <String>] [-Controller 
```
```PowerShell
<NcController[]>] [-Offset <Int64>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Write-NcFile [-Path] <String> -RawData <Byte[]> [-NoClobber] [-Append] [-AppendLine] [-NoTruncate] [-Stream <String>] [-VserverContext <String>] [-Controller <NcController[]>] [-Offset 
```
```PowerShell
<Int64>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
