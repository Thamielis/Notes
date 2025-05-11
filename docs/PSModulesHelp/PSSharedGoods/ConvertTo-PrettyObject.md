ConvertTo-PrettyObject
----------------------

### Synopsis
Command to help with converting standard objects that could be nested objects into single level PSCustomObject

---

### Description

Command to help with converting standard objects that could be nested objects into single level PSCustomObject
This is a help command for PSWriteHTML module and probably PSWriteOffice module to create tables from objects
and make sure those tables are not nested and can be easily converted to HTML or Office tables without having to manually flatten them

---

### Examples
> EXAMPLE 1

```PowerShell
$Test1 = [PSCustomObject] @{
    Number     = 1
    Number2    = 2.2
    Bool       = $false
    Array      = @(
        'C:\Users\1Password.exe'
        "C:\Users\Ooops.exe"
        "\\EvoWin\c$\Users\przemyslaw klys\AppData\Local\1password\This is other\7\1Password.exe"
        "\\EvoWin\c$\Users\przemyslaw.klys\AppData\Local\1password\This is other\7\1Password.exe"
    )
    EmptyArray = @()
    EmptyList  = [System.Collections.Generic.List[string]]::new()
    HashTable  = @{
        NumberAgain       = 2
        OrderedDictionary = [ordered] @{
            String    = 'test'
            HashTable = @{
                StringAgain = "oops"
            }
        }
        Array             = @(
            'C:\Users\1Password.exe'
            "C:\Users\Ooops.exe"
            "\\EvoWin\c$\Users\przemyslaw klys\AppData\Local\1password\This is other\7\1Password.exe"
            "\\EvoWin\c$\Users\przemyslaw.klys\AppData\Local\1password\This is other\7\1Password.exe"
        )
    }
    DateTime   = Get-Date
}
$Test1 | ConvertTo-PrettyObject -ArrayJoinString "," -ArrayJoin | ConvertTo-Json | ConvertFrom-Json
```

---

### Parameters
#### **Object**
Specifies the objects to convert to pretty format. Enter a variable that contains the objects, or type a command or expression that gets the objects. You can also pipe an object to ConvertTo-JsonLiteral

|Type     |Required|Position|PipelineInput                 |Aliases    |
|---------|--------|--------|------------------------------|-----------|
|`[Array]`|true    |1       |true (ByValue, ByPropertyName)|InputObject|

#### **Depth**

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |named   |false        |

#### **AsArray**

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
ConvertTo-PrettyObject [-Object] <Array> [-Depth <Int32>] [-AsArray] [-DateTimeFormat <String>] [-NumberAsString] [-BoolAsString] [-NewLineFormat <IDictionary>] [-NewLineFormatProperty <IDictionary>] [-AdvancedReplace <IDictionary>] [-ArrayJoinString <String>] [-ArrayJoin] [-PropertyName <String[]>] [-Force] [<CommonParameters>]
```
