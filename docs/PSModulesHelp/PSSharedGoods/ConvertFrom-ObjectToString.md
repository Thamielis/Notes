ConvertFrom-ObjectToString
--------------------------

### Synopsis
Helps with converting given objects to their string representation.

---

### Description

Helps with converting given objects to their string representation.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Process -Name "PowerShell" | ConvertFrom-ObjectToString -IncludeProperties 'ProcessName', 'Id', 'Handles'
OUTPUT:
@{
    'Handles' = '543'
    'Id' = '8092'
    'ProcessName' = 'powershell'
}

@{
    'Handles' = '636'
    'Id' = '11360'
    'ProcessName' = 'powershell'
}
```

---

### Parameters
#### **Objects**
Objects to convert to string representation.

|Type     |Required|Position|PipelineInput                 |
|---------|--------|--------|------------------------------|
|`[Array]`|true    |1       |true (ByValue, ByPropertyName)|

#### **IncludeProperties**
Properties to include in the string representation.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |2       |false        |

#### **ExcludeProperties**
Properties to exclude from the string representation.

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |3       |false        |

#### **OutputType**
Type of the output object. Options are: Hashtable, Ordered, PSCustomObject. If not specified, the output type is hashtable (string)
Valid Values:

* Hashtable
* Ordered
* PSCustomObject

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **NumbersAsString**
If specified, numbers are converted to strings. Default is number are presented in their (unquoted) numerica form

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **QuotePropertyNames**
If specified, all property names are quoted. Default: property names are quoted only if they contain spaces.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DateTimeFormat**
Format for DateTime values. Default: 'yyyy-MM-dd HH:mm:ss'

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
ConvertFrom-ObjectToString [-Objects] <Array> [[-IncludeProperties] <String[]>] [[-ExcludeProperties] <String[]>] [[-OutputType] <String>] [-NumbersAsString] [-QuotePropertyNames] [[-DateTimeFormat] <String>] [<CommonParameters>]
```
