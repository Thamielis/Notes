New-NcAntivirusLogEntry
-----------------------

### Synopsis
Create a new antivirus log entry.

---

### Description

Create a new antivirus log entry.

---

### Related Links
* [Get-NcAntivirusLog](Get-NcAntivirusLog)

---

### Examples
> Example 1

New-NcAntivirusLogEntry -VendorId 1 -VendorString "This is a test log entry"
Create a new antivirus log entry.

DateTimeDT                 VendorId         VendorString
----------                 --------         ------------
9/30/2014 2:01:09 AM       1                This is a test log entry

> Example 2

---

### Parameters
#### **VendorId**
Vendor ID.

|Type     |Required|Position|PipelineInput        |
|---------|--------|--------|---------------------|
|`[Int64]`|true    |1       |true (ByPropertyName)|

#### **VendorString**
Vendor string.

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |2       |true (ByPropertyName)|

#### **TimeStamp**
When the event is logged.  If not provided, the current DateTime is used.

|Type        |Required|Position|PipelineInput        |Aliases |
|------------|--------|--------|---------------------|--------|
|`[DateTime]`|false   |named   |true (ByPropertyName)|DateTime|

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

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Antivirus.AvEventInfo

---

### Notes
Category: antivirus
API: av-set-log
Family: cluster

---

### Syntax
```PowerShell
New-NcAntivirusLogEntry [-VendorId] <Int64> [-VendorString] <String> [-TimeStamp <DateTime>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable 
```
```PowerShell
<String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
