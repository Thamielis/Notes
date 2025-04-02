Format-Stream
-------------

### Synopsis
Formats input objects for display in a stream-oriented manner.

---

### Description

The Format-Stream function formats input objects for display in a stream-oriented manner. It provides flexibility in displaying data in various streams such as Output, Host, Warning, Verbose, Debug, and Information.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Process | Format-Stream -Property Name, Id -Stream Host
Displays the Name and Id properties of the processes in the Host stream.
```
> EXAMPLE 2

```PowerShell
Get-Service | Format-Stream -ExcludeProperty Status -List
Displays all service properties except Status as a list.
```

---

### Parameters
#### **InputObject**
Specifies the input objects to be formatted.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[Array]`|false   |2       |true (ByValue, ByPropertyName)|

#### **Property**
Specifies the properties of the input objects to include in the output.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |1       |false        |

#### **ExcludeProperty**
Specifies the properties of the input objects to exclude from the output.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **HideTableHeaders**
Indicates whether to hide the table headers in the output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |4       |false        |

#### **ColumnHeaderSize**
Specifies the size of the column headers in the output.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |5       |false        |

#### **AlignRight**
Indicates whether to align the output data to the right.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |6       |false        |

#### **Stream**
Specifies the stream to display the formatted data. Valid values are 'Output', 'Host', 'Warning', 'Verbose', 'Debug', and 'Information'.
Valid Values:

* Output
* Host
* Warning
* Verbose
* Debug
* Information

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **List**
Indicates whether to display the output as a list.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |8       |false        |AsList |

#### **Transpose**
Indicates whether to transpose the columns and rows of the output.

|Type      |Required|Position|PipelineInput|Aliases                                                         |
|----------|--------|--------|-------------|----------------------------------------------------------------|
|`[Switch]`|false   |9       |false        |Rotate<br/>RotateData<br/>TransposeColumnsRows<br/>TransposeData|

#### **TransposeSort**
Specifies the sorting order when transposing the data. Valid values are 'ASC', 'DESC', and 'NONE'.
Valid Values:

* ASC
* DESC
* NONE

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |10      |false        |

#### **ForegroundColor**
Specifies the foreground color of the output.
Valid Values:

* Black
* DarkBlue
* DarkGreen
* DarkCyan
* DarkRed
* DarkMagenta
* DarkYellow
* Gray
* DarkGray
* Blue
* Green
* Cyan
* Red
* Magenta
* Yellow
* White

|Type              |Required|Position|PipelineInput|Aliases|
|------------------|--------|--------|-------------|-------|
|`[ConsoleColor[]]`|false   |named   |false        |Color  |

#### **ForegroundColorRow**
Specifies the foreground color of specific rows in the output.

|Type       |Required|Position|PipelineInput|Aliases |
|-----------|--------|--------|-------------|--------|
|`[Int32[]]`|false   |named   |false        |ColorRow|

---

### Syntax
```PowerShell
Format-Stream [[-InputObject] <Array>] [[-HideTableHeaders]] [[-ColumnHeaderSize] <Int32>] [[-AlignRight]] [[-Stream] <String>] [[-List]] [[-Transpose]] [[-TransposeSort] <String>] [-ForegroundColor {Black | DarkBlue | DarkGreen | DarkCyan | DarkRed | DarkMagenta | DarkYellow | Gray | DarkGray | Blue | Green | Cyan | Red | Magenta | Yellow | White}] [-ForegroundColorRow <Int32[]>] [<CommonParameters>]
```
```PowerShell
Format-Stream [[-InputObject] <Array>] [[-Property] <String[]>] [[-HideTableHeaders]] [[-ColumnHeaderSize] <Int32>] [[-AlignRight]] [[-Stream] <String>] [[-List]] [[-Transpose]] [[-TransposeSort] <String>] [-ForegroundColor {Black | DarkBlue | DarkGreen | DarkCyan | DarkRed | DarkMagenta | DarkYellow | Gray | DarkGray | Blue | Green | Cyan | Red | Magenta | Yellow | White}] [-ForegroundColorRow <Int32[]>] [<CommonParameters>]
```
```PowerShell
Format-Stream [[-InputObject] <Array>] [[-ExcludeProperty] <String[]>] [[-HideTableHeaders]] [[-ColumnHeaderSize] <Int32>] [[-AlignRight]] [[-Stream] <String>] [[-List]] [[-Transpose]] [[-TransposeSort] <String>] [-ForegroundColor {Black | DarkBlue | DarkGreen | DarkCyan | DarkRed | DarkMagenta | DarkYellow | Gray | DarkGray | Blue | Green | Cyan | Red | Magenta | Yellow | White}] [-ForegroundColorRow <Int32[]>] [<CommonParameters>]
```
