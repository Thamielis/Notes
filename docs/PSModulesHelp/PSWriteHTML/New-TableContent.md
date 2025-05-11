New-TableContent
----------------

### Synopsis
Provide a way to style or overwrite the table content with new content or style

---

### Description

Provide a way to style or overwrite the table content with new content or style

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTML -TitleText "Example37 - Word Breaking" -FilePath "$PSScriptRoot\Example37.html" {
    New-HTMLSection -HeaderText "Word Break for whole table" -HeaderTextAlignment center -Content {
        New-HTMLTable -DataTable $(Get-Process | Select-Object -First 5) -WordBreak 'break-word'
    }
    New-HTMLSection -HeaderText "Word Break per column" -HeaderTextAlignment center -Content {
        New-HTMLTable -DataTable $(Get-Process | Select-Object -First 5) {
            New-TableContent -WordBreak break-all -ColumnName 'Path'
        }
    }
    New-HTMLSection -HeaderText "No word break" -HeaderTextAlignment center -Content {
        New-HTMLTable -DataTable $(Get-Process | Select-Object -First 5)
    }
} -Online -ShowHTML
```
> EXAMPLE 2

```PowerShell
$Values = @(
    [PSCustomObject] @{
        Test1 = 1
        Test2 = 2
        Test3 = 3
        Test4 = 1
    }
    [PSCustomObject] @{
        Test1 = 1
        Test2 = 2
        Test3 = 3
        Test4 = 1
    }
    [PSCustomObject] @{
        Test1 = 1
        Test2 = 2
        Test3 = 3
        Test4 = 2
    }
    [PSCustomObject] @{
        Test1 = 1
        Test2 = 2
        Test3 = 3
        Test4 = 1
    }
    [PSCustomObject] @{
        Test1 = 1
        Test2 = 2
        Test3 = 3
        Test4 = 1
    }
    [PSCustomObject] @{
        Test1 = 1
        Test2 = 2
        Test3 = 3
        Test4 = 2
    }
)
New-HTML -TitleText "Example41 - Table" -FilePath "$PSScriptRoot\Example41.html" {
    New-HTMLSection -HeaderText "Testing" -HeaderTextAlignment center -Content {
        New-HTMLTable -DataTable $Values {
            for ($i = 0; $i -le $Values.Count; $i++) {
                if ($Values[$i].Test1 -ne $Values[$i].Test4) {
                    New-TableContent -BackGroundColor Red -ColumnName 'Test4' -RowIndex ($i+1)
                }
            }
        }
    }
} -Online -ShowHTML
```

---

### Parameters
#### **ColumnName**
Define column name to search where to replace the content or style. Conflicts with ColumnIndex. Choose one or the other.

|Type        |Required|Position|PipelineInput|Aliases                       |
|------------|--------|--------|-------------|------------------------------|
|`[String[]]`|false   |1       |false        |ColumnNames<br/>Names<br/>Name|

#### **ColumnIndex**
Define column index to search where to replace the content or style. Conflicts with ColumnName. Choose one or the other.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |2       |false        |

#### **RowIndex**
Define row index to search where to replace the content or style.

|Type       |Required|Position|PipelineInput|
|-----------|--------|--------|-------------|
|`[Int32[]]`|false   |3       |false        |

#### **Text**
Overwrite the text content of the cell. If not defined the cell will be styled only.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |4       |false        |

#### **Color**
Pick one of the 800 colors or provide a hex color code.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **BackGroundColor**
Pick one of the 800 colors or provide a hex color code.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **FontSize**
Provide new font size. When skipped the font size will not be changed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |7       |false        |

#### **FontWeight**
Provide new font weight. When skipped the font weight will not be changed. Options are: 'normal', 'bold', 'bolder', 'lighter', '100', '200', '300', '400', '500', '600', '700', '800', '900'
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

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

#### **FontStyle**
Provide new font style. When skipped the font style will not be changed. Options are: 'normal', 'italic', 'oblique'
Valid Values:

* normal
* italic
* oblique

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |9       |false        |

#### **FontVariant**
Provide new font variant. When skipped the font variant will not be changed. Options are: 'normal', 'small-caps'
Valid Values:

* normal
* small-caps

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **FontFamily**
Provide new font family. When skipped the font family will not be changed.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |11      |false        |

#### **Alignment**
Provide new alignment. When skipped the alignment will not be changed. Options are: 'left', 'center', 'right', 'justify'
Valid Values:

* left
* center
* right
* justify

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |12      |false        |

#### **TextDecoration**
Provide new text decoration. When skipped the text decoration will not be changed. Options are: 'none', 'line-through', 'overline', 'underline'
Valid Values:

* none
* line-through
* overline
* underline

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |13      |false        |

#### **TextTransform**
Provide new text transform. When skipped the text transform will not be changed. Options are: 'uppercase', 'lowercase', 'capitalize'
Valid Values:

* uppercase
* lowercase
* capitalize

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |14      |false        |

#### **Direction**
Provide new direction. When skipped the direction will not be changed. Options are: 'rtl','ltr'. By default it's 'ltr'.
Valid Values:

* rtl
* ltr

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |15      |false        |

#### **WordBreak**
Provide new word break. When skipped the word break will not be changed. Options are: 'normal', 'break-all', 'keep-all', 'break-word'
Valid Values:

* normal
* break-all
* keep-all
* break-word

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |16      |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-TableContent [[-ColumnName] <String[]>] [[-ColumnIndex] <Int32[]>] [[-RowIndex] <Int32[]>] [[-Text] <String[]>] [[-Color] <String>] [[-BackGroundColor] <String>] [[-FontSize] <Object>] [[-FontWeight] <String>] [[-FontStyle] <String>] [[-FontVariant] <String>] [[-FontFamily] <String>] [[-Alignment] <String>] [[-TextDecoration] <String>] [[-TextTransform] <String>] [[-Direction] <String>] [[-WordBreak] <String>] [<CommonParameters>]
```
