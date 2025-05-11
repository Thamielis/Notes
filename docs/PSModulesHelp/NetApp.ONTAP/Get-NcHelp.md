Get-NcHelp
----------

### Synopsis
List cmdlets in the clustered ONTAP DataONTAP module, filtered by API, category, or cmdlet name.

---

### Description

List cmdlets in the clustered ONTAP DataONTAP module, filtered by API, category, or cmdlet name.

This cmdlet provides a convenient mechanism to determine which DataONTAP cmdlets are available by supporting filtering on API or category.

---

### Related Links
* [Show-NcHelp](Show-NcHelp)

---

### Examples
> Example 1

Get-NcHelp
List all clustered ONTAP cmdlets in the Data ONTAP PowerShell toolkit.

Name                        Api                    Category
----                        ---                    --------
Confirm-NcAggrSpareLow      {aggr-check-spare-low} aggr
Connect-NcController                               toolkit
...

---

### Parameters
#### **Cmdlet**
Specify one or more cmdlet names to list only those cmdlets.  Wildcards are supported.

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[String[]]`|false   |1       |false        |Name   |

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

#### **Category**
Specify one or more category names to find all cmdlets in any of them.  Wildcards are supported.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |false        |

#### **Api**
Specify one or more API names to find all cmdlets that use any of them.  Wildcards are supported.

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[String[]]`|true    |named   |false        |Zapi   |

#### **ApiList**
Specify to get a listing of all APIs supported by the clustered ONTAP toolkit module.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **CategoryList**
Specify to get a listing of all cmdlet categories supported by the clustered ONTAP toolkit module.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |false        |

#### **Family**
Specify to restrict results to "vserver" or "cluster" or both.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |false        |

---

### Inputs

---

### Outputs
* DataONTAP.PowerShell.SDK.Cmdlets.Help.HelpInfo

---

### Notes
Category: toolkit

---

### Syntax
```PowerShell
Get-NcHelp [[-Cmdlet] <String[]>] [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [<CommonParameters>]
```
```PowerShell
Get-NcHelp -Category <String[]> [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [<CommonParameters>]
```
```PowerShell
Get-NcHelp -Api <String[]> [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [<CommonParameters>]
```
```PowerShell
Get-NcHelp -ApiList [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [<CommonParameters>]
```
```PowerShell
Get-NcHelp -CategoryList [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [<CommonParameters>]
```
```PowerShell
Get-NcHelp -Family <String[]> [-InformationAction <ActionPreference>] [-InformationVariable <String>] [-PipelineVariable <String>] [<CommonParameters>]
```
