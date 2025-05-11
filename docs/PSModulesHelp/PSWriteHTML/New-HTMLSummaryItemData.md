New-HTMLSummaryItemData
-----------------------

### Synopsis
Creates a new HTML summary item data with specified text and information.

---

### Description

This function creates a new HTML summary item data with the provided text and information. It formats the output using New-HTMLText cmdlet.

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTMLSummaryItemData -Text "Total Sales" -Information "$1000"
Creates a new HTML summary item with the text "Total Sales" and information "$1000".
```
> EXAMPLE 2

```PowerShell
New-HTMLSummaryItemData -Text "Total Orders" -Information "50" -Icon "order.png"
Creates a new HTML summary item with the text "Total Orders", information "50", and icon "order.png".
```

---

### Parameters
#### **Icon**
Specifies the icon for the summary item.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **Text**
Specifies the text to be displayed in the summary item. This parameter is mandatory.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |2       |false        |

#### **Information**
Specifies the information to be displayed in the summary item. This parameter is mandatory.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[String]`|true    |3       |false        |Value  |

---

### Syntax
```PowerShell
New-HTMLSummaryItemData [[-Icon] <String>] [-Text] <String> [-Information] <String> [<CommonParameters>]
```
