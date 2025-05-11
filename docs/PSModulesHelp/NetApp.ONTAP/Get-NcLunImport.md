Get-NcLunImport
---------------

### Synopsis
Get details of lun-relationships on the controller.

---

### Description

Get details of lun-relationships on the controller.

---

### Related Links
* [New-NcLunImportRelationship](New-NcLunImportRelationship)

* [Start-NcLunImport](Start-NcLunImport)

---

### Examples
> Example 1

Get-NcLunImport
Get all lun import relationships

LunPath                             Admin Stat Operation  Operation State Progress  
                                    e                                     Percentage
-------                             ---------- ---------  --------------- ----------
/vol/lun_import_test/lun0           stopped    import     stopped                 0%
/vol/lun_import_test/perm_lun       stopped    import     stopped                 0%

> Example 2

$q = Get-NcLunImport -Template; $q.OperationalStatus = "paused"; Get-NcLunImport -Query $q
Use a query object to get all paused operation.

LunPath                             Admin Stat Operation  Operation State Progress  
                                    e                                     Percentage
-------                             ---------- ---------  --------------- ----------
/vol/lun_import_test/lun0           paused     import     paused                 14%

> Example 3

Get-NcLunImport -VerifyOnly
Get all import verification operations only.

LunPath                             Admin Stat Operation  Operation State Progress  
                                    e                                     Percentage
-------                             ---------- ---------  --------------- ----------
/vol/lun_import_test/lun0           started    verify     in_progress            13%

---

### Parameters
#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[LunImportInfo]`|false   |named   |false        |

#### **Controller**
A clustered Data ONTAP controller to receive this cmdlet, as embodied by an NcController object.  This parameter is returned by the Connect-NcController cmdlet.  If not specified, the value in the global variable CurrentNcController is used.  In the latter case, if CurrentNcController contains a collection of NcController objects, this cmdlet is invoked on each controller in succession.

|Type              |Required|Position|PipelineInput                 |Aliases                          |
|------------------|--------|--------|------------------------------|---------------------------------|
|`[NcController[]]`|false   |named   |true (ByValue, ByPropertyName)|Filer<br/>Server<br/>NcController|

#### **Path**
Restrict results to one or more operations by naming the destination luns

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Vserver**
Restrict results to one or more operations where destination lun is in the same vserver.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **ForeignDisk**
Restrict results to one or more operations by naming the source lun array serial number.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **ImportOnly**
"Specify to view only those entries where the operation is import.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **VerifyOnly**
Specify to view only those entries where the operation is verify.

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

#### **Template**
Can be used in Powershell 2 to obtain an empty query element.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type             |Required|Position|PipelineInput|
|-----------------|--------|--------|-------------|
|`[LunImportInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Lun.LunImportInfo

---

### Notes
Category: lun
API: lun-import-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcLunImport [-Attributes <LunImportInfo>] [-Controller <NcController[]>] [[-Path] <String[]>] [-Vserver <String[]>] [-ForeignDisk <String[]>] [-ImportOnly] [-VerifyOnly] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcLunImport -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcLunImport -Query <LunImportInfo> [-Attributes <LunImportInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
