Get-HardLink
------------

### Synopsis
List/find files with multiple hardlinks.

---

### Description

works well to find out if one of your hardlinks, created by New-HardLink, have been broken.

---

### Related Links
* [http://www.itninja.com/blog/user/greg_shields](http://www.itninja.com/blog/user/greg_shields)

---

### Examples
> EXAMPLE 1

```PowerShell
Get-HardLink -Path C:\files\myFile.txt
Returns the count and list of hardlinks and boolean value of multiple links
```

---

### Parameters
#### **Path**
Path to file which we would like to list hardlinks for

|Type      |Required|Position|PipelineInput |
|----------|--------|--------|--------------|
|`[Object]`|true    |1       |true (ByValue)|

---

### Notes
Thanks to Greg Shields for this function.

---

### Syntax
```PowerShell
Get-HardLink [-Path] <Object> [<CommonParameters>]
```
