New-TableButtonColumnVisibility
-------------------------------

### Synopsis
Creates a new table button for column visibility control.

---

### Description

This function creates a new table button for controlling the visibility of columns in a table. It allows customization of the button text, layout, and other properties.

---

### Examples
> EXAMPLE 1

```PowerShell
New-TableButtonColumnVisibility -ButtonName "Toggle Columns" -CollectionTitle "Column Visibility" -CollectionPosition "fixed" -CollectionLayout "two-column" -DropUp -Fade 500
Creates a new table button with the specified properties.
```

---

### Parameters
#### **ButtonName**
Specifies the text to display on the button.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **CollectionTitle**
Specifies the title for the column visibility control collection. Default is 'Visibility control'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **CollectionPosition**
Specifies the position of the collection (fixed or dropdown). Default is 'dropdown'.
Valid Values:

* fixed
* dropdown

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **CollectionLayout**
Specifies the layout of the collection (columns, two-column, three-column, four-column). Default is 'columns'.
Valid Values:

* columns
* two-column
* three-column
* four-column

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **DropUp**
Indicates whether the collection should be displayed as a drop-up menu.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Fade**
Specifies the fade effect duration when toggling visibility.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |5       |false        |

---

### Syntax
```PowerShell
New-TableButtonColumnVisibility [[-ButtonName] <String>] [[-CollectionTitle] <String>] [[-CollectionPosition] <String>] [[-CollectionLayout] <String>] [-DropUp] [[-Fade] <Int32>] [<CommonParameters>]
```
