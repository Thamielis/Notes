Write-CRUD
----------

### Synopsis
Writes CRUD commands for a table in Azure

---

### Description

Writes PowerShell commands to create a CRUD system around a table and partition in Azure

CRUD stands for Create, Read, Update, and Delete

Write-Crud creates the following commands.

* Add-$Noun (aliased to New-$Noun and Create-$Noun)
* Get-$Noun (aliased to Search-$Noun and Read-$Noun)
* Update-$noun (aliased to Set-$Noun)
* Remove-$Noun (aliased to Remove-$Noun)   

Write-Crud can create tables with an arbitrary schema.

It can also use a well-known schemas, found at either [http://schema.org](http://schema.org) or [http://shouldbeonschema.org](http://shouldbeonschema.org)

---

### Related Links
* [Add-AzureTable](Add-AzureTable)

* [Get-AzureTable](Get-AzureTable)

* [Search-AzureTable](Search-AzureTable)

* [Set-AzureTable](Set-AzureTable)

* [Update-AzureTable](Update-AzureTable)

* [Remove-AzureTable](Remove-AzureTable)

* [Using_Azure_Table_Storage_In_Pipeworks](Using_Azure_Table_Storage_In_Pipeworks)

* [Writing_Crud_In_Pipeworks](Writing_Crud_In_Pipeworks)

* [http://schema.org](http://schema.org)

* [http://shouldbeonschema.org](http://shouldbeonschema.org)

---

### Examples
> EXAMPLE 1

```PowerShell
Write-CRUD -Table My -Partition CustomItem -TypeName MyCustomCrud -Field @{
    'Name' = 'The Name of the Item'
    'Description' = 'The description of the item'            
}
```
> EXAMPLE 2

```PowerShell
Write-Crud -Table My -Partition Blog -Schema http://schema.org/BlogPosting
```

---

### Parameters
#### **Table**
The name of the table

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |1       |true (ByValue, ByPropertyName)|

#### **Partition**
The name of the partition

|Type      |Required|Position|PipelineInput                 |
|----------|--------|--------|------------------------------|
|`[String]`|true    |2       |true (ByValue, ByPropertyName)|

#### **StorageAccountSetting**
The storage account setting

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **StorageKeySetting**
The storage key setting

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **ConnectionStringSetting**
The SQL Connection String Setting

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Field**
Any arbitrary fields to put into a custom CRUD system.

|Type         |Required|Position|PipelineInput        |
|-------------|--------|--------|---------------------|
|`[Hashtable]`|false   |named   |true (ByPropertyName)|

#### **TypeName**
The typename of the data in the field

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |5       |true (ByPropertyName)|

#### **Schema**
The Schema.org schema used for the table

|Type      |Required|Position|PipelineInput        |
|----------|--------|--------|---------------------|
|`[String]`|true    |3       |true (ByPropertyName)|

#### **RequiredField**
If set, will require certain fields

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **ReadCodePartition**
The parition where read codes would be found

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SortField**
If set, the Read command in the CRUD system will automatically sort results

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **SortType**
If set, the Read command in the CRUD system will automatically sort results as a type
Valid Values:

* String
* DateTime
* Float
* Int

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |7       |false        |

#### **ReadCodeCrossReferenceField**
The field on the object that references the read code object

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **LargeField**
If set, will make these fields request multiple lines for input

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **HtmlField**
If set, will make these fields editable HTML

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IncludeField**
If set, will only include a few fields from the schema

|Type        |Required|Position|PipelineInput        |
|------------|--------|--------|---------------------|
|`[String[]]`|false   |named   |true (ByPropertyName)|

#### **Noun**
The noun to use for the generated command.  If this is not set, the commands will have a noun named $Table$Partition

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **Verb**
The verbs that will be generated.  By default, Add, Get, Remove, and Update
Valid Values:

* Add
* Get
* Remove
* Update

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **IsUserSystem**
If set, the CRUD system will be designed to work with users, and be able to query for my items or items of a user ID

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UserPartition**
The partition to look in for user names and ids

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

#### **KeyType**
The type of key used by the crud system
Valid Values:

* Guid
* Hex
* SmallHex
* Sequential
* Named
* Parameter

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |6       |false        |

#### **FieldOrder**
The order of the fields

|Type        |Required|Position|PipelineInput|
|------------|--------|--------|-------------|
|`[String[]]`|false   |named   |false        |

#### **DoNotConvertMarkdown**
If set, will not convert markdown found in the table

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **DoNotConnect**
If set, will not connect to storage

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **UniquelyNamed**
If set, will force uniquely named items

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Description**
A description to use for the commands

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |named   |false        |

---

### Outputs
* [String](https://learn.microsoft.com/en-us/dotnet/api/System.String)

---

### Syntax
```PowerShell
Write-CRUD [-Table] <String> [-Partition] <String> [-StorageAccountSetting <String>] [-StorageKeySetting <String>] [-ConnectionStringSetting <String>] [-Field <Hashtable>] [-Schema] <String> [-RequiredField <String[]>] [-ReadCodePartition <String>] [-SortField <String>] [[-SortType] <String>] [-ReadCodeCrossReferenceField <String>] [-LargeField <String[]>] [-HtmlField <String[]>] [-IncludeField <String[]>] [-Noun <String>] [-Verb <String[]>] [-IsUserSystem] [-UserPartition <String>] [[-KeyType] <String>] [-FieldOrder <String[]>] [-DoNotConvertMarkdown] [-DoNotConnect] [-UniquelyNamed] [-Description <String>] [<CommonParameters>]
```
```PowerShell
Write-CRUD [-Table] <String> [-Partition] <String> [-StorageAccountSetting <String>] [-StorageKeySetting <String>] [-ConnectionStringSetting <String>] [-Field] <Hashtable> [-TypeName] <String> [-RequiredField <String[]>] [-ReadCodePartition <String>] [-SortField <String>] [[-SortType] <String>] [-ReadCodeCrossReferenceField <String>] [-LargeField <String[]>] [-HtmlField <String[]>] [-Noun <String>] [-Verb <String[]>] [-IsUserSystem] [-UserPartition <String>] [[-KeyType] <String>] [-FieldOrder <String[]>] [-DoNotConvertMarkdown] [-DoNotConnect] [-UniquelyNamed] [-Description <String>] [<CommonParameters>]
```
