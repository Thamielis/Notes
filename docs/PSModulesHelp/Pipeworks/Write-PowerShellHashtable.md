Write-PowerShellHashtable
-------------------------

### Synopsis
Takes an creates a script to recreate a hashtable

---

### Description

Allows you to take a hashtable and create a hashtable you would embed into a script.

Handles nested hashtables and indents nested hashtables automatically.

---

### Related Links
* [about_hash_tables](about_hash_tables)

---

### Examples
Corrects the presentation of a PowerShell hashtable

```PowerShell
@{Foo='Bar';Baz='Bing';Boo=@{Bam='Blang'}} | Write-PowerShellHashtable
```

---

### Parameters
#### **InputObject**
The hashtable to turn into a script

|Type        |Required|Position|PipelineInput                 |
|------------|--------|--------|------------------------------|
|`[PSObject]`|false   |1       |true (ByValue, ByPropertyName)|

#### **AsScriptBlock**
Returns the content as a script block, rather than a string

|Type      |Required|Position|PipelineInput|Aliases    |
|----------|--------|--------|-------------|-----------|
|`[Switch]`|false   |named   |false        |ScriptBlock|

#### **Sort**
If set, items in the hashtable will be sorted alphabetically

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

---

### Outputs
* [string]

* [ScriptBlock]

---

### Syntax
```PowerShell
Write-PowerShellHashtable [[-InputObject] <PSObject>] [-AsScriptBlock] [-Sort] [<CommonParameters>]
```
