Import-Excel
------------

### Synopsis
Create custom objects from the rows in an Excel worksheet.

---

### Description

The Import-Excel cmdlet creates custom objects from the rows in an Excel worksheet. Each row is represented as one object.

This is possible without installing Microsoft Excel by using the .NET library 'EPPLus.dll'.

By default, the property names of the objects are retrieved from the column headers. Because an object cannot have a blank property name, only columns with column headers will be imported.

If the default behavior is not desired and you want to import the complete worksheet 'as is', the parameter '-NoHeader' can be used. In case you want to provide your own property names, you can use the parameter '-HeaderName'.

---

### Related Links
* [Online Version:](Online Version:)

* [https://github.com/dfinke/ImportExcel](https://github.com/dfinke/ImportExcel)

---

### Examples
> EXAMPLE 1

----------------------------------------------
| File: Movies.xlsx     -      Sheet: Actors |
----------------------------------------------
|           A           B            C       |
|1     First Name                 Address    |
|2     Chuck         Norris       California |
|3     Jean-Claude   Vandamme     Brussels   |
----------------------------------------------

PS C:> Import-Excel -Path 'C:\Movies.xlsx' -WorkSheetname Actors

First Name: Chuck
Address   : California

First Name: Jean-Claude
Address   : Brussels
Import data from an Excel worksheet. One object is created for each row. The property names of the objects consist of the column names defined in the first row. In case a column doesn't have a column header (usually in row 1 when '-StartRow' is not used), then the unnamed columns will be skipped and the data in those columns will not be imported.

Notice that column 'B' is not imported because there's no value in cell 'B1' that can be used as property name for the objects.
> EXAMPLE 2

----------------------------------------------
| File: Movies.xlsx     -      Sheet: Actors |
----------------------------------------------
|           A           B            C       |
|1     First Name                 Address    |
|2     Chuck         Norris       California |
|3     Jean-Claude   Vandamme     Brussels   |
----------------------------------------------

PS\> Import-Excel -Path 'C:\Movies.xlsx' -WorkSheetname Actors -NoHeader

P1: First Name
P2:
P3: Address

P1: Chuck
P2: Norris
P3: California

P1: Jean-Claude
P2: Vandamme
P3: Brussels
Imports the complete Excel worksheet 'as is' by using the '-NoHeader' switch. One object is created for each row. The property names of the objects will be automatically generated (P1, P2, P3, ..).

Notice that the column header (row 1) is imported as an object too.
> EXAMPLE 3

----------------------------------------------------------
| File: Movies.xlsx            -           Sheet: Movies |
----------------------------------------------------------
|           A            B            C          D       |
|1     The Bodyguard   1992           9                  |
|2     The Matrix      1999           8                  |
|3                                                       |
|4     Skyfall         2012           9                  |
----------------------------------------------------------

PS\> Import-Excel -Path 'C:\Movies.xlsx' -WorkSheetname Movies -HeaderName 'Movie name', 'Year', 'Rating', 'Genre'

Movie name: The Bodyguard
Year      : 1992
Rating    : 9
Genre     :

Movie name: The Matrix
Year      : 1999
Rating    : 8
Genre     :

Movie name:
Year      :
Rating    :
Genre     :

Movie name: Skyfall
Year      : 2012
Rating    : 9
Genre     :
This imports data from an Excel worksheet, and as before one object is created for each row. The property names for the objects are defined in the parameter '-HeaderName'. The properties are named starting from the most left column (A) to the right. In case no value is present in one of the columns, that property will have an empty value.

Notice that empty rows are imported and that data for the property 'Genre' is not present in the worksheet. As such, the 'Genre' property will be blank for all objects.
> EXAMPLE 4

----------------------------------------------------------
| File: Movies.xlsx            -           Sheet: Movies |
----------------------------------------------------------
|           A            B            C          D       |
|1     The Bodyguard   1992           9                  |
|2     The Matrix      1999           8                  |
|3                                                       |
|4     Skyfall         2012           9                  |
----------------------------------------------------------

PS\> Import-Excel -Path 'C:\Movies.xlsx' -WorkSheetname Movies -NoHeader -DataOnly

P1: The Bodyguard
P2: 1992
P3: 9

P1: The Matrix
P2: 1999
P3: 8

P1: Skyfall
P2: 2012
P3: 9
Import data from an Excel worksheet, and one object is created for each non-blank row. The property names of the objects (P1, P2, P3, ..) are automatically generated by using the switch '-NoHeader' . The switch '-DataOnly' will speed up the import because empty rows and empty columns are not imported.

Notice that empty rows and empty columns are not imported.
> EXAMPLE 5

----------------------------------------------------------
| File: Movies.xlsx            -           Sheet: Actors |
----------------------------------------------------------
|           A           B           C            D       |
|1     Chuck                     Norris       California |
|2                                                       |
|3     Jean-Claude               Vandamme     Brussels   |
----------------------------------------------------------

PS\> Import-Excel -Path 'C:\Movies.xlsx' -WorkSheetname Actors -DataOnly -HeaderName 'FirstName', 'SecondName', 'City' -StartRow 2

FirstName : Jean-Claude
SecondName: Vandamme
City      : Brussels
Import data from an Excel worksheet. One object is created for each row. The property names are provided with the '-HeaderName' parameter. The import will start from row 2 and empty columns and rows are not imported.

Notice that only 1 object is imported with only 3 properties. Column B and row 2 are empty and have been disregarded by using the switch '-DataOnly'. The property names have been named with the values provided with the parameter '-HeaderName'. Row number 1 with 'Chuck Norris' has not been imported, because we started the import from row 2 with the parameter '-StartRow 2'.
> EXAMPLE 6

PS\> ,(Import-Excel -Path .\SysTables_AdventureWorks2014.xlsx) |
    Write-SqlTableData -ServerInstance localhost\DEFAULT -Database BlankDB -SchemaName dbo -TableName MyNewTable_fromExcel -Force
Imports data from an Excel file and pipes the result to the Write-SqlTableData command to be INSERTed into a table in a SQL Server database.

The ",( ... )" around the Import-Excel command allows all rows to be imported from the Excel file, prior to pipelining to the Write-SqlTableData cmdlet. This helps prevent a RBAR scenario and is important when trying to import thousands of rows.

The -Force parameter will be ignored if the table already exists. However, if a table is not found that matches the values provided by -SchemaName and -TableName parameters, it will create a new table in SQL Server database.

The Write-SqlTableData cmdlet will inherit the column names & datatypes for the new table from the object being piped in. NOTE: You need to install the SqlServer module from the PowerShell Gallery in oder to get the Write-SqlTableData cmdlet.

---

### Parameters
#### **Path**
Specifies the path to the Excel file.

|Type      |Required|Position|PipelineInput                 |Aliases |
|----------|--------|--------|------------------------------|--------|
|`[String]`|true    |1       |True (ByPropertyName, ByValue)|FullName|

#### **ExcelPackage**
Instead of specifying a path, provides an Excel Package object (from Open-ExcelPackage). Using this avoids re-reading the whole file when importing multiple parts of it.
To allow multiple read operations Import-Excel does NOT close the package, and you should use Close-ExcelPackage -noSave to close it.

|Type            |Required|Position|PipelineInput|
|----------------|--------|--------|-------------|
|`[ExcelPackage]`|true    |named   |False        |

#### **WorksheetName**
Specifies the name of the worksheet in the Excel workbook to import. By default, if no name is provided, the first worksheet will be imported.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|false   |2       |False        |Sheet  |

#### **HeaderName**
Specifies custom property names to use, instead of the values defined in the column headers of the TopRow.
If you provide fewer header names than there are columns of data in the worksheet, then data will only be imported from that number of columns - the others will be ignored.
If you provide more header names than there are columns of data in the worksheet, it will result in blank properties being added to the objects returned.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |False        |

#### **NoHeader**
Automatically generate property names (P1, P2, P3, ..) instead of the ones defined in the column headers of the TopRow.
This switch is best used when you want to import the complete worksheet 'as is' and are not concerned with the property names.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **StartRow**
The row from where we start to import data, all rows above the StartRow are disregarded. By default this is the first row.
When the parameters '-NoHeader' and '-HeaderName' are not provided, this row will contain the column headers that will be used as property names. If either is provided, the property names are automatically created and this row will be treated as a regular row containing data.

|Type     |Required|Position|PipelineInput|Aliases             |
|---------|--------|--------|-------------|--------------------|
|`[Int32]`|false   |named   |False        |HeaderRow<br/>TopRow|

#### **EndRow**
By default all rows up to the last cell in the sheet will be imported. If specified, import stops at this row.

|Type     |Required|Position|PipelineInput|Aliases              |
|---------|--------|--------|-------------|---------------------|
|`[Int32]`|false   |named   |False        |StopRow<br/>BottomRow|

#### **StartColumn**
The number of the first column to read data from (1 by default).

|Type     |Required|Position|PipelineInput|Aliases   |
|---------|--------|--------|-------------|----------|
|`[Int32]`|false   |named   |False        |LeftColumn|

#### **EndColumn**
By default the import reads up to the last populated column, -EndColumn tells the import to stop at an earlier number.

|Type     |Required|Position|PipelineInput|Aliases    |
|---------|--------|--------|-------------|-----------|
|`[Int32]`|false   |named   |False        |RightColumn|

#### **DataOnly**
Import only rows and columns that contain data, empty rows and empty columns are not imported.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **AsText**
Normally Import-Excel returns the Cell values. AsText allows selected columns to be returned as the text displayed in their cells. (* is supported as a wildcard.)

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **AsDate**
Not all date formats are recognized as indicating the number in the cell represents a date AsDate forces the number which would be returned to be converted to a date. (* is supported as a wildcard.)

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |False        |

#### **Password**
Accepts a string that will be used to open a password protected Excel file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |False        |

---

### Notes

---

### Syntax
```PowerShell
Import-Excel [-Path] <String> [[-WorksheetName] <String>] -NoHeader [-StartRow <Int32>] [-EndRow <Int32>] [-StartColumn <Int32>] [-EndColumn <Int32>] [-DataOnly] [-AsText <String[]>] [-AsDate <String[]>] [-Password <String>] [<CommonParameters>]
```
```PowerShell
Import-Excel [-Path] <String> [[-WorksheetName] <String>] -HeaderName <String[]> [-StartRow <Int32>] [-EndRow <Int32>] [-StartColumn <Int32>] [-EndColumn <Int32>] [-DataOnly] [-AsText <String[]>] [-AsDate <String[]>] [-Password <String>] [<CommonParameters>]
```
```PowerShell
Import-Excel [-Path] <String> [[-WorksheetName] <String>] [-StartRow <Int32>] [-EndRow <Int32>] [-StartColumn <Int32>] [-EndColumn <Int32>] [-DataOnly] [-AsText <String[]>] [-AsDate <String[]>] [-Password <String>] [<CommonParameters>]
```
```PowerShell
Import-Excel [[-WorksheetName] <String>] -ExcelPackage <ExcelPackage> -NoHeader [-StartRow <Int32>] [-EndRow <Int32>] [-StartColumn <Int32>] [-EndColumn <Int32>] [-DataOnly] [-AsText <String[]>] [-AsDate <String[]>] [-Password <String>] [<CommonParameters>]
```
```PowerShell
Import-Excel [[-WorksheetName] <String>] -ExcelPackage <ExcelPackage> -HeaderName <String[]> [-StartRow <Int32>] [-EndRow <Int32>] [-StartColumn <Int32>] [-EndColumn <Int32>] [-DataOnly] [-AsText <String[]>] [-AsDate <String[]>] [-Password <String>] [<CommonParameters>]
```
```PowerShell
Import-Excel [[-WorksheetName] <String>] -ExcelPackage <ExcelPackage> [-StartRow <Int32>] [-EndRow <Int32>] [-StartColumn <Int32>] [-EndColumn <Int32>] [-DataOnly] [-AsText <String[]>] [-AsDate <String[]>] [-Password <String>] [<CommonParameters>]
```
