Get-NcAntivirusLog
------------------

### Synopsis
Get a list of antivirus objects.

---

### Description

Get a list of antivirus objects.

---

### Related Links
* [New-NcAntivirusLogEntry](New-NcAntivirusLogEntry)

---

### Examples
> Example 1

```PowerShell
Get-NcAntivirusLog
Get the antivirus log.

Datetime          : 1338901857
DatetimeDT        : 6/5/2012 1:10:57 PM
NcController      : 10.61.172.155
VendorId          : 1
VendorString      : Testing...
DatetimeSpecified : True
VendorIdSpecified : True

```

---

### Parameters
#### **VendorId**
Vendor ID.

|Type          |Required|Position|PipelineInput        |
|--------------|--------|--------|---------------------|
|`[Decimal][]]`|false   |1       |true (ByPropertyName)|

#### **VendorString**
Vendor string.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **StartTime**
Only display log entries that occured after this time.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[DateTime]`|false   |named   |true (ByPropertyName)|

#### **EndTime**
Only display log entries that occured before this time.

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[DateTime]`|false   |named   |true (ByPropertyName)|

#### **Attributes**
For improved scalability in large clusters, provide an AvEventInfo object with various fields set to indicate which fields to return on all objects.  Undesired fields should remain set to null.  Use "Get-NcAntivirusLog -Template" to get the initially empty AvEventInfo object.  If not specified, all data is returned for each object.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[AvEventInfo]`|false   |named   |false        |

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

#### **Template**
Specify to get an empty AvEventInfo object for use with advanced queries involving the Query attribute.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
For advanced queries, provide a AvEventInfo object with various fields set to indicate which records to retrieve.  Other fields should remain set to null.  Use "Get-NcAntivirusLog -Template" to get the initially empty AvEventInfo object.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[AvEventInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Antivirus.AvEventInfo

---

### Notes
Category: antivirus
API: av-log-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcAntivirusLog [[-VendorId] <Decimal][]>] [[-VendorString] <String[]>] [-StartTime <DateTime>] [-EndTime <DateTime>] [-Attributes <AvEventInfo>] [-Controller <NcController[]>] 
```
```PowerShell
[-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcAntivirusLog -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcAntivirusLog -Query <AvEventInfo> [-Attributes <AvEventInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable 
```
```PowerShell
<String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
