New-NcLunImportRelationship
---------------------------

### Synopsis
Create a LUN import relationship with the purpose of importing  foreign disk data into the LUN.

---

### Description

Create a LUN import relationship with the purpose of importing  foreign disk data into the LUN. 
The destination lun must already be created to be of exactly same size as the source disk (New-NcLun cmdlet with -ForeignDisk option), mapped to the proper igroup (Add-NcLunMap cmdlet) and it's state must be offline (Set-NcLun -Offline cmdlet).
The source disk must already be marked as foreign and available to Data ONTAP.

---

### Related Links
* [Get-NcDisk](Get-NcDisk)

* [New-NcLun](New-NcLun)

* [Set-NcLun](Set-NcLun)

* [Add-NcLunMap](Add-NcLunMap)

* [Start-NcLunImport](Start-NcLunImport)

---

### Examples
> Example 1

New-NcLunImportRelationship -Path /vol/lun_import_test/lun0 -Vserver pstk_san -ForeignDisk 60060480343631343963643737616531
Create a relationship between lun /vol/lun_import_test/lun0 and foreign disk 60060480343631343963643737616531

LunPath                             Admin Stat Operation  Operation State Progress  
                                    e                                     Percentage
-------                             ---------- ---------  --------------- ----------
/vol/lun_import_test/lun0           stopped    import     stopped                 0%

---

### Parameters
#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **Path**
The path to the lun to which a foreign disk will be imported

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |1       |true (ByPropertyName)|

#### **Vserver**
The Vserver containing the Lun.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **ForeignDisk**
The serial number of the foreign disk from which lun is to be imported.

|Type      |Required|Position|PipelineInput        |Aliases                                              |
|----------|--------|--------|---------------------|-----------------------------------------------------|
|`[String]`|true    |3       |true (ByPropertyName)|Disk<br/>DiskSerialNumber<br/>ForeignDiskSerialNumber|

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
API: lun-import-create
Family: cluster

---

### Syntax
```PowerShell
New-NcLunImportRelationship [-Controller <NcController[]>] [-Path] <String> [-Vserver] <String> [-ForeignDisk] <String> [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
