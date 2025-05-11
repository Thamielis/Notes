Format-View
-----------

### Synopsis
Formats and displays objects in a customizable view.

---

### Description

The Format-View function formats and displays objects in a customizable view. It allows you to specify properties to include or exclude, control output streams, and customize the display format.

---

### Examples
> EXAMPLE 1

```PowerShell
Format-View -InputObject $object -Property Name, Age -Stream Verbose
Formats the object with only the 'Name' and 'Age' properties and outputs to the verbose stream.
```
> EXAMPLE 2

```PowerShell
Get-Process | Format-View -Property Name, CPU -Stream Host
Formats the process objects with only the 'Name' and 'CPU' properties and outputs to the host.
```

---

### Parameters
#### **InputObject**
Specifies the object to format.

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[Object]`|false   |1       |true (ByValue, ByPropertyName)|

#### **Property**
Specifies the properties of the object to include in the output.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |2       |false        |

#### **ExcludeProperty**
Specifies the properties of the object to exclude from the output.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[Object[]]`|false   |3       |false        |

#### **HideTableHeaders**
Indicates whether to hide table headers in the output.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |4       |false        |

#### **Stream**
Specifies the output stream for the formatted object. Valid values are 'Output', 'Host', 'Warning', 'Verbose', 'Debug', and 'Information'.
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
Indicates whether to display the object as a list.

|Type      |Required|Position|PipelineInput|Aliases|
|----------|--------|--------|-------------|-------|
|`[Switch]`|false   |8       |false        |AsList |

#### **Autosize**
Indicates whether to automatically adjust the column width based on the content.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |9       |false        |

---

### Syntax
```PowerShell
Format-View [[-InputObject] <Object>] [[-HideTableHeaders]] [[-Stream] <String>] [[-List]] [[-Autosize]] [<CommonParameters>]
```
```PowerShell
Format-View [[-InputObject] <Object>] [[-Property] <Object[]>] [[-HideTableHeaders]] [[-Stream] <String>] [[-List]] [[-Autosize]] [<CommonParameters>]
```
```PowerShell
Format-View [[-InputObject] <Object>] [[-ExcludeProperty] <Object[]>] [[-HideTableHeaders]] [[-Stream] <String>] [[-List]] [[-Autosize]] [<CommonParameters>]
```
