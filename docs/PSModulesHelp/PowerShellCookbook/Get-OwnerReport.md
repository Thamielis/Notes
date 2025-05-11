Get-OwnerReport
---------------

### Synopsis
Gets a list of files in the current directory, but with their owner added
to the resulting objects.

---

### Description

---

### Examples
> EXAMPLE 1

Get-OwnerReport | Format-Table Name,LastWriteTime,Owner
Retrieves all files in the current directory, and displays the
Name, LastWriteTime, and Owner

---

### Syntax
```PowerShell
Get-OwnerReport [<CommonParameters>]
```
