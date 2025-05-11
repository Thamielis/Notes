Get-NcFileUsage
---------------

### Synopsis
Get the number of unique bytes in a file

---

### Description

Get the number of unique bytes in a file

---

### Related Links
* [Get-NcFileUsageResult](Get-NcFileUsageResult)

* [Get-NcFile](Get-NcFile)

---

### Examples
> Example 1

```PowerShell
Get-NcFileUsage -Path /vol/pstk_vol1/f1
Get the number of unique bytes in f1

NcController : 10.238.49.117
Path         : /vol/pstk_vol1/f1
TotalBytes   : 4096
UniqueBytes  : 4096
Cookie       :

```
> Example 2

```PowerShell
Get-NcFileUsage -Path /vol/pstk_vol1/f1 -Async
Start calculations for reporting unique bytes used by f1

NcController : 10.238.49.117
Path         : /vol/pstk_vol1/f1
TotalBytes   :
UniqueBytes  :
Cookie       : 49999:/vol/pstk_vol1/f1:0:10239

```

---

### Parameters
#### **Path**
The path of the file to query.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|Name   |

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

#### **StartOffset**
Start range of file.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|false   |2       |true (ByPropertyName)|Offset |

#### **Length**
Length of the range.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|false   |3       |true (ByPropertyName)|

#### **Async**
Specify to start the byte count in the background; use GetNcFileUsageResults with the output cookie later to get the actual byte count

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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
* DataONTAP.C.Types.File.FileUsageInfo

---

### Notes
Category: file
API: file-usage-get, file-usage-start
Family: vserver

---

### Syntax
```PowerShell
Get-NcFileUsage [-Path] <String> [-VserverContext <String>] [-Controller <NcController[]>] [[-StartOffset] <String>] [[-Length] <String>] [-Async] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
