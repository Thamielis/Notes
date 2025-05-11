Get-PathSeparator
-----------------

### Synopsis
Gets the path separator character used by the operating system.

---

### Description

This function retrieves the path separator character used by the operating system. It can be useful for handling file paths in a platform-independent manner.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PathSeparator
Output:
\
```

---

### Notes
The function uses [System.IO.Path]::PathSeparator to get the path separator character.

---

### Syntax
```PowerShell
Get-PathSeparator [<CommonParameters>]
```
