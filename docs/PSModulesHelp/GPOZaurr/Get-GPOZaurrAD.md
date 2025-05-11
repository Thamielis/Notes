Get-GPOZaurrAD
--------------

### Synopsis
Retrieves Group Policy Objects (GPOs) information from Active Directory.

---

### Description

This function retrieves information about Group Policy Objects (GPOs) from Active Directory based on specified criteria such as GPO name, GPO GUID, date range, and forest details.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrAD -GPOName "ExampleGPO"
Description:
Retrieves information about a GPO with the name "ExampleGPO".
```
> EXAMPLE 2

```PowerShell
Get-GPOZaurrAD -GPOGuid "{12345678-1234-1234-1234-123456789012}"
Description:
Retrieves information about a GPO with the specified GUID.
```
> EXAMPLE 3

```PowerShell
Get-GPOZaurrAD -Forest "example.com" -IncludeDomains "domain1", "domain2" -DateRange "Last30Days"
Description:
Retrieves GPO information from the forest "example.com" for domains "domain1" and "domain2" created or modified in the last 30 days.
```

---

### Parameters
#### **GPOName**
Specifies the name of the GPO to retrieve.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GPOGuid**
Specifies the GUID of the GPO to retrieve.

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |named   |false        |GUID<br/>GPOID|

#### **Forest**
Specifies the forest name to search for GPOs.

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |named   |false        |ForestName|

#### **ExcludeDomains**
Specifies an array of domains to exclude from the search.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IncludeDomains**
Specifies an array of domains to include in the search.

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |named   |false        |Domain<br/>Domains|

#### **DateFrom**
Specifies the start date for filtering GPOs based on creation or modification date.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **DateTo**
Specifies the end date for filtering GPOs based on creation or modification date.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **DateRange**
Specifies a predefined date range for filtering GPOs based on creation or modification date.
Valid Values:

* PastHour
* CurrentHour
* PastDay
* CurrentDay
* PastMonth
* CurrentMonth
* PastQuarter
* CurrentQuarter
* Last14Days
* Last21Days
* Last30Days
* Last7Days
* Last3Days
* Last1Days

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DateProperty**
Specifies the property (WhenCreated or WhenChanged) to use for filtering GPOs based on date.
Valid Values:

* WhenCreated
* WhenChanged

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ExtendedForestInformation**
Specifies additional forest information to include in the output.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

---

### Syntax
```PowerShell
Get-GPOZaurrAD [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-DateFrom <DateTime>] [-DateTo <DateTime>] [-DateRange <String>] [-DateProperty <String[]>] [-ExtendedForestInformation <IDictionary>] [<CommonParameters>]
```
```PowerShell
Get-GPOZaurrAD [-GPOName <String>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-DateFrom <DateTime>] [-DateTo <DateTime>] [-DateRange <String>] [-DateProperty <String[]>] [-ExtendedForestInformation <IDictionary>] [<CommonParameters>]
```
```PowerShell
Get-GPOZaurrAD [-GPOGuid <String>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-DateFrom <DateTime>] [-DateTo <DateTime>] [-DateRange <String>] [-DateProperty <String[]>] [-ExtendedForestInformation <IDictionary>] [<CommonParameters>]
```
