New-TableButtonPDF
------------------

### Synopsis
Allows more control when adding buttons to Table

---

### Description

Allows more control when adding buttons to Table. Works only within Table or New-HTMLTable scriptblock.

---

### Examples
> EXAMPLE 1

```PowerShell
Dashboard -Name 'Dashimo Test' -FilePath $PSScriptRoot\DashboardEasy05.html -Show {
    Section -Name 'Test' -Collapsable {
        Container {
            Panel {
                Table -DataTable $Process {
                    TableButtonPDF
                    TableButtonCopy
                    TableButtonExcel
                } -Buttons @() -DisableSearch -DisablePaging -HideFooter
            }
            Panel {
                Table -DataTable $Process -Buttons @() -DisableSearch -DisablePaging -HideFooter
            }
            Panel {
                Table -DataTable $Process {
                    TableButtonPDF -PageSize A10 -Orientation landscape
                    TableButtonCopy
                    TableButtonExcel
                } -Buttons @() -DisableSearch -DisablePaging -HideFooter
            }
        }
    }
}
```

---

### Parameters
#### **Title**
Document title (appears above the table in the generated PDF). The special character * is automatically replaced with the value read from the host document's title tag.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **ButtonName**

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[String]`|false   |2       |false        |DisplayName|

#### **MessageBottom**
Message to be shown at the bottom of the table, or the caption tag if displayed at the bottom of the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **MessageTop**
Message to be shown at the top of the table, or the caption tag if displayed at the top of the table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **FileName**
File name to give the created file (plus the extension defined by the extension option). The special character * is automatically replaced with the value read from the host document's title tag.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **Extension**
The extension to give the created file name. (default .pdf)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **PageSize**
Paper size for the created PDF. This can be A3, A4, A5, LEGAL, LETTER or TABLOID. Other options are available.
Valid Values:

* 4A0
* 2A0
* A0
* A1
* A2
* A3
* A4
* A5
* A6
* A7
* A8
* A9
* A10
* B0
* B1
* B2
* B3
* B4
* B5
* B6
* B7
* B8
* B9
* B10
* C0
* C1
* C2
* C3
* C4
* C5
* C6
* C7
* C8
* C9
* C10
* RA0
* RA1
* RA2
* RA3
* RA4
* SRA0
* SRA1
* SRA2
* SRA3
* SRA4
* EXECUTIVE
* FOLIO
* LEGAL
* LETTER
* TABLOID

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **Orientation**
Paper orientation for the created PDF. This can be portrait or landscape
Valid Values:

* portrait
* landscape

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **Header**
Indicate if the table header should be included in the exported data or not.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Footer**
Indicate if the table footer should be included in the exported data or not.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
Options are based on this URL: https://datatables.net/reference/button/pdfHtml5

---

### Syntax
```PowerShell
New-TableButtonPDF [[-Title] <String>] [[-ButtonName] <String>] [[-MessageBottom] <String>] [[-MessageTop] <String>] [[-FileName] <String>] [[-Extension] <String>] [[-PageSize] <String>] [[-Orientation] <String>] [-Header] [-Footer] [<CommonParameters>]
```
