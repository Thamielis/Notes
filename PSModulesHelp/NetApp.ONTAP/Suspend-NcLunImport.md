Suspend-NcLunImport
-------------------

### Synopsis
Pauses an ongoing lun import operation

---

### Description

Pauses an ongoing LUN import operation. Use the Resume-NcLunImport cmdlet to resume the move operation.

---

### Related Links
* [Get-NcLunImport](Get-NcLunImport)

* [Resume-NcLunImport](Resume-NcLunImport)

* [Start-NcLunImport](Start-NcLunImport)

---

### Examples
> Example 1

Suspend-NcLunImport -Path /vol/lun_import_test/lun0 -Vserver pstk_san
Suspend the ongoing lun import operation with destination as /vol/lun_import_test/lun0

LunPath                             Admin Stat Operation  Operation State Progress  
                                    e                                     Percentage
-------                             ---------- ---------  --------------- ----------
/vol/lun_import_test/lun0           paused     import     paused                 14%

---

### Parameters
#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **Path**
The path to the lun to which a foreign disk is being imported

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Vserver**
The Vserver containing the Lun.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

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
* DataONTAP.C.Types.Lun.LunImportInfo

---

### Notes
Category: lun
API: lun-import-pause
Family: cluster

---

### Syntax
```PowerShell
Suspend-NcLunImport [-Controller <NcController[]>] [-Path] <String> [-Vserver] <String> [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] 
```
```PowerShell
[-ZapiRetryCount <Int32>] [<CommonParameters>]
```
