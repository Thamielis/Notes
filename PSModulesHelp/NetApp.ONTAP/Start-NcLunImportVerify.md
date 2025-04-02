Start-NcLunImportVerify
-----------------------

### Synopsis
Start the verification for the specified LUN.

---

### Description

Stops an ongoing verification operation on the specified lun.

---

### Related Links
* [Stop-NcLunImportVerify](Stop-NcLunImportVerify)

* [Start-NcLunImport](Start-NcLunImport)

* [New-NcLunImportRelationship](New-NcLunImportRelationship)

---

### Examples
> Example 1

Start-NcLunImportVerify -Path /vol/lun_import_test/lun0 -Vserver pstk_san
Verify whether /vol/lun_import_test/lun0 is exactly the same as the foreign disk from which it was imported.

LunPath                             Admin Stat Operation  Operation State Progress  
                                    e                                     Percentage
-------                             ---------- ---------  --------------- ----------
/vol/lun_import_test/lun0           started    verify     in_progress             0%

---

### Parameters
#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **Path**
The path to the lun on which a verification operation is in progress.

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
API: lun-import-verify-start
Family: cluster

---

### Syntax
```PowerShell
Start-NcLunImportVerify [-Controller <NcController[]>] [-Path] <String> [-Vserver] <String> [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
