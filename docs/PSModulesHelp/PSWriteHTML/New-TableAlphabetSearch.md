New-TableAlphabetSearch
-----------------------

### Synopsis
Creates a custom object for Table Alphabet Search with specified parameters.

---

### Description

This function creates a custom object for Table Alphabet Search with the specified parameters. It allows for customization of the search behavior by enabling case sensitivity and adding numbers to the search.

---

### Examples
> EXAMPLE 1

```PowerShell
New-TableAlphabetSearch -ColumnID 1 -ColumnName "Name" -AddNumbers -CaseSensitive
Creates a Table Alphabet Search object for column ID 1 with the name "Name", including numbers in the search and performing a case-sensitive search.
```
> EXAMPLE 2

```PowerShell
New-TableAlphabetSearch -ColumnID 2 -ColumnName "ID" -CaseSensitive
Creates a Table Alphabet Search object for column ID 2 with the name "ID", performing a case-sensitive search.
```

---

### Parameters
#### **ColumnID**
Specifies the ID of the column to search.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|true    |named   |false        |

#### **ColumnName**
Specifies the name of the column to search.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|true    |named   |false        |

#### **AddNumbers**
Switch parameter to include numbers in the search.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **CaseSensitive**
Switch parameter to perform a case-sensitive search.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Syntax
```PowerShell
New-TableAlphabetSearch -ColumnID <Int32> [-AddNumbers] [-CaseSensitive] [<CommonParameters>]
```
```PowerShell
New-TableAlphabetSearch -ColumnName <String> [-AddNumbers] [-CaseSensitive] [<CommonParameters>]
```
