Get-GPOZaurrUpdates
-------------------

### Synopsis
Gets the list of GPOs created or updated in the last X number of days.

---

### Description

Gets the list of GPOs created or updated in the last X number of days.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-GPOZaurrUpdates -DateRange Last14Days -DateProperty WhenCreated, WhenChanged -Verbose -IncludeDomains 'ad.evotec.pl' | Format-List
```
> EXAMPLE 2

```PowerShell
Get-GPOZaurrUpdates -DateRange Last14Days -DateProperty WhenCreated -Verbose | Format-Table
```

---

### Parameters
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
|`[DateTime]`|true    |named   |false        |

#### **DateTo**
Provide a date to which to end the search, by default the last X days are used

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[DateTime]`|true    |named   |false        |

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
|`[String]`|true    |named   |false        |

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
Get-GPOZaurrUpdates [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] -DateRange <String> [-DateProperty <String[]>] [-ExtendedForestInformation <IDictionary>] [<CommonParameters>]
```
```PowerShell
Get-GPOZaurrUpdates [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] -DateFrom <DateTime> -DateTo <DateTime> [-DateProperty <String[]>] [-ExtendedForestInformation <IDictionary>] [<CommonParameters>]
```
