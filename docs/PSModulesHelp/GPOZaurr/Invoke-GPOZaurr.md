Invoke-GPOZaurr
---------------

### Synopsis
Single cmdlet that provides 360 degree overview of Group Policies in Active Directory Forest.

---

### Description

Single cmdlet that provides 360 degree overview of Group Policies in Active Directory Forest with ability to pick reports and export to HTML.

---

### Examples
> EXAMPLE 1

```PowerShell
Invoke-GPOZaurr
```
> EXAMPLE 2

```PowerShell
Invoke-GPOZaurr -Type GPOOrganizationalUnit -Online -FilePath $PSScriptRoot\Reports\GPOZaurrOU.html -Exclusions @(
    '*OU=Production,DC=ad,DC=evotec,DC=pl'
)
```

---

### Parameters
#### **Exclusions**
Allows to mark as excluded some Group Policies or Organizational Units depending on type.
Can be a scriptblock or array depending on supported way by underlying report.
Not every report support exclusions.
Not every report support exclusions the same way.
Exclusions should be used only if there is single report being asked for.

|Type      |Required|Position|PipelineInput|Aliases                                |
|----------|--------|--------|-------------|---------------------------------------|
|`[Object]`|false   |2       |false        |ExcludeGroupPolicies<br/>ExclusionsCode|

#### **FilePath**
Path to the file where the report will be saved.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Type**
Type of report to be generated from a list of available reports.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **PassThru**
Returns created objects after the report is done

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HideHTML**
Do not auto open HTML report in default browser

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **HideSteps**
Do not show steps in report

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ShowError**
Show errors in HTML report. Useful in case the report is being run as Scheduled Task

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ShowWarning**
Show warnings in HTML report. Useful in case the report is being run as Scheduled Task

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

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

#### **Online**
Forces report to use online resources in HTML (using CDN most of the time), by default it is run offline, and inlines all CSS/JS code.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SplitReports**
Split report into multiple files, one for each report. This can be useful for large domains with huge reports.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **GPOName**

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[String[]]`|false   |named   |false        |Name   |

#### **GPOGUID**

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[String[]]`|false   |named   |false        |GUID   |

---

### Notes
General notes

---

### Syntax
```PowerShell
Invoke-GPOZaurr [[-Exclusions] <Object>] [-FilePath <String>] [[-Type] <String[]>] [-PassThru] [-HideHTML] [-HideSteps] [-ShowError] [-ShowWarning] [-Forest <String>] [-ExcludeDomains <String[]>] [-IncludeDomains <String[]>] [-Online] [-SplitReports] [-GPOName <String[]>] [-GPOGUID <String[]>] [<CommonParameters>]
```
