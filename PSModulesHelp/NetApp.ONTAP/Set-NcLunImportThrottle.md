Set-NcLunImportThrottle
-----------------------

### Synopsis
Modify the max throughput limit for the specified import relationship

---

### Description

Modify the max throughput limit for the specified import relationship

---

### Related Links
* [New-NcLunImportRelationship](New-NcLunImportRelationship)

* [Start-NcLunImport](Start-NcLunImport)

---

### Examples
> Example 1

Set-NcLunImportThrottle -Path /vol/lun_import_test/lun20150218_041831 -Vserver pstk_san -MaxThroughputLimit 2Gb
Throttle import speed to 2GB/s

LunPath                             Admin Stat Operation  Operation State Progress
                                    e                                     Percentage
-------                             ---------- ---------  --------------- ----------
/vol/lun_import_test/lun20150218... stopped    import     stopped                 0%

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

#### **MaxThroughputLimit**
Maximum Throughput Limit (per second) at which the given import will be throttled.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

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
Category: Lun
API: lun-import-throttle
Family: cluster

---

### Syntax
```PowerShell
Set-NcLunImportThrottle [-Controller <NcController[]>] [-Path] <String> [-Vserver] <String> [-MaxThroughputLimit] <String> [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
