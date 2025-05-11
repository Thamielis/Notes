Compare-WorkSheet
-----------------

### Synopsis
Compares two worksheets and shows the differences.

---

### Description

This command takes two file names, one or two worksheet names and a name for a "key" column.

It reads the worksheet from each file and decides the column names and builds a hashtable of the key-column values and the rows in which they appear.

It then uses PowerShell's Compare-Object command to compare the sheets (explicitly checking all the column names which have not been excluded).

For the difference rows it adds the row number for the key of that row - we have to add the key after doing the comparison, otherwise identical rows at different positions in the file will not be considered a match.

We also add the name of the file and sheet in which the difference occurs.

If -BackgroundColor is specified the difference rows will be changed to that background in the orginal file.

---

### Related Links
* [Online Version:](Online Version:)

---

### Examples
> EXAMPLE 1

```PowerShell
PS\> Compare-WorkSheet -Referencefile 'Server56.xlsx' -Differencefile 'Server57.xlsx' -WorkSheetName Products -key IdentifyingNumber -ExcludeProperty Install* | Format-Table
The two workbooks in this example contain the result of redirecting a subset of properties from Get-WmiObject -Class win32_product to Export-Excel.

The command compares the "Products" pages in the two workbooks, but we don't want to register a difference if the software was installed on a different date or from a different place, and excluding Install* removes InstallDate and InstallSource.

This data doesn't have a "Name" column, so we specify the "IdentifyingNumber" column as the key.

The results will be presented as a table.
```
> EXAMPLE 2

```PowerShell
PS\> Compare-WorkSheet "Server54.xlsx" "Server55.xlsx" -WorkSheetName Services -GridView
This time two workbooks contain the result of redirecting the command Get-WmiObject -Class win32_service to Export-Excel.

Here the -Differencefile and -Referencefile parameter switches are assumed and the default setting for -Key ("Name") works for services.

This will display the differences between the "Services" sheets using a grid view
```
> EXAMPLE 3

```PowerShell
PS\> Compare-WorkSheet 'Server54.xlsx' 'Server55.xlsx' -WorkSheetName Services -BackgroundColor lightGreen
This version of the command outputs the differences between the "services" pages and highlights any different rows in the spreadsheet files.
```
> EXAMPLE 4

```PowerShell
PS\> Compare-WorkSheet 'Server54.xlsx' 'Server55.xlsx' -WorkSheetName Services -BackgroundColor lightGreen -FontColor Red -Show
This example builds on the previous one: this time where two changed rows have the value in the "Name" column (the default value for -Key), this version adds highlighting of the changed cells in red; and then opens the Excel file.
```
> EXAMPLE 5

```PowerShell
PS\> Compare-WorkSheet 'Pester-tests.xlsx' 'Pester-tests.xlsx' -WorkSheetName 'Server1','Server2' -Property "full Description","Executed","Result" -Key "full Description"
This time the reference file and the difference file are the same file and two different sheets are used.

Because the tests include the machine name and time the test was run, the command specifies that a limited set of columns should be used.
```
> EXAMPLE 6

```PowerShell
PS\> Compare-WorkSheet 'Server54.xlsx' 'Server55.xlsx' -WorkSheetName general -Startrow 2 -Headername Label,value -Key Label -GridView -ExcludeDifferent
The "General" page in the two workbooks has a title and two unlabelled columns with a row each for CPU, Memory, Domain, Disk and so on.

So the command is told to start at row 2 in order to skip the title and given names for the columns: the first is "label" and the second "Value"; the label acts as the key.

This time we are interested in those rows which are the same in both sheets, and the result is displayed using grid view.

Note that grid view works best when the number of columns is small.
```
> EXAMPLE 7

```PowerShell
PS\>Compare-WorkSheet 'Server1.xlsx' 'Server2.xlsx' -WorkSheetName general -Startrow 2 -Headername Label,value -Key Label -BackgroundColor White -Show -AllDataBackgroundColor LightGray
This version of the previous command highlights all the cells in LightGray and then sets the changed rows back to white.

Only the unchanged rows are highlighted.
```

---

### Parameters
#### **Referencefile**
First file to compare.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |1       |False        |

#### **Differencefile**
Second file to compare.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|true    |2       |False        |

#### **WorkSheetName**
Name(s) of worksheets to compare.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **Property**
Properties to include in the comparison - supports wildcards, default is "*".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **ExcludeProperty**
Properties to exclude from the comparison - supports wildcards.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **Headername**
Specifies custom property names to use, instead of the values defined in the starting row of the sheet.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|true    |named   |False        |

#### **NoHeader**
Automatically generate property names (P1, P2, P3 ...) instead of the using the values the starting row of the sheet.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|true    |named   |False        |

#### **Startrow**
The row from where we start to import data: all rows above the start row are disregarded. By default, this is the first row.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |False        |

#### **AllDataBackgroundColor**
If specified, highlights all the cells - so you can make Equal cells one color, and Different cells another.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **BackgroundColor**
If specified, highlights the rows with differences.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **TabColor**
If specified identifies the tabs which contain difference rows (ignored if -BackgroundColor is omitted).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **Key**
Name of a column which is unique and will be used to add a row to the DIFF object, defaults to "Name".

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **FontColor**
If specified, highlights the DIFF columns in rows which have the same key.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |named   |False        |

#### **Show**
If specified, opens the Excel workbooks instead of outputting the diff to the console (unless -PassThru is also specified).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **GridView**
If specified, the command tries to the show the DIFF in a Grid-View and not on the console (unless-PassThru is also specified). This works best with few columns selected, and requires a key.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **PassThru**
If specified a full set of DIFF data is returned without filtering to the specified properties.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **IncludeEqual**
If specified the result will include equal rows as well. By default only different rows are returned.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

#### **ExcludeDifferent**
If specified, the result includes only the rows where both are equal.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |False        |

---

### Notes

---

### Syntax
```PowerShell
Compare-WorkSheet [-Referencefile] <Object> [-Differencefile] <Object> [-WorkSheetName <Object>] [-Property <Object>] [-ExcludeProperty <Object>] -Headername <String[]> [-Startrow <Int32>] [-AllDataBackgroundColor <Object>] [-BackgroundColor <Object>] [-TabColor <Object>] [-Key <Object>] [-FontColor <Object>] [-Show] [-GridView] [-PassThru] [-IncludeEqual] [-ExcludeDifferent] [<CommonParameters>]
```
```PowerShell
Compare-WorkSheet [-Referencefile] <Object> [-Differencefile] <Object> [-WorkSheetName <Object>] [-Property <Object>] [-ExcludeProperty <Object>] -NoHeader [-Startrow <Int32>] [-AllDataBackgroundColor <Object>] [-BackgroundColor <Object>] [-TabColor <Object>] [-Key <Object>] [-FontColor <Object>] [-Show] [-GridView] [-PassThru] [-IncludeEqual] [-ExcludeDifferent] [<CommonParameters>]
```
