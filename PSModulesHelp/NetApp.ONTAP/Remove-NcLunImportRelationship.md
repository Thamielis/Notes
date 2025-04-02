Remove-NcLunImportRelationship
------------------------------

### Synopsis
Deletes the import relationship of the specified LUN or the specified foreign disk.

---

### Description

Deletes the import relationship of the specified LUN or the specified foreign disk.

---

### Related Links
* [Stop-NcLunImport](Stop-NcLunImport)

* [New-NcLunImportRelationship](New-NcLunImportRelationship)

---

### Examples
> Example 1

Remove-NcLunImportRelationship -ForeignDisk 60060480343631343963643737616531
Remove the import relationship using the source as key.

LunPath                             Admin Stat Operation  Operation State Progress  
                                    e                                     Percentage
-------                             ---------- ---------  --------------- ----------
/vol/lun_import_test/perm_lun       stopped    import     stopped                 0%

> Example 2

Remove-NcLunImportRelationship -Path /vol/lun_import_test/lun0 -Vserver pstk_san
Remove the import relationship using the destination as key.

LunPath                             Admin Stat Operation  Operation State Progress
                                    e                                     Percentage
-------                             ---------- ---------  --------------- ----------
/vol/lun_import_test/perm_lun       stopped    import     stopped                 0%

---

### Parameters
#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **Path**
The path to the lun

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Vserver**
The Vserver containing the LUN which has an import relationship with the foreign disk.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **Force**
Specify to delete the import relationship even if import operation is in progress.

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

#### **ForeignDisk**
The serial number of the foreign disk

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunImportInfo

---

### Notes
Category: lun
API: lun-import-delete
Family: cluster

---

### Syntax
```PowerShell
Remove-NcLunImportRelationship [-Controller <NcController[]>] [-Path] <String> [-Vserver] <String> [-Force] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Remove-NcLunImportRelationship [-Controller <NcController[]>] [-ForeignDisk] <String> [-Force] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
