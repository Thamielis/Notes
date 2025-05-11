Set-NcLunCopyMaxThroughput
--------------------------

### Synopsis
Modifies the maximum throughput of an ongoing copy operation.

---

### Description

Modifies the maximum throughput of an ongoing copy operation.

---

### Related Links
* [Get-NcLunCopy](Get-NcLunCopy)

* [Start-NcLunCopy](Start-NcLunCopy)

* [Suspend-NcLunCopy](Suspend-NcLunCopy)

---

### Examples
> Example 1

Set-NcLunCopyMaxThroughput 321e9221-7707-4854-8ef7-c12a90a39617 "5MB" | Select SourcePath, DestinationPath, MaxThroughput
Set max throughput of operation 321e9221-7707-4854-8ef7-c12a90a39617 to 5MiB

SourcePath                              DestinationPath                                                   MaxThroughput
----------                              ---------------                                                   -------------
/vol/move_test_alt/lun0                 /vol/move_test/lun_cc_x                                                 5242880

---

### Parameters
#### **Name**
An array , where each element is the path of destination lun. This parameter is supported with Rest only.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Vserver**
Specifies Vserver name. This parameter is supported with Rest only.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **JobUuid**
pecifies the universally unique ID (UUID) of the job that started this copy operation. This parameter is supported with Ontapi only.

|Type      |Required|Position|PipelineInput        |Aliases|
|----------|--------|--------|---------------------|-------|
|`[String]`|true    |1       |true (ByPropertyName)|UUid   |

#### **MaxThroughput**
Specifies the maximum amount of data that can be transferred per second in support of this operation. 
Default: zero, indicating no throttling.
Note: Specified value will be rounded up to the nearest megabyte

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **LunIndex**
Specifies an additional unique element identifying one LUN among many that could be possibly copied as part of a job. This parameter is supported with Ontapi only.

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
The number of times to retry commands that return with errors that may succeed after a retry

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunCopyInfo

---

### Notes
Category: lun
API: lun-copy-modify
Family: cluster, vserver

---

### Syntax
```PowerShell
Set-NcLunCopyMaxThroughput [-Name <String[]>] [-Vserver <String>] [-Controller <NcController[]>] [-JobUuid] <String> [-MaxThroughput] <String> [-LunIndex <Int64>] [-InformationAction 
```
```PowerShell
<ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
