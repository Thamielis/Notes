New-HTML
--------

### Synopsis
Building block for creating HTML elements. A starting point for all other cmdlets in PSWriteHTML except Out-HtmlView.

---

### Description

Building block for creating HTML elements. A starting point for all other cmdlets in PSWriteHTML except Out-HtmlView.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTML {
    New-HTMLSection -HeaderText 'Donut Charts - Defaults' -CanCollapse {
        New-HTMLPanel {
            New-HTMLChart {
                New-ChartToolbar -Download
                #New-ChartBarOptions -Gradient
                New-ChartLegend -Name 'Time', 'Money', 'Taxes', 'test'
                New-ChartBar -Name 'Test' -Value 1, 2, 3, 0
                New-ChartBar -Name 'Test1' -Value 2, 5, 7, 0
                New-ChartBar -Name 'Test2' -Value 3, 1, 50, 5
            }
        }
        New-HTMLPanel {
            New-HTMLChart {
                New-ChartToolbar -Download
                #New-ChartBarOptions -Gradient
                New-ChartLegend -Name 'Time', 'Money', 'Taxes' -Color Red, Yellow, Green
                New-ChartBar -Name 'Test' -Value 1, 2, 3
                New-ChartBar -Name 'Test1' -Value 2, 5, 7
                New-ChartBar -Name 'Test2' -Value 3, 1, 2
            }
        }
        New-HTMLPanel {
            New-HTMLChart {
                New-ChartToolbar -Download
                New-ChartBarOptions -Type barStacked
                New-ChartLegend -Name 'Time', 'Money', 'Taxes' -Color Red, Yellow, Green
                New-ChartBar -Name 'Test' -Value 1, 2, 3
                New-ChartBar -Name 'Test1' -Value 2, 5, 7
                New-ChartBar -Name 'Test2' -Value 3, 1, 2
            }
        }
    }
} -ShowHTML -FilePath $PSScriptRoot\Example-ChartBarNext.html -Online -Format
```
> EXAMPLE 2

```PowerShell
New-HTML -TitleText "Testing HideButtons" -Online -FilePath "$PSScriptRoot\Example7_06.html" {
    # Hide Buttons
    New-HTMLSection -HeaderText "Hide Buttons" -Content {
        New-HTMLTable -DataTable $Table -HideButtons
    }
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText "Hide Buttons" -Content {
            New-HTMLTable -DataTable $Table -HideButtons -Transpose
        }
        New-HTMLSection -HeaderText 'Some chart' {
            New-HTMLChart {
                New-ChartPie -Name 'Passed' -Value 5 -Color $ColorPassed
                New-ChartPie -Name 'Failed' -Value 10 -Color $ColorFailed
                New-ChartPie -Name 'Skipped' -Value 15 -Color $ColorSkipped
            }
        }
    }
    New-HTMLSection -HeaderText "Code used to generate above tables" -Content {
        New-HTMLCodeBlock {
            New-HTMLSection -HeaderText "Hide Buttons" -Content {
                New-HTMLTable -DataTable $Table -HideButtons
            }
New-HTMLSection -Invisible {
                New-HTMLSection -HeaderText "Hide Buttons" -Content {
                    New-HTMLTable -DataTable $Table -HideButtons -Transpose
                }
                New-HTMLSection -HeaderText 'Some chart' {
                    New-HTMLChart {
                        New-ChartPie -Name 'Passed' -Value 5 -Color $ColorPassed
                        New-ChartPie -Name 'Failed' -Value 10 -Color $ColorFailed
                        New-ChartPie -Name 'Skipped' -Value 15 -Color $ColorSkipped
                    }
                }
            }
        }
    }
} -ShowHTML
```

---

### Parameters
#### **HtmlData**
Provides ability to specify one or more elements within HTML. Using New-HTML without it, makes no larger sense.

|Type           |Required|Position|PipelineInput|Aliases|
|---------------|--------|--------|-------------|-------|
|`[ScriptBlock]`|false   |1       |false        |Content|

#### **Online**
Enables or Disables linking of CSS/JS. When Online is enabled that means that the CSS/JS files are loaded from the CDN. When Online is disabled that means that the CSS/JS files are all loaded from same HTML file (making it very large).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **TitleText**
Title of the HTML page

|Type      |Required|Position|PipelineInput|Aliases       |
|----------|--------|--------|-------------|--------------|
|`[String]`|false   |named   |false        |Name<br/>Title|

#### **Author**
Defines the author information in the HTML file (meta information). If not specified, the author information is skipped.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **DateFormat**
Defines the date format in the HTML file (meta information). Default is 'yyyy-MM-dd HH:mm:ss'

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **AutoRefresh**
Defines if the page should be refreshed automatically every X seconds.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **FilePath**
Provides the path to the file to be created.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ShowHTML**
Opens HTML in browser when generating of HTML is done. When no filepath is provided it uses temporary path instead. Good for testing.

|Type      |Required|Position|PipelineInput|Aliases      |
|----------|--------|--------|-------------|-------------|
|`[Switch]`|false   |named   |false        |Show<br/>Open|

#### **Encoding**
Provides ability to choose encoding of the HTML file. Not really required to use, as UTF8 is the default. Options available: 'Unknown', 'String', 'Unicode', 'Byte', 'BigEndianUnicode', 'UTF8', 'UTF7', 'UTF32', 'Ascii', 'Default', 'Oem', 'BigEndianUTF32'
Valid Values:

* Unknown
* String
* Unicode
* Byte
* BigEndianUnicode
* UTF8
* UTF7
* UTF32
* Ascii
* Default
* Oem
* BigEndianUTF32

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |false        |

#### **FavIcon**
Provides ability to add a favicon to the HTML page. Can be a link or file path

|Type   |Required|Position|PipelineInput|
|-------|--------|--------|-------------|
|`[Uri]`|false   |named   |false        |

#### **UseCssLinks**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UseJavaScriptLinks**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Temporary**
Forces use of temporary file name. Doesn't work with -FilePath parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **AddComment**
Adds additional commands to the generated HTML file. This is useful for tracking or knowing what is what.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Format**
Formats HTML output (including CSS/JS). Requires PSParseHTML to be installed and available.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Minify**
Minifies HTML output (including CSS/JS). Requires PSParseHTML to be installed and available.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-HTML [[-HtmlData] <ScriptBlock>] [-Online] [-TitleText <String>] [-Author <String>] [-DateFormat <String>] [-AutoRefresh <Int32>] [-FilePath <String>] [-ShowHTML] [-Encoding <Object>] [-FavIcon <Uri>] [-UseCssLinks] [-UseJavaScriptLinks] [-Temporary] [-AddComment] [-Format] [-Minify] [<CommonParameters>]
```
