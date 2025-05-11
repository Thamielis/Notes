Get-NcEmsEventCatalog
---------------------

### Synopsis
Return information on several EMS messages.

---

### Description

Return information on several EMS messages.

---

### Related Links
* [Get-NcEmsMessage](Get-NcEmsMessage)

---

### Examples
> Example 1

Get-NcEmsEventCatalog | Select -First 1
Get the first message from the EMS event catalog

Action       : Ensure that the number of clients accessing the storage system continues to be below the limits for
               access cache entries and export rules across those entries. If the set of clients accessing the storage
               system is constantly changing, consider using the "vserver export-policy access-cache config modify"
               command to reduce the harvest timeout parameter so that cache entries for clients that are no longer
               accessing the storage system can be evicted sooner.
Description  : This message occurs when the access cache module is near its limits for entries or export rules.
               Reaching these limits can prevent new clients from being able to mount and perform I/O on the storage
               system, and can also cause clients to be granted or denied access based on stale cached information.
FilterName   :
MessageName  : AccessCache.NearLimits
NcController : 10.63.1.234
Severity     : alert
SnmpTrapType : severity_based

---

### Parameters
#### **MessageName**
Specify to filter by message name

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |1       |true (ByPropertyName)|

#### **Severity**
Specify to filter by Severity

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |2       |true (ByPropertyName)|

#### **Attributes**
Specify to restrict which data fields are returned by Data ONTAP

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[EventCatalogInfo]`|false   |named   |false        |

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

#### **Template**
Can be used to obtain an empty query element, which can be used along with Query or Attributes parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Query**
Specify to query using a object with restricting fields set.

|Type                |Required|Position|PipelineInput|
|--------------------|--------|--------|-------------|
|`[EventCatalogInfo]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.C.Types.Ems.EventCatalogInfo

---

### Notes
Category: ems
API: ems-event-catalog-get-iter
Family: cluster

---

### Syntax
```PowerShell
Get-NcEmsEventCatalog [[-MessageName] <String[]>] [[-Severity] <String[]>] [-Attributes <EventCatalogInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] 
```
```PowerShell
[-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
```PowerShell
Get-NcEmsEventCatalog -Template [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [-ZapiRetryCount <Int32>] 
```
```PowerShell
[<CommonParameters>]
```
```PowerShell
Get-NcEmsEventCatalog -Query <EventCatalogInfo> [-Attributes <EventCatalogInfo>] [-Controller <NcController[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] 
```
```PowerShell
[-PipelineVariable <String>] [-ZapiRetryCount <Int32>] [<CommonParameters>]
```
