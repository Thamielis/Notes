Merge-MultipleSheets
--------------------

### Synopsis
Merges Worksheets into a single Worksheet with differences marked up.

---

### Description

The Merge Worksheet command combines two sheets. Merge-MultipleSheets is designed to merge more than two.

If asked to merge sheets A,B,C which contain Services, with a Name, Displayname and Start mode, where "Name" is treated as the key, Merge-MultipleSheets:

* Calls Merge-Worksheet to merge "Name", "Displayname" and "Startmode" from sheets A and C;  the result has column headings  "_Row", "Name", "DisplayName", "Startmode", "C-DisplayName", "C-StartMode", "C-Is" and "C-Row".

* Calls Merge-Worksheet again passing it the intermediate result and sheet B, comparing "Name", "Displayname" and "Start mode" columns on each side, and gets a result with columns "_Row", "Name", "DisplayName", "Startmode", "B-DisplayName",  "B-StartMode", "B-Is", "B-Row", "C-DisplayName", "C-StartMode", "C-Is" and "C-Row".

Any columns on the "reference" side which are not used in the comparison are added on the right, which is why we compare the sheets in reverse order.

The "Is" columns hold "Same", "Added", "Removed" or "Changed" and is used for conditional formatting in the output sheet (these columns are hidden by default), and when the data is written to Excel the "reference" columns, in this case "DisplayName" and "Start" are renamed to reflect their source, so they become "A-DisplayName" and "A-Start".

Conditional formatting is also applied to the Key column ("Name" in this case) so the view can be filtered to rows with changes by filtering this column on color.

Note: the processing order can affect what is seen as a change.For example, if there is an extra item in sheet B in the example above, Sheet C will be processed first and that row and will not be seen to be missing. When sheet B is processed it is marked as an addition, and the conditional formatting marks the entries from sheet A to show that a values were added in at least one sheet.

However if Sheet B is the reference sheet, A and C will be seen to have an item removed; and if B is processed before C, the extra item is known when C is processed and so C is considered to be missing that item.

---

### Related Links
* [Online Version:](Online Version:)

---

### Examples
> EXAMPLE 1

```PowerShell
PS\> dir Server*.xlsx | Merge-MulipleSheets -WorksheetName Services -OutputFile Test2.xlsx -OutputSheetName Services -Show
Here we are auditing servers and each one has a workbook in the current directory which contains a "Services" Worksheet (the result of Get-WmiObject -Class win32_service \| Select-Object -Property Name, Displayname, Startmode). No key is specified so the key is assumed to be the "Name" column. The files are merged and the result is opened on completion.
```
> EXAMPLE 2

```PowerShell
PS\> dir Serv*.xlsx |  Merge-MulipleSheets  -WorksheetName Software -Key "*" -ExcludeProperty Install* -OutputFile Test2.xlsx -OutputSheetName Software -Show
The server audit files in the previous example also have "Software" worksheet, but no single field on that sheet works as a key. Specifying "*" for the key produces a compound key using all non-excluded fields (and the installation date and file location are excluded).
```
> EXAMPLE 3

```PowerShell
Merge-MulipleSheets -Path hotfixes.xlsx -WorksheetName Serv* -Key hotfixid -OutputFile test2.xlsx -OutputSheetName hotfixes  -HideRowNumbers -Show
This time all the servers have written their hotfix information to their own worksheets in a shared Excel workbook named "Hotfixes.xlsx" (the information was obtained by running Get-Hotfix \| Sort-Object -Property description,hotfixid \| Select-Object -Property Description,HotfixID) This ignores any sheets which are not named "Serv*", and uses the HotfixID as the key; in this version the row numbers are hidden.
```

---

### Parameters
#### **Path**
Paths to the files to be merged. Files are also accepted

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|true    |1       |True (ByValue)|

#### **Startrow**
The row from where we start to import data, all rows above the Start row are disregarded. By default this is the first row.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |2       |False        |

#### **Headername**
Specifies custom property names to use, instead of the values defined in the column headers of the Start row.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |False        |

#### **NoHeader**
If specified, property names will be automatically generated (P1, P2, P3, ..) instead of using the values from the start row.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **WorksheetName**
Name(s) of Worksheets to compare.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |4       |False        |

#### **OutputFile**
File to write output to.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Object]`|false   |5       |False        |OutFile|

#### **OutputSheetName**
Name of Worksheet to output - if none specified will use the reference Worksheet name.

|Type      |Required|Position|PipelineInput|Aliases |
|----------|--------|--------|-------------|--------|
|`[Object]`|false   |6       |False        |OutSheet|

#### **Property**
Properties to include in the comparison - supports wildcards, default is "*".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |7       |False        |

#### **ExcludeProperty**
Properties to exclude from the the comparison - supports wildcards.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |8       |False        |

#### **Key**
Name of a column which is unique used to pair up rows from the reference and difference sides, default is "Name".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |9       |False        |

#### **KeyFontColor**
Sets the font color for the Key field; this means you can filter by color to get only changed rows.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |10      |False        |

#### **ChangeBackgroundColor**
Sets the background color for changed rows.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |11      |False        |

#### **DeleteBackgroundColor**
Sets the background color for rows in the reference but deleted from the difference sheet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |12      |False        |

#### **AddBackgroundColor**
Sets the background color for rows not in the reference but added to the difference sheet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |13      |False        |

#### **HideRowNumbers**
If specified, hides the columns in the spreadsheet that contain the row numbers.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Passthru**
If specified, outputs the data to the pipeline (you can add -whatif so it the command only outputs to the pipeline).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **Show**
If specified, opens the output workbook.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Notes

---

### Syntax
```PowerShell
Merge-MultipleSheets [-Path] <Object> [[-KeyFontColor] <Object>] [[-ChangeBackgroundColor] <Object>] [[-DeleteBackgroundColor] <Object>] [[-AddBackgroundColor] <Object>] [[-Startrow] <Int32>] [[-Headername] <String[]>] [[-WorksheetName] <Object>] [[-OutputFile] <Object>] [[-OutputSheetName] <Object>] [[-Property] <Object>] [[-ExcludeProperty] <Object>] [[-Key] <Object>] [-NoHeader] [-HideRowNumbers] [-Passthru] [-Show] [<CommonParameters>]
```
