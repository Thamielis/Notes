ConvertFrom-ExcelToSQLInsert
----------------------------

### Synopsis
Generate SQL insert statements from Excel spreadsheet.

---

### Description

Generate SQL insert statements from Excel spreadsheet.

---

### Related Links
* [Online Version:](Online Version:)

---

### Examples
> EXAMPLE 1

Generate SQL insert statements from Movies.xlsx file, leaving blank cells as empty strings:

----------------------------------------------------------
| File: Movies.xlsx            -           Sheet: Sheet1 |
----------------------------------------------------------
|           A            B            C                  |
|1     Movie Name      Year         Rating               |
|2     The Bodyguard   1992           9                  |
|3     The Matrix      1999           8                  |
|4     Skyfall         2012           9                  |
|5     The Avengers    2012                              |
----------------------------------------------------------

PS C:\>  ConvertFrom-ExcelToSQLInsert -TableName "Movies" -Path 'C:\Movies.xlsx'
INSERT INTO Movies ('Movie Name', 'Year', 'Rating') Values('The Bodyguard', '1992', '9');
INSERT INTO Movies ('Movie Name', 'Year', 'Rating') Values('The Matrix', '1999', '8');
INSERT INTO Movies ('Movie Name', 'Year', 'Rating') Values('Skyfall', '2012', '9');
INSERT INTO Movies ('Movie Name', 'Year', 'Rating') Values('The Avengers', '2012', '');
> EXAMPLE 2

Generate SQL insert statements from Movies.xlsx file, specify NULL instead of an empty string.

----------------------------------------------------------
| File: Movies.xlsx            -           Sheet: Sheet1 |
----------------------------------------------------------
|           A            B            C                  |
|1     Movie Name      Year         Rating               |
|2     The Bodyguard   1992           9                  |
|3     The Matrix      1999           8                  |
|4     Skyfall         2012           9                  |
|5     The Avengers    2012                              |
----------------------------------------------------------

PS C:\> ConvertFrom-ExcelToSQLInsert -TableName "Movies" -Path "C:\Movies.xlsx" -ConvertEmptyStringsToNull
INSERT INTO Movies ('Movie Name', 'Year', 'Rating') Values('The Bodyguard', '1992', '9');
INSERT INTO Movies ('Movie Name', 'Year', 'Rating') Values('The Matrix', '1999', '8');
INSERT INTO Movies ('Movie Name', 'Year', 'Rating') Values('Skyfall', '2012', '9');
INSERT INTO Movies ('Movie Name', 'Year', 'Rating') Values('The Avengers', '2012', NULL);

---

### Parameters
#### **TableName**
Name of the target database table.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |False        |

#### **Path**
Path to an existing .XLSX file This parameter is passed to Import-Excel as is.

|Type      |Required|Position|PipelineInput                 |Aliases |
|----------|--------|--------|------------------------------|--------|
|`[Object]`|true    |2       |True (ByPropertyName, ByValue)|FullName|

#### **WorkSheetname**
Specifies the name of the worksheet in the Excel workbook to import. By default, if no name is provided, the first worksheet will be imported. This parameter is passed to Import-Excel as is.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Object]`|false   |3       |False        |Sheet  |

#### **StartRow**
The row from where we start to import data, all rows above the StartRow are disregarded. By default this is the first row. When the parameters '-NoHeader' and '-HeaderName' are not provided, this row will contain the column headers that will be used as property names. When one of both parameters are provided, the property names are automatically created and this row will be treated as a regular row containing data.

|Type     |Required|Position|PipelineInput|Aliases             |
|---------|--------|--------|-------------|--------------------|
|`[Int32]`|false   |4       |False        |HeaderRow<br/>TopRow|

#### **Header**
Specifies custom property names to use, instead of the values defined in the column headers of the TopRow. If you provide fewer header names than there is data in the worksheet, then only the data with a corresponding header name will be imported and the data without header name will be disregarded. If you provide more header names than there is data in the worksheet, then all data will be imported and all objects will have all the property names you defined in the header names. As such, the last properties will be blank as there is no data for them.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |5       |False        |

#### **NoHeader**
Automatically generate property names (P1, P2, P3, ..) instead of the ones defined in the column headers of the TopRow. This switch is best used when you want to import the complete worksheet 'as is' and are not concerned with the property names.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **DataOnly**
Import only rows and columns that contain data, empty rows and empty columns are not imported.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ConvertEmptyStringsToNull**
If specified, cells without any data are replaced with NULL, instead of an empty string. This is to address behviors in certain DBMS where an empty string is insert as 0 for INT column, instead of a NULL value.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **UseMSSQLSyntax**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Notes

---

### Syntax
```PowerShell
ConvertFrom-ExcelToSQLInsert [-TableName] <Object> [-Path] <Object> [[-WorkSheetname] <Object>] [[-StartRow] <Int32>] [[-Header] <String[]>] [-NoHeader] [-DataOnly] [-ConvertEmptyStringsToNull] [-UseMSSQLSyntax] [<CommonParameters>]
```
