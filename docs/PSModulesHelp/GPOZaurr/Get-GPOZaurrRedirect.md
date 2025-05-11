Get-GPOZaurrRedirect
--------------------

### Synopsis
Command to detect if GPOs have correct path in SYSVOL, or someone changed it manually.

---

### Description

Command to detect if GPOs have correct path in SYSVOL, or someone changed it manually.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrRedirect | Format-Table
```

---

### Parameters
#### **GPOName**
Provide GPO name to search for. By default command returns all GPOs

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **GPOGuid**
Provide GPO GUID to search for. By default command returns all GPOs

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |named   |false        |GUID<br/>GPOID|

#### **Forest**
Target different Forest, by default current forest is used

|Type      |Required|Position|PipelineInput|Aliases   |
|----------|--------|--------|-------------|----------|
|`[String]`|false   |named   |false        |ForestName|

#### **ExcludeDomains**
Exclude domain from search, by default whole forest is scanned

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IncludeDomains**
Include only specific domains, by default whole forest is scanned

|Type        |Required|Position|PipelineInput|Aliases           |
|------------|--------|--------|-------------|------------------|
|`[String[]]`|false   |named   |false        |Domain<br/>Domains|

#### **DateFrom**
Provide a date from which to start the search, by default the last X days are used

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **DateTo**
Provide a date to which to end the search, by default the last X days are used

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|false   |named   |false        |

#### **DateRange**
Provide a date range to search for, by default the last X days are used
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
Choose a date property. It can be WhenCreated or WhenChanged or both. By default whenCreated is used for comparison purposes
Valid Values:

* WhenCreated
* WhenChanged

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ExtendedForestInformation**
Ability to provide Forest Information from another command to speed up processing

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Get-GPOZaurrRedirect [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-DateFrom <DateTime>] [-DateTo <DateTime>] [-DateRange <String>] [-DateProperty <String[]>] [-ExtendedForestInformation <IDictionary>] [<CommonParameters>]
```
```PowerShell
Get-GPOZaurrRedirect [-GPOName <String>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-DateFrom <DateTime>] [-DateTo <DateTime>] [-DateRange <String>] [-DateProperty <String[]>] [-ExtendedForestInformation <IDictionary>] [<CommonParameters>]
```
```PowerShell
Get-GPOZaurrRedirect [-GPOGuid <String>] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-DateFrom <DateTime>] [-DateTo <DateTime>] [-DateRange <String>] [-DateProperty <String[]>] [-ExtendedForestInformation <IDictionary>] [<CommonParameters>]
```
