Add-FormatTableIndexParameter
-----------------------------

### Synopsis
Adds a new -IncludeIndex switch parameter to the Format-Table command
to help with array indexing.

---

### Description

---

### Examples
> EXAMPLE 1

```PowerShell
$items = dir
PS > $items | Format-Table -IncludeIndex
PS > $items[4]
```

---

### Notes
This commands builds on New-CommandWrapper, also included in the Windows
PowerShell Cookbook.

---

### Syntax
```PowerShell
Add-FormatTableIndexParameter [<CommonParameters>]
```
