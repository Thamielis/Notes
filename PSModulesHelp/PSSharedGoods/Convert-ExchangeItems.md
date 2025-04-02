Convert-ExchangeItems
---------------------

### Synopsis
Converts the count of Exchange items to a specified default value if the count is null.

---

### Description

This function takes the count of Exchange items and returns the count if it is not null. If the count is null, it returns the specified default value.

---

### Examples
> EXAMPLE 1

```PowerShell
Convert-ExchangeItems -Count 10 -Default 'No items'
# Returns 10
```
> EXAMPLE 2

```PowerShell
Convert-ExchangeItems -Count $null -Default 'No items'
# Returns 'No items'
```

---

### Parameters
#### **Count**
The count of Exchange items to be processed.

|Type     |Required|Position|PipelineInput|
|---------|--------|--------|-------------|
|`[Int32]`|false   |1       |false        |

#### **Default**
The default value to return if the count is null. Default is 'N/A'.

|Type      |Required|Position|PipelineInput|
|----------|--------|--------|-------------|
|`[String]`|false   |2       |false        |

---

### Notes
General notes

---

### Syntax
```PowerShell
Convert-ExchangeItems [[-Count] <Int32>] [[-Default] <String>] [<CommonParameters>]
```
