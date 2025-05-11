ConvertFrom-ExcelSheet
----------------------

### Synopsis
Exports Sheets from Excel Workbooks to CSV files.

---

### Description

This command provides a convenient way to run Import-Excel @ImportParameters \| Select-Object @selectParameters \| export-Csv @ ExportParameters It can take the parameters -AsText , as used in Import-Excel, )Properties & -ExcludeProperties as used in Select-Object and -Append, -Delimiter and -Encoding as used in Export-CSV

---

### Related Links
* [Online Version:](Online Version:)

---

### Examples
> Example 1

```PowerShell
PS C:\> ConvertFrom-ExcelSheet Path .\__tests__\First10Races.xlsx -OutputPath .. -AsText GridPosition,date
First10Races.xlsx contains information about Motor races. The race date and grid (starting) position are stored with custom formats. The command specifies the path to the file, and the directory to create the output file, and specifies that the columns "GridPosition" and "Date" should be treated as text to preserve their formatting
```
> Example 2

```PowerShell
PS C:\> ConvertFrom-ExcelSheet Path .\__tests__\First10Races.xlsx -OutputPath .. -AsText "GridPosition" -Property driver, @{n="date"; e={[datetime]::FromOADate($_.Date).tostring("#MM/dd/yyyy#")}} , FinishPosition, GridPosition
This uses the same file as example 1. Because the race date has a custom format, it imports as a number, The requirement is to create a CSV file with the Driver, a specially formatted Date, FinishPostion and GridPostion (keeping its custom formatting). The command specifies the path to the file, and the directory to create the output file, specifies that the column "GridPosition" should be treated as text instead of a number, and the output properties should be Driver, a calculated "date" field, FinishPosition and GridPsition. FromOADate converts the dates used by Excel (Days since Jan 1 1900) to a datetime object.
```

---

### Parameters
#### **Append**
Use this parameter to have the export add output to the end of the file. Without this parameter, the command replaces the file contents without warning.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **AsText**
AsText allows selected columns to be returned as the text displayed in their cells, instead of their value. (* is supported as a wildcard.)

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |8       |False        |

#### **AsDate**
Not all date formats are recognized as indicating the number in the cell represents a date AsDate forces the number which would be returned to be converted to a date. (* is supported as a wildcard.)

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |8       |False        |

#### **Delimiter**
Selects , or ; as the delimeter for the exported data - if not specified , is used by default.
Valid Values:

* ;
* ,

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |False        |

#### **Encoding**
Sets the text encoding for the output data file; UTF8 bu default
Valid Values:

* ASCII
* BigEndianUniCode
* Default
* OEM
* UniCode
* UTF32
* UTF7
* UTF8

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Encoding]`|false   |3       |False        |

#### **ExcludeProperty**
Specifies the properties that to exclude from the export. Wildcards are permitted. This parameter is effective only when the command also includes the Property parameter.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |7       |False        |

#### **Extension**
Sets the file extension for the exported data, defaults to CSV
Valid Values:

* .txt
* .log
* .csv

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |False        |

#### **OutputPath**
The directory where the output file(s) will be created. The file name(s) will match the name of the workbook page which contained the data.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |False        |

#### **Path**
The path to the .XLSX file which will be exported.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |0       |False        |

#### **Property**
Specifies the properties to select. Wildcards are permitted - the default is "*". The value of the Property parameter can be a new calculated property, and follows the same pattern as Select-Item

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |6       |False        |

#### **SheetName**
The name of a sheet to export, or a regular expression which is used to identify sheets

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |False        |

---

### Inputs
None

---

### Outputs
* [Object](https://learn.microsoft.com/en-us/dotnet/api/System.Object)

---

### Notes

---

### Syntax
```PowerShell
ConvertFrom-ExcelSheet [-Path] <String> [[-OutputPath] <String>] [[-SheetName] <String>] [[-Encoding] <Encoding>] [[-Extension] {.txt | .log | .csv}] [[-Delimiter] {; |  | }] [[-Property] <Object>] [[-ExcludeProperty] <Object>] [[-AsText] <String[]>] [[-AsDate] <String[]>] [-Append] [<CommonParameters>]
```
