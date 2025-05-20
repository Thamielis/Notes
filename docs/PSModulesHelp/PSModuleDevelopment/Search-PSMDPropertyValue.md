Search-PSMDPropertyValue
------------------------

### Synopsis
Recursively search an object for property values.

---

### Description

Recursively search an object for property values.
This can be useful to determine just where an object stores a given piece of information in scenarios, where objects either have way too many properties or a deeply nested data structure.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-Mailbox Max.Mustermann | Search-PSMDPropertyValue -Object 'max.mustermann@contoso.com' -Match
Searches all properties on the mailbox of Max Mustermann for his email address.
```

---

### Parameters
#### **Value**
The value to search for.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Object]`|false   |1       |false        |

#### **Object**
The object to search.

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|true    |2       |true (ByValue)|

#### **Match**
Search by comparing with regex, rather than equality comparison.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[Switch]`|false   |named   |false        |

#### **Depth**
Default: 3
How deep should the query recurse.
The deeper, the longer it can take on deeply nested objects.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |3       |false        |

---

### Syntax
```PowerShell
Search-PSMDPropertyValue [[-Value] <Object>] [-Object] <Object> [-Match] [[-Depth] <Int32>] [<CommonParameters>]
```
