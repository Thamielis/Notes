New-DiagramEvent
----------------

### Synopsis
Allows to connect Diagrams with Tables using Events.

---

### Description

Allows to connect Diagrams with Tables using Events.

---

### Examples
> EXAMPLE 1

```PowerShell
$Processes = Get-Process | Select-Object -First 3 -Property Name, ProcessName, Id, FileVersion, WorkingSet
$TableID = 'RandomID'
New-HTML -TitleText 'My Title' -Online -FilePath $PSScriptRoot\Example30-LinkedProcesses.html -ShowHTML {
    New-HTMLSection -Invisible {
        New-HTMLPanel {
            New-HTMLTable -DataTable $Processes -DataTableID $TableID
        }
        New-HTMLPanel {
            New-HTMLDiagram {
                New-DiagramEvent -ID $TableID -ColumnID 2
                New-DiagramNode -Label 'Processes' -IconBrands delicious
                foreach ($_ in $Processes) {
                    New-DiagramNode -Label $_.ProcessName -Id $_.Id -To 'Processes'
                }
            }
        }
    }
}
```

---

### Parameters
#### **ID**
ID of the table to connect with the diagram.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **ColumnID**
Column Number of the table to connect with the diagram.

|Type          |Required|Position|PipelineInput|
|--------------|--------|--------|-------------|
|`[Nullable`1]`|false   |2       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-DiagramEvent [[-ID] <String>] [[-ColumnID] <Nullable`1>] [<CommonParameters>]
```
