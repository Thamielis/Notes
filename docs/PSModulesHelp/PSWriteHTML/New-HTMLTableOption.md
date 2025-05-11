New-HTMLTableOption
-------------------

### Synopsis
Configures New-HTMLTable options

---

### Description

Configures New-HTMLTable options

---

### Examples
> EXAMPLE 1

```PowerShell
New-HTML {
    New-HTMLTableOption -DateTimeFormat "yyyy-MM-dd HH:mm:ss" -BoolAsString
    New-HTMLSection -Invisible {
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects' {
            New-HTMLTable -DataTable $DataTable1
        }
        New-HTMLSection -HeaderText 'Standard Table with PSCustomObjects' {
            New-HTMLTable -DataTable $DataTable1 -DataStore JavaScript
        }
    }
} -ShowHTML
```

---

### Parameters
#### **DataStore**
Choose how Data is stored for all tables HTML, JavaScript or AjaxJSON (external file)
Valid Values:

* HTML
* JavaScript
* AjaxJSON

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |1       |false        |

#### **BoolAsString**
When JavaScript or AjaxJSON is used, forces bool to string

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **NumberAsString**
When JavaScript or AjaxJSON is used, forces number to string

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DateTimeFormat**
When JavaScript or AjaxJSON is used, one can configure DateTimeFormat (in PowerShell way)

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

#### **NewLineCarriage**
When JavaScript or AjaxJSON is used, one can configure NewLineCarriage. Default NewLineCarriage = '<br>'

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |3       |false        |

#### **NewLine**
When JavaScript or AjaxJSON is used, one can configure NewLine. Default value for NewLine = "\n"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |4       |false        |

#### **Carriage**
When JavaScript or AjaxJSON is used, one can configure Carriage. Default value for Carriage = "\r"

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |5       |false        |

#### **ArrayJoin**
When JavaScript or AjaxJSON is used, forces any array to be a string regardless of depth level

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **ArrayJoinString**
Uses defined string or char for array join. By default it uses comma with a space when used.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **PrettifyObject**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **PrettifyObjectSeparator**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **PrettifyObjectDateTimeFormat**

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |8       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
New-HTMLTableOption [[-DataStore] <String>] [-BoolAsString] [-NumberAsString] [[-DateTimeFormat] <String>] [[-NewLineCarriage] <String>] [[-NewLine] <String>] [[-Carriage] <String>] [-ArrayJoin] [[-ArrayJoinString] <String>] [-PrettifyObject] [[-PrettifyObjectSeparator] <String>] [[-PrettifyObjectDateTimeFormat] <String>] [<CommonParameters>]
```
