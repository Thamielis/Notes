Merge-NcFileData
----------------

### Synopsis
Compact data in a snapshot

---

### Description

Compact data in a snapshot

---

### Related Links
* [Get-NcFile](Get-NcFile)

* [Read-NcFile](Read-NcFile)

* [Write-NcFile](Write-NcFile)

---

### Examples
> Example 1

Merge-NcFileData -File /vol/aparajir_vol1/f1 -Snapshot snap1 -Volume aparajir_vol1 -Vserver primary1
Compact data for file f1 in snapshot snap1

PS >

---

### Parameters
#### **File**
Specifies the complete file path in the form /vol/vol_name/AFS_path_of_the_file.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Snapshot**
Name of the snapshot in which compacting should occur

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Volume**
Name of the volume in which the targeted file is located

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **Vserver**
Vserver in which the targeted file is located.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |4       |true (ByPropertyName)|

#### **Node**
Node in which compacting has to be performed.

|Type      |Required|Position|PipelineInput        |Aliases |
|----------|--------|--------|---------------------|--------|
|`[String]`|true    |5       |true (ByPropertyName)|NodeName|

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
Category: file
API: file-compact-data
Family: cluster

---

### Syntax
```PowerShell
Merge-NcFileData [-File] <String> [-Snapshot] <String> [-Volume] <String> [-Vserver] <String> [-Node] <String> [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
