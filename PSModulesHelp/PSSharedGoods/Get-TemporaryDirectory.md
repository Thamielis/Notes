Get-TemporaryDirectory
----------------------

### Synopsis
Creates a temporary directory and returns its path.

---

### Description

This function generates a temporary directory with a unique name and returns the full path to the directory.

---

### Examples
> EXAMPLE 1

```PowerShell
$tempDir = Get-TemporaryDirectory
$tempDir
Output:
C:\Users\Username\AppData\Local\Temp\abcde12345
```

---

### Notes
The temporary directory is created using a random string name with specified characteristics.

---

### Syntax
```PowerShell
Get-TemporaryDirectory [<CommonParameters>]
```
