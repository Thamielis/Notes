New-HTMLText
------------

### Synopsis
This function provides ability to add new text to the HTML file.

---

### Description

This function provides ability to add new text to the HTML file, with colors, fonts and other styling features.
It is used to add text to the HTML file with proper styling and formatting.
Please keep in mind that if parameter is not provided the defaults will be used.
The defaults can be from the body itself, or from section or other parts of HTML depending on where the text is added.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTML -TitleText 'This is a test' -FilePath "$PSScriptRoot\Example34_01.html" {
    New-HTMLHeader {
        New-HTMLText -Text "Date of this report $(Get-Date)" -Color Blue -Alignment right
    }
    New-HTMLMain {
        New-HTMLTab -TabName 'Test' {
            New-HTMLSection -HeaderText '0 section' {
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter -Simplify
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                }
            }
        }
        New-HTMLTab -TabName 'Test5' {
            New-HTMLSection -HeaderText '1 section' {
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                    # New-HTMLTable -DataTable $Processes -HideFooter
                }
                New-HTMLPanel {
                    New-HTMLTable -DataTable $Processes -HideFooter
                }
            }
        }
    }
    New-HTMLFooter {
        New-HTMLText -Text "Date of this report $(Get-Date)" -Color Blue -Alignment right
    }
} -Online -ShowHTML
```
> EXAMPLE 2

---

### Parameters
#### **TextBlock**
Defines ability to use text block instead of array

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[ScriptBlock]`|false   |1       |false        |

#### **Text**
Provide text or text array to be added to the HTML file.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Color**
Pick one of the 800 colors or provide a hex color code.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **BackGroundColor**
Pick one of the 800 colors or provide a hex color code.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **FontSize**
Provide font size. When skipped the default font size will be used.

|Type        |Required|Position|PipelineInput|Aliases|
|------------|--------|--------|-------------|-------|
|`[Object[]]`|false   |named   |false        |Size   |

#### **LineHeight**
Provide line height. When skipped the default line height will be used.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **FontWeight**
Provide font weight. When skipped the default font weight will be used. Options are: 'normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900'
Valid Values:

* normal
* bold
* bolder
* lighter
* 100
* 200
* 300
* 400
* 500
* 600
* 700
* 800
* 900

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **FontStyle**
Provide font style. When skipped the default font style will be used. Options are: 'normal', 'italic', 'oblique'
Valid Values:

* normal
* italic
* oblique

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **FontVariant**
Provide font variant. When skipped the default font variant will be used. Options are: 'normal', 'small-caps'
Valid Values:

* normal
* small-caps

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **FontFamily**
Provide font family. When skipped the default font family will be used.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Alignment**
Provide alignment. When skipped the default alignment will be used. Options are: 'left', 'right', 'center', 'justify'
Valid Values:

* left
* center
* right
* justify

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **TextDecoration**
Provide text decoration. When skipped the default text decoration will be used. Options are: 'none', 'line-through', 'overline', 'underline'
Valid Values:

* none
* line-through
* overline
* underline

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **TextTransform**
Provide text transform. When skipped the default text transform will be used. Options are: 'uppercase', 'lowercase', 'capitalize'
Valid Values:

* uppercase
* lowercase
* capitalize

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Direction**
Provide direction. When skipped the direction will not be changed. Options are: 'rtl','ltr'. By default it's 'ltr'.
Valid Values:

* rtl
* ltr

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **LineBreak**
Decides whether to add line break at the end of the text or not.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **SkipParagraph**
Skips adding div tag to make sure text is not wrapped in it. By default it wraps all text in div tag.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Display**
Allows configuring CSS display property. The display property specifies the display behavior (the type of rendering box) of an element.
Options are: 'none', 'inline', 'block', 'inline-block', 'contents','flex', 'grid', 'inline-flex', 'inline-grid', 'inline-table', 'list-item', 'run-in',
'table', 'table-caption', 'table-column-group', 'table-header-group', 'table-footer-group', 'table-row-group', 'table-cell', 'table-column', 'table-row'
Valid Values:

* none
* inline
* block
* inline-block
* contents
* flex
* grid
* inline-flex
* inline-grid
* inline-table
* list-item
* run-in
* table
* table-caption
* table-column-group
* table-header-group
* table-footer-group
* table-row-group
* table-cell
* table-column
* table-row

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Opacity**
The opacity property sets the opacity level for an element. Value between 0 and 1. 1 is default.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Double[]]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-HTMLText [[-TextBlock] <ScriptBlock>] [-Text <String[]>] [-Color <String[]>] [-BackGroundColor <String[]>] [-FontSize <Object[]>] [-LineHeight <String[]>] [-FontWeight <String[]>] [-FontStyle <String[]>] [-FontVariant <String[]>] [-FontFamily <String[]>] [-Alignment <String[]>] [-TextDecoration <String[]>] [-TextTransform <String[]>] [-Direction <String[]>] [-LineBreak] [-SkipParagraph] [-Display <String[]>] [-Opacity <Double[]>] [<CommonParameters>]
```
