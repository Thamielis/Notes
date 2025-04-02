Out-VisioApplication
--------------------

### Synopsis

Out-VisioApplication [-OrgChart] <OrgChartDocument> [<CommonParameters>]

Out-VisioApplication [-GridLayout] <GridLayout> [<CommonParameters>]

Out-VisioApplication [-DirectedGraphDocument] <DirectedGraphDocument> [<CommonParameters>]

Out-VisioApplication [-DataTableModel] <DataTableModel> [<CommonParameters>]

Out-VisioApplication [-XmlModel] <XmlModel> [<CommonParameters>]

---

### Description

---

### Parameters
#### **DataTableModel**

|Type              |Required|Position|PipelineInput |
|------------------|--------|--------|--------------|
|`[DataTableModel]`|true    |0       |true (ByValue)|

#### **DirectedGraphDocument**

|Type                     |Required|Position|PipelineInput |
|-------------------------|--------|--------|--------------|
|`[DirectedGraphDocument]`|true    |0       |true (ByValue)|

#### **GridLayout**

|Type          |Required|Position|PipelineInput |
|--------------|--------|--------|--------------|
|`[GridLayout]`|true    |0       |true (ByValue)|

#### **OrgChart**

|Type                |Required|Position|PipelineInput |
|--------------------|--------|--------|--------------|
|`[OrgChartDocument]`|true    |0       |true (ByValue)|

#### **XmlModel**

|Type        |Required|Position|PipelineInput |
|------------|--------|--------|--------------|
|`[XmlModel]`|true    |0       |true (ByValue)|

---

### Inputs
VisioAutomation.Models.Documents.OrgCharts.OrgChartDocument
VisioAutomation.Models.Layouts.Grid.GridLayout
VisioAutomation.Models.Layouts.DirectedGraph.DirectedGraphDocument
VisioAutomation.Models.Data.DataTableModel
VisioAutomation.Models.Data.XmlModel

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Syntax
```PowerShell
syntaxItem
```
```PowerShell
----------
```
```PowerShell
{@{name=Out-VisioApplication; CommonParameters=True; parameter=System.Object[]}, @{name=Out-VisioApplication; CommonParameters=True; parameter=System.Object[]}, @{name=…
```
