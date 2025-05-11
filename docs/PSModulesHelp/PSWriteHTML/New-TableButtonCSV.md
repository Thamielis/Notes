New-TableButtonCSV
------------------

### Synopsis
Creates a new table button for exporting data to CSV with customizable options.

---

### Description

This function creates a new table button for exporting data to CSV with customizable options. It allows users to specify the button title, file name, and other settings for CSV export.

---

### Examples
> EXAMPLE 1

New-TableButtonCSV -Title "Export to CSV" -FileName "data" -FieldSeparator "," -FieldBoundary "'"
Description
-----------
Creates a new table button with the title "Export to CSV", exports data to a CSV file named "data.csv" with comma as the field separator and single quote as the field boundary.

---

### Parameters
#### **Title**
The title to be displayed when hovering over the button.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **ButtonName**
The text to be displayed on the button. Default value is 'CSV'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **Extension**
The file extension for the exported CSV file. Default value is '.csv'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **FileName**
The name of the exported CSV file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **DisableBOM**
Switch to disable Byte Order Mark (BOM) in the exported CSV file.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **FieldSeparator**
The separator character for fields in the CSV file. Default value is ';'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **FieldBoundary**
The character used to enclose fields in the CSV file. Default value is '"'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

---

### Syntax
```PowerShell
New-TableButtonCSV [[-Title] <String>] [[-ButtonName] <String>] [[-Extension] <String>] [[-FileName] <String>] [-DisableBOM] [[-FieldSeparator] <String>] [[-FieldBoundary] <String>] [<CommonParameters>]
```
