New-PSMDFormatTableDefinition
-----------------------------

### Synopsis
Generates a format XML for the input type.

---

### Description

Generates a format XML for the input type.
Currently, only tables are supported.

Note:
Loading format files has a measureable impact on module import PER FILE.
For the sake of performance, you should only generate a single file for an entire module.

You can generate all items in a single call (which will probably be messy on many types at a time)
Or you can use the -Fragment parameter to create individual fragments, and combine them by passing
those items again to this command (the final time without the -Fragment parameter).

---

### Examples
> EXAMPLE 1

```PowerShell
Get-ChildItem | New-PSMDFormatTableDefinition
Generates a format xml for the objects in the current path (files and folders in most cases)
```
> EXAMPLE 2

```PowerShell
Get-ChildItem | New-PSMDFormatTableDefinition -IncludeProperty LastWriteTime, FullName
Creates a format xml that only includes the columns LastWriteTime, FullName
```

---

### Parameters
#### **InputObject**
The object that will be used to generate the format XML for.
Will not duplicate its work if multiple object of the same type are passed.
Accepts objects generated when using the -Fragment parameter, combining them into a single document.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|true    |named   |true (ByValue)|

#### **IncludeProperty**
Only properties in this list will be included.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ExcludeProperty**
Only properties not in this list will be included.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IncludePropertyAttribute**
Only properties that have the specified attribute will be included.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ExcludePropertyAttribute**
Only properties that do NOT have the specified attribute will be included.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Fragment**
The function will only return a partial Format-XML object (an individual table definition per type).

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DocumentName**
Adds a name to the document generated.
Purely cosmetic.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SortColumns**
Enabling this will cause the command to sort columns alphabetically.
Explicit order styles take precedence over alphabetic sorting.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ColumnOrder**
Specify a list of properties in the order they should appear.
For properties with labels: Labels take precedence over selected propertyname.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ColumnOrderHash**
Allows explicitly defining the order of columns on a per-type basis.
These hashtables need to have two properties:
* Type: The name of the type it applies to (e.g.: "System.IO.FileInfo")
* Properties: The list of properties in the order they should appear.
Example: @{ Type = "System.IO.FileInfo"; Properties = "Name", "Length", "LastWriteTime" }
This parameter takes precedence over ColumnOrder in instances where the
processed typename is explicitly listed in a hashtable.

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[Hashtable[]]`|false   |named   |false        |

#### **ColumnTransformations**
A complex parameter that allows customizing columns or even adding new ones.
This parameter accepts a hashtable that can ...
* Set column width
* Set column alignment
* Add a script column
* Assign a label to a column
It can be targeted by typename as well as propertyname. Possible properties (others will be ignored):
Content          |  Type  | Possible Hashtable Keys
Filter: Typename | string | T / Type / TypeName / FilterViewName
Filter: Property | string | C / Column / Name / P / Property / PropertyName
Append           |  bool  | A / Append
ScriptBlock      | script | S / Script / ScriptBlock
Label            | string | L / Label
Width            |  int   | W / Width
Alignment        | string | Align / Alignment
Notes:
* Append needs to be specified if a new column should be added if no property to override was found.
  Use this to add a completely new column with a ScriptBlock.
* Alignment: Expects a string, can be any choice of "Left", "Center", "Right"
Example:
$transform = @{
    Type = "System.IO.FileInfo"
    Append = $true
    Script = { "{0} | {1}" -f $_.Extension, $_.Length }
    Label = "Ext.Length"
    Align = "Left"
}

|Type                      |Required|Position|PipelineInput|
|--------------------------|--------|--------|-------------|
|`[ColumnTransformation[]]`|false   |named   |false        |

---

### Outputs
* PSModuleDevelopment.Format.Document

* PSModuleDevelopment.Format.TableDefinition

---

### Syntax
```PowerShell
New-PSMDFormatTableDefinition -InputObject <Object> [-IncludeProperty <String[]>] [-ExcludeProperty <String[]>] [-IncludePropertyAttribute <String>] [-ExcludePropertyAttribute <String>] [-DocumentName <String>] [-SortColumns] [-ColumnOrder <String[]>] [-ColumnOrderHash <Hashtable[]>] [-ColumnTransformations <ColumnTransformation[]>] [<CommonParameters>]
```
```PowerShell
New-PSMDFormatTableDefinition -InputObject <Object> [-IncludeProperty <String[]>] [-ExcludeProperty <String[]>] [-IncludePropertyAttribute <String>] [-ExcludePropertyAttribute <String>] [-Fragment] [-SortColumns] [-ColumnOrder <String[]>] [-ColumnOrderHash <Hashtable[]>] [-ColumnTransformations <ColumnTransformation[]>] [<CommonParameters>]
```
