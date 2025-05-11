Get-PathTemporary
-----------------

### Synopsis
Gets the path to the temporary directory.

---

### Description

This function retrieves the path to the system's temporary directory.

---

### Examples
> EXAMPLE 1

```PowerShell
Get-PathTemporary
Output:
C:\Users\Username\AppData\Local\Temp
```

---

### Notes
The function uses [System.IO.Path]::GetTempPath() to get the temporary directory path.

---

### Syntax
```PowerShell
Get-PathTemporary [<CommonParameters>]
```
