New-OrgChartNode
----------------

### Synopsis
Short description

---

### Description

Long description

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTML {
    New-HTMLOrgChart {
        New-OrgChartNode -Name 'Test' -Title 'Test2' {
            New-OrgChartNode -Name 'Test' -Title 'Test2'
            New-OrgChartNode -Name 'Test' -Title 'Test2'
            New-OrgChartNode -Name 'Test' -Title 'Test2' {
                New-OrgChartNode -Name 'Test' -Title 'Test2'
            }
        }
    } -AllowExport -ExportExtension pdf -Draggable
} -FilePath $PSScriptRoot\Example-OrgChart01.html -ShowHTML -Online
```

---

### Parameters
#### **Children**
Define children of the node by specifying nested nodes (self-nesting)

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Name**
Name of the node

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Title**
Title of the node

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **TitleBackgroundColor**
[string] $ClassName,

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **TitleBorderColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **TitleColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **ContentBackgroundColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **ContentBorderColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **ContentColor**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-OrgChartNode [[-Children] <ScriptBlock>] [[-Name] <String>] [[-Title] <String>] [[-TitleBackgroundColor] <String>] [[-TitleBorderColor] <String>] [[-TitleColor] <String>] [[-ContentBackgroundColor] <String>] [[-ContentBorderColor] <String>] [[-ContentColor] <String>] [<CommonParameters>]
```
