ConvertTo-JsonLiteral
---------------------

### Synopsis
Converts an object to a JSON-formatted string.

---

### Description

The ConvertTo-Json cmdlet converts any object to a string in JavaScript Object Notation (JSON) format. The properties are converted to field names, the field values are converted to property values, and the methods are removed.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Process | Select-Object -First 2 | ConvertTo-JsonLiteral
```
> EXAMPLE 2

```PowerShell
Get-Process | Select-Object -First 2 | ConvertTo-JsonLiteral -Depth 3
```
> EXAMPLE 3

```PowerShell
Get-Process | Select-Object -First 2 | ConvertTo-JsonLiteral -NewLineFormat $NewLineFormat = @{
    NewLineCarriage = '\r\n'
    NewLine         = "\n"
    Carriage        = "\r"
} -NumberAsString -BoolAsString
```
> EXAMPLE 4

```PowerShell
Get-Process | Select-Object -First 2 | ConvertTo-JsonLiteral -NumberAsString -BoolAsString -DateTimeFormat "yyyy-MM-dd HH:mm:ss"
```
Keep in mind this advanced replace will break ConvertFrom-Json, but it's sometimes useful for projects like PSWriteHTML

```PowerShell
Get-Process | Select-Object -First 2 | ConvertTo-JsonLiteral -NewLineFormat $NewLineFormat = @{
    NewLineCarriage = '\r\n'
    NewLine         = "\n"
    Carriage        = "\r"
} -NumberAsString -BoolAsString -AdvancedReplace @{ '.' = '\.'; '$' = '\$' }
```

---

### Parameters
#### **Object**
Specifies the objects to convert to JSON format. Enter a variable that contains the objects, or type a command or expression that gets the objects. You can also pipe an object to ConvertTo-JsonLiteral

|Type     |Required|Position|PipelineInput                 |Aliases    |
|---------|--------|--------|------------------------------|-----------|
|`[Array]`|true    |1       |true (ByValue, ByPropertyName)|InputObject|

#### **Depth**
Specifies how many levels of contained objects are included in the JSON representation. The default value is 0.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **AsArray**
Outputs the object in array brackets, even if the input is a single object.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DateTimeFormat**
Changes DateTime string format. Default "yyyy-MM-dd HH:mm:ss"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **NumberAsString**
Provides an alternative serialization option that converts all numbers to their string representation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **BoolAsString**
Provides an alternative serialization option that converts all bool to their string representation.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NewLineFormat**
Provides a way to configure how new lines are converted for property names

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

#### **NewLineFormatProperty**
Provides a way to configure how new lines are converted for values

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

#### **AdvancedReplace**

|Type           |Required|Position|PipelineInput|
|---------------|--------|--------|-------------|
|`[IDictionary]`|false   |named   |false        |

#### **ArrayJoinString**
Uses defined string or char for array join. By default it uses comma with a space when used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ArrayJoin**
Forces any array to be a string regardless of depth level

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PropertyName**
Uses PropertyNames provided by user (only works with Force)

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **Force**
Forces using property names from first object or given thru PropertyName parameter

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
ConvertTo-JsonLiteral [-Object] <Array> [-Depth <Int32>] [-AsArray] [-DateTimeFormat <String>] [-NumberAsString] [-BoolAsString] [-NewLineFormat <IDictionary>] [-NewLineFormatProperty <IDictionary>] [-AdvancedReplace <IDictionary>] [-ArrayJoinString <String>] [-ArrayJoin] [-PropertyName <String[]>] [-Force] [<CommonParameters>]
```
