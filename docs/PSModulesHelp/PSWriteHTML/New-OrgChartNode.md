New-OrgChartNode
----------------

### Synopsis
Creates a new organizational chart node.

---

### Description

This function creates a new node for an organizational chart. It allows defining children nodes by specifying nested nodes for self-nesting.

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
Specifies the children of the node by defining nested nodes for self-nesting.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Name**
Specifies the name of the node.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Title**
Specifies the title of the node.

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
Additional information

---

### Syntax
```PowerShell
New-OrgChartNode [[-Children] <ScriptBlock>] [[-Name] <String>] [[-Title] <String>] [[-TitleBackgroundColor] <String>] [[-TitleBorderColor] <String>] [[-TitleColor] <String>] [[-ContentBackgroundColor] <String>] [[-ContentBorderColor] <String>] [[-ContentColor] <String>] [<CommonParameters>]
```
